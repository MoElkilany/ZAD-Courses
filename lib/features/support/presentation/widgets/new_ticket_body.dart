import 'package:async_button/async_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
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
import '../../../../di/support.dart';
import '../../domain/entities/new_ticket_options.dart';
import '../providers/new_ticket_provider.dart';
import '../../../../router/router_utils.dart';

class NewTicketBody extends ConsumerStatefulWidget {
  const NewTicketBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewTicketBodyState();
}

class _NewTicketBodyState extends ConsumerState<NewTicketBody> {
  final AsyncBtnStatesController asyncBtnStatesController = AsyncBtnStatesController();
  @override
  Widget build(BuildContext context) {
    final newTicketController = ref.watch(newTicketControllerProvider.notifier);
    final getNewTicketOptions = ref.watch(
      getNewTicketOptionsProvider,
    );
    late NewTicketOptions ticketOptions;

    return getNewTicketOptions.when(
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
        ticketOptions = res;

        return Padding(
          padding: appPaddingAll8,
          child: Form(
            key: newTicketController.formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'support.newTicket'.tr(),
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
                    controller: newTicketController.subjectController,
                    decoration: InputDecoration(
                      labelText: 'support.subject'.tr(),
                    ),
                    maxLines: 1,
                  ),
                  appBoxH20,
                  DropdownButtonFormField<TicketType>(
                    decoration: InputDecoration(
                      labelText: 'support.ticketType'.tr(),
                    ),
                    value: newTicketController.ticketType,
                    items: [
                      DropdownMenuItem(
                        value: TicketType.academic,
                        child: Text('support.academicSupport'.tr()),
                      ),
                      DropdownMenuItem(
                        value: TicketType.plataform,
                        child: Text('support.platformSupport'.tr()),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        newTicketController.setTicketType(value);
                        setState(() {});
                      }
                    },
                  ),
                  appBoxH8,
                  const Divider(),
                  appBoxH8,
                  newTicketController.ticketType == TicketType.academic && ticketOptions.courses.isNotEmpty
                      ? Column(
                          children: [
                            DropdownButtonFormField<int>(
                              decoration: InputDecoration(
                                labelText: 'support.selectCourse'.tr(),
                              ),
                              value: newTicketController.course,
                              //map courses from list of tuples to dropdown items
                              items: ticketOptions.courses.map((e) {
                                return DropdownMenuItem(
                                  value: e.value1,
                                  child: Text(e.value2),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  newTicketController.setTicketCourse(value);
                                  setState(() {});
                                }
                              },
                            ),
                            appBoxH16,
                            DropdownButtonFormField<int>(
                              decoration: InputDecoration(
                                labelText: 'support.selectRole'.tr(),
                              ),
                              value: newTicketController.role,
                              //map roles from list of tuples to dropdown items
                              items: ticketOptions.roles.map((e) {
                                return DropdownMenuItem(
                                  value: e.value1,
                                  child: Text(e.value2),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  newTicketController.setTicketRole(value);
                                  setState(() {});
                                }
                              },
                            ),
                          ],
                        )
                      : DropdownButtonFormField<int>(
                          decoration: InputDecoration(
                            labelText: 'support.selectDepartment'.tr(),
                          ),
                          value: newTicketController.department,
                          //map departments from list of tuples to dropdown items
                          items: ticketOptions.departments.map((e) {
                            return DropdownMenuItem(
                              value: e.value1,
                              child: Text(e.value2),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              newTicketController.setTicketDepartment(value);
                              setState(() {});
                            }
                          },
                        ),
                  appBoxH8,
                  const Divider(),
                  appBoxH8,
                  TextFormField(
                    controller: newTicketController.messageController,
                    decoration: InputDecoration(
                      labelText: 'support.message'.tr(),
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
                  //attach a file
                  newTicketController.attachments.isEmpty
                      ? InkWell(
                          onTap: () async {
                            await pickFiles(newTicketController);
                          },
                          child: Padding(
                            padding: appPaddingSymV8,
                            child: Row(
                              children: [
                                const Icon(Icons.attach_file),
                                appBoxW8,
                                Text('support.attachFile'.tr()),
                              ],
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () async {
                            await pickFiles(newTicketController);
                          },
                          child: Padding(
                            padding: appPaddingSymV8,
                            child: Row(
                              children: [
                                const Icon(Icons.attach_file),
                                appBoxW8,
                                //show number of attachments selected
                                Text('${newTicketController.attachments.length} ${'support.attachments'.tr()}'),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    newTicketController.resetTicketAttachments();
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.close),
                                ),
                              ],
                            ),
                          ),
                        ),

                  appBoxH20,
                  //submit button
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: AsyncElevatedBtn(
                        asyncBtnStatesController: asyncBtnStatesController,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kSecondary,
                        ),
                        onPressed: () async {
                          //validate form
                          if (!newTicketController.formKey.currentState!.validate()) {
                            return;
                          }
                          asyncBtnStatesController.update(AsyncBtnState.loading);

                          final submit = ref.watch(SupportDI.submitNewTicket);
                          final value = await submit(newTicketController.getTicket());
                          final wasSuccessful = value.fold((l) => false, (r) => r);
                          if (wasSuccessful) {
                            asyncBtnStatesController.update(AsyncBtnState.success);
                            await Future.delayed(const Duration(seconds: 1)).then((value) {
                              if (!mounted) return;
                              // ignore: use_build_context_synchronously
                              context.go(AppPages.dashboard.toPath);
                            });
                          } else {
                            //toast failed, try again
                            showToast(
                              'errors.requestError'.tr(),
                              position: ToastPosition.bottom,
                            );
                          }
                        },
                        styleBuilder: (data) => AsyncBtnStateStyle(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kSecondary,
                          ),
                        ),
                        child: Text(
                          'support.submit'.tr(),
                          style: const TextStyle(
                            color: kWhite,
                            fontSize: appFontSizeLarge,
                          ),
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

  /// Pick files from device, and set them to the [newTicketController].
  Future<void> pickFiles(NewTicketController newTicketController) async {
    //reset attachments to avoid duplicates or old files
    newTicketController.resetTicketAttachments();

    //pick files from device. [allowMultiple] is set to false to only allow one file
    //* Change to true to allow multiple files, NO NEED TO CHANGE ANYTHING ELSE
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);

    //check if files were picked and set them to the controller
    if (result != null) {
      List<String?> files = result.paths.map((path) {
        return path;
      }).toList();

      if (files.isNotEmpty) {
        //remove nulls
        List<String> attachments = [];
        for (var file in files) {
          if (file != null) {
            attachments.add(file);
          }
        }
        newTicketController.setTicketAttachments(attachments);
        setState(() {});
      }
    } else {
      // User canceled the picker
      setState(() {});
    }
  }
}
