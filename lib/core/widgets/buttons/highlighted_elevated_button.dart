import 'package:async_button/async_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../config/app_border.dart';
import '../../config/app_progress_indicators.dart';
import '../../config/colors.dart';
import '../wrappers/highlighted_button_wrapper.dart';

class ZadHighlightedAsyncButton extends StatefulWidget {
  ZadHighlightedAsyncButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final Future<bool> Function() onPressed;
  final String text;
  final AsyncBtnStatesController btnStateController = AsyncBtnStatesController();

  @override
  State<ZadHighlightedAsyncButton> createState() => _ZadHighlightedAsyncButtonState();
}

class _ZadHighlightedAsyncButtonState extends State<ZadHighlightedAsyncButton> {
  late AsyncBtnStatesController aBSC;

  @override
  void initState() {
    super.initState();
    aBSC = widget.btnStateController;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HighlightedButtonWrapper(
      //   child: ElevatedButton(
      //     onPressed: onPressed,
      //     child: Text(text).tr(),
      //   ),
      // );
      child: AsyncElevatedBtn(
        asyncBtnStatesController: aBSC,
        onPressed: () async {
          try {
            if (mounted) {
              setState(() {
                aBSC.update(AsyncBtnState.loading);
              });
            }
            // Await your api call here
            // await Future.delayed(const Duration(seconds: 2));
            await widget.onPressed().then(
                  (value) => !value
                      ? null
                      : {
                          if (mounted)
                            {
                              setState(() {
                                aBSC.update(AsyncBtnState.failure);
                                // show error message invalid error using pop up
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      // contentPadding: EdgeInsets.zero,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: appBordRadCir16,
                                      ),
                                      content: const Text('errors.wrongCredentials').tr(),
                                    );
                                  },
                                );
                              })
                            }
                        },
                );
          } catch (e) {
            if (mounted) {
              setState(() {
                aBSC.update(AsyncBtnState.failure);
              });
            }
          }
        },
        // * It is NOT mandatory to define [loadingStyle, successStyle, failureStyle]
        // * if you don't need it.

        // This should ideally be the button's loading state indicator.
        // If [style] or [widget] properties are not defined, we consider the button's
        // corresponding default [style] and [child] property
        // loadingStyle: const AsyncBtnStateStyle(
        //   widget: SizedBox.square(
        //     dimension: 24,
        //     child: appKWhiteCircIndicator,
        //   ),
        // ),

        loadingStyleBuilder: (data) {
          return const AsyncBtnStateStyle(
            widget: SizedBox.square(
              dimension: 24,
              child: appKWhiteCircIndicator,
            ),
          );
        },

        // This should ideally be the button's success state indicator.
        // If [style] or [widget] properties are not defined, we consider the button's
        // corresponding default [style] and [child] property
        successStyle: AsyncBtnStateStyle(
          style: ElevatedButton.styleFrom(
            backgroundColor: kGreen,
            foregroundColor: kWhite,
          ),
          widget: const Icon(Icons.check),
        ),

        // This should ideally be the button's failure state indicator.
        // If [style] or [widget] properties are not defined, we consider the button's
        // corresponding default [style] and [child] property
        failureStyle: AsyncBtnStateStyle(
          style: ElevatedButton.styleFrom(
            backgroundColor: kRed,
            foregroundColor: kWhite,
          ),
          widget: const Icon(Icons.error),
        ),
        child: Text(
          widget.text,
          style: const TextStyle(
            color: kWhite,
          ),
        ).tr(),
      ),
    );
  }
}
