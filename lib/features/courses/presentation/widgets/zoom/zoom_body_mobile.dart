import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

// import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:zad_test/core/config/app_font_size.dart';
// import 'package:flutter_zoom_sdk/zoom_options.dart';
// import 'package:flutter_zoom_sdk/zoom_view.dart';
import 'package:zad_test/core/config/app_progress_indicators.dart';
import 'package:zad_test/core/config/app_sized_box.dart';
import 'package:zad_test/core/config/colors.dart';
import 'package:zad_test/core/config/endpoints.dart';
import 'package:zad_test/core/usecase/no_parameters.dart';
import 'package:zad_test/core/widgets/error/error_page.dart';
import 'package:zad_test/di/app_settings.dart';
import 'package:zad_test/di/initialisation.dart';
import 'package:zad_test/features/app_parent/domain/entities/auth_info.dart';
// import 'package:zad_test/features/courses/domain/entities/session_details.dart';
import 'package:zad_test/features/courses/presentation/providers/zoom_provider.dart';
import 'package:zad_test/router/router_utils.dart';

class ZoomBodyMobile extends ConsumerStatefulWidget {
  const ZoomBodyMobile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ZoomBodyMobileState();
}

class _ZoomBodyMobileState extends ConsumerState<ZoomBodyMobile> {
  late final WebViewController _controller;
  late final AuthInfo? authInfo;

  Future<void> prepareMeeting() async {
    authInfo = (await ref.read(AppSettingsDI.getAuthInfo).call(NoParameters())).fold((l) => null, (r) => r);
    if (authInfo == null || authInfo!.token == '') {
      await ref.read(AppSettingsDI.clearAuthInfo).call(NoParameters());
      await ref.read(AppSettingsDI.clearUserInfo).call(NoParameters()).then((value) {
        ref.read(AppServices.initializationListnable).authenticated = false;
        if (!mounted) return;
        context.go(AppPages.login.toPath);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    prepareMeeting();
    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller = WebViewController.fromPlatformCreationParams(params, onPermissionRequest: (resources) async {
      return resources.grant();
    });
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onUrlChange: (UrlChange change) {
            //if redirected to Login page, then close the WebView
            debugPrint('url change to ${change.url}');
            if (change.url != null && change.url!.contains('${Endpoints.baseUrl}/login')) {
              context.go(AppPages.learning.toPath);
            }
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      );

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController).setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    final sessionDetailsRes = ref.watch(sessionDetailsProvider);
    final sessionId = ref.read(sessionIdProvider);

    return sessionDetailsRes.when(
      data: (data) {
        final sDetails = data.fold((l) => null, (r) => r);
        if (sDetails == null || authInfo == null || sessionId == null) {
          return ErrorPage(
            errorMessage: 'errors.serverError'.tr(),
            showRefresh: false,
          );
        }
        _controller.loadRequest(
          Uri.parse(
            '${Endpoints.baseUrl}${Endpoints.sessionDetails}/$sessionId',
          ),
          method: LoadRequestMethod.get,
          //bearer token headers
          headers: {
            'Authorization': 'Bearer ${authInfo!.token}',
          },
        );

        return Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: AutoSizeText(
                  'learning.zoomStarted'.tr(),
                  style: const TextStyle(fontWeight: FontWeight.bold, color: kDark, fontSize: appFontSizeLarge),
                )),
                appSizeBoxH01,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: AutoSizeText(
                      'learning.zoomLoading'.tr(),
                      style: TextStyle(
                        color: kDark.withOpacity(0.5),
                        fontSize: appFontSizeMedium,
                      ),
                    )),
                    appSizeBoxW01,
                    Icon(
                      Icons.arrow_outward_rounded,
                      color: kDark.withOpacity(0.5),
                    ),
                  ],
                ),
              ],
            ),
            WebViewWidget(
              controller: _controller,
            )
          ],
        );
        // joinMeeting(context, sDetails);
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(error.toString()),
        );
      },
      loading: () {
        return const Center(
          child: appDefaultCircIndicator,
        );
      },
    );
  }
}
