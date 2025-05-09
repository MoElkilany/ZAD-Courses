import 'dart:developer';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../core/config/endpoints.dart';
import '../../../../../core/usecase/no_parameters.dart';
import '../../../../../core/widgets/error/error_page.dart';
import '../../../../../di/app_settings.dart';
import '../../../../../di/initialisation.dart';
import '../../providers/zoom_provider.dart';
// import 'package:webf/webf.dart';
import 'package:zad_test/router/router_utils.dart';

import 'package:desktop_webview_window/desktop_webview_window.dart';

class ZoomBodyDesktop extends ConsumerStatefulWidget {
  const ZoomBodyDesktop({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ZoomBodyDesktopState();
}

class _ZoomBodyDesktopState extends ConsumerState<ZoomBodyDesktop> {
  bool? _webviewAvailable;
  @override
  void initState() {
    super.initState();
    WebviewWindow.isWebviewAvailable().then((value) {
      setState(() {
        _webviewAvailable = value;
      });
    });
    launchMeeting();
  }

  Future<void> launchMeeting() async {
    if (_webviewAvailable == null || _webviewAvailable == false) {
      log('WebView2 Runtime is not installed');
    }
    final sessionId = ref.read(sessionIdProvider);

    // log('Webview Available = $_webviewAvailable');
    final webview = await WebviewWindow.create(
      configuration: CreateConfiguration(
        windowHeight: 720,
        windowWidth: 1280,
        title: "Zad Meeting",
        titleBarTopPadding: Platform.isMacOS ? 20 : 0,
        userDataFolderWindows: '${(await getApplicationSupportDirectory()).path}-data',
      ),
    );

    final url = '${Endpoints.baseUrl}${Endpoints.sessionDetails}/$sessionId';
    final authInfo = (await ref.read(AppSettingsDI.getAuthInfo).call(NoParameters())).fold((l) => null, (r) => r);
    if (authInfo == null || authInfo.token == '') {
      await ref.read(AppSettingsDI.clearAuthInfo).call(NoParameters());
      await ref.read(AppSettingsDI.clearUserInfo).call(NoParameters()).then((value) {
        ref.read(AppServices.initializationListnable).authenticated = false;
        if (!mounted) return;
        context.go(AppPages.login.toPath);
      });
      return;
    }
    //Perform a post request to the server that will return an HTML page to be loaded in the webview using ajax request.
    final javaScriptToEval = """
      const desiredUrl = '${Endpoints.baseUrl}/login'; 

      // Check if the current URL matches the desired URL
      if (window.location.href === desiredUrl) {
        // Close the window
        window.close();
      } else {
        // Do something else if the URLs don't match
        console.log('URL does not match the desired URL.');
      }
      // Create a FormData object
      var formData = new FormData();
      formData.append('username', 'teyagar214@v1zw.com');
      formData.append('password', '123123123');
      formData.append('id', $sessionId);
      var myHeaders = new Headers();
      myHeaders.append('Content-Type', 'application/json');
      myHeaders.append('Authorization', 'Bearer ${authInfo.token}');

      fetch('$url', {
          method: 'GET',
          headers: myHeaders,
      })
          .then(response => {
              if (!response.ok) {
                  throw new Error('Network response was not ok');
              }
              return response.text();
          })
          .then(responseText => {
              // Successful response, handle the data as needed
              console.log('Response:', responseText);

              // Replace the entire page content with the response
              document.write(responseText);
          })
          .catch(error => {
              // Handle errors
              console.error('Error:', error.message);
          });
    """;

    webview
      ..setApplicationNameForUserAgent("Zad/1.0.0")
      ..launch(Endpoints.baseUrl + Endpoints.blank)
      ..addScriptToExecuteOnDocumentCreated(javaScriptToEval)
      ..addOnUrlRequestCallback(
        (url) {
          log(url);
          if (kDebugMode) {
            print("ZAKA: $url");
          }
          if (url.contains('${Endpoints.baseUrl}/login') || url.contains('${Endpoints.baseUrl}/panel')) {
            webview.close();
            context.go(AppPages.learning.toPath);
          }
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    final sessionDetailsRes = ref.watch(sessionDetailsProvider);
    final sessionId = ref.read(sessionIdProvider);
    return sessionDetailsRes.when(
      data: (data) {
        final sDetails = data.fold((l) => null, (r) => r);
        if (sDetails == null || sessionId == null) {
          return ErrorPage(
            errorMessage: 'errors.serverError'.tr(),
            showRefresh: false,
          );
        }

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
