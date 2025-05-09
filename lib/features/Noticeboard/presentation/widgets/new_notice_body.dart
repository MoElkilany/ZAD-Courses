import 'package:async_button/async_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';
import '../../../../core/config/app_font_size.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_progress_indicators.dart';
import '../../../../core/config/app_sized_box.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/types/app_types.dart';
import '../../../../core/widgets/error/error_page.dart';
import '../../../../di/noticeboard.dart';
import '../../domain/entities/new_notice_options.dart';
import '../providers/new_notice_provider.dart';
import '../../../../router/router_utils.dart';

class NewNoticeBody extends ConsumerStatefulWidget {
  const NewNoticeBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewNoticeBodyState();
}

class _NewNoticeBodyState extends ConsumerState<NewNoticeBody> {
  final AsyncBtnStatesController asyncBtnStatesController = AsyncBtnStatesController();
  @override
  Widget build(BuildContext context) {
    final newNoticeController = ref.watch(newNoticeControllerProvider.notifier);
    final getNewNoticeOptions = ref.watch(
      getNewNoticeOptionsProvider,
    );
    late NewNoticeOptions noticeOptions;

    return getNewNoticeOptions.when(
      data: (data) {
        final res = data.fold((l) => null, (r) => r);
        // log(res.toString());
        if (res == null) {
          return Center(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ErrorPage(
                errorMessage: 'errors.serverError'.tr(),
                showRefresh: false,
              ),
            ),
          );
        }
        noticeOptions = res;

        return Padding(
          padding: appPaddingAll8,
          child: Form(
            key: newNoticeController.formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'noticeboard.newNotice'.tr(),
                    style: const TextStyle(
                      fontSize: appFontSizeVeryLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  appBoxH20,
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'support.required'.tr();
                      }
                      return null;
                    },
                    controller: newNoticeController.subjectController,
                    decoration: InputDecoration(
                      labelText: 'noticeboard.title'.tr(),
                    ),
                    maxLines: 1,
                  ),
                  appBoxH20,
                  DropdownButtonFormField<NoticeType>(
                    decoration: InputDecoration(
                      labelText: 'noticeboard.noticeType'.tr(),
                    ),
                    value: newNoticeController.noticeType,
                    items: [
                      DropdownMenuItem(
                        value: NoticeType.general,
                        child: Text('noticeboard.general'.tr()),
                      ),
                      DropdownMenuItem(
                        value: NoticeType.course,
                        child: Text('noticeboard.course'.tr()),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        newNoticeController.setNoticeType(value);
                        setState(() {});
                      }
                    },
                  ),
                  appBoxH8,
                  const Divider(),
                  appBoxH8,
                  newNoticeController.noticeType == NoticeType.course && noticeOptions.courses.isNotEmpty
                      ? Column(
                          children: [
                            DropdownButtonFormField<int>(
                              decoration: InputDecoration(
                                labelText: 'noticeboard.selectCourse'.tr(),
                              ),
                              value: newNoticeController.course,
                              //map courses from list of tuples to dropdown items
                              items: noticeOptions.courses.map((e) {
                                return DropdownMenuItem(
                                  value: e.value1,
                                  child: Text(e.value2),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  newNoticeController.setNoticeCourse(value);
                                  setState(() {});
                                }
                              },
                            ),
                          ],
                        )
                      : appBoxH16,
                  appBoxH8,
                  if (newNoticeController.noticeType == NoticeType.course && noticeOptions.courses.isNotEmpty) const Divider(),
                  appBoxH8,
                  TextFormField(
                    controller: newNoticeController.messageController,
                    decoration: InputDecoration(
                      labelText: 'noticeboard.message'.tr(),
                      alignLabelWithHint: true,
                      contentPadding: appPaddingAll8,
                    ),
                    maxLines: null,
                    minLines: 5,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'support.required'.tr();
                      }
                      return null;
                    },
                  ),
                  appBoxH20,
                  //submit button
                  SizedBox(
                    width: double.infinity,
                    child: AsyncElevatedBtn(
                      asyncBtnStatesController: asyncBtnStatesController,
                      onPressed: () async {
                        //validate form
                        if (!newNoticeController.formKey.currentState!.validate()) {
                          return;
                        }
                        asyncBtnStatesController.update(AsyncBtnState.loading);

                        final submit = ref.watch(NoticeboardDI.submitNewNotice);
                        final value = await submit(newNoticeController.getTicket());
                        final wasSuccessful = value.fold((l) => false, (r) => r);
                        if (wasSuccessful) {
                          asyncBtnStatesController.update(AsyncBtnState.success);
                          await Future.delayed(const Duration(seconds: 1)).then(
                            (value) {
                              if (!mounted) return;
                              // ignore: use_build_context_synchronously
                              context.go(AppPages.noticeboard.toPath);
                            },
                          );
                        } else {
                          //toast failed, try again
                          showToast(
                            'errors.requestError'.tr(),
                            position: ToastPosition.bottom,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSecondary,
                      ),
                      loadingStyleBuilder: (data) {
                        return const AsyncBtnStateStyle(
                          widget: appKWhiteCircIndicator,
                        );
                      },
                      successStyleBuilder: (data) {
                        return const AsyncBtnStateStyle(
                          widget: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        );
                      },
                      child: Text(
                        'noticeboard.postNotice'.tr(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ErrorPage(
              errorMessage: 'errors.serverError'.tr(),
              showRefresh: false,
            ),
          ),
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
