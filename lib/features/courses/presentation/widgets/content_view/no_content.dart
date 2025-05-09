import 'package:flutter/material.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';

class NoContent extends StatelessWidget {
  const NoContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBoxH8,
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: appBordRadCir8,
            border: Border.all(
              color: kSecondary,
              width: 2,
            ),
          ),
          child: const Padding(
            padding: appPaddingAll8,
            child: Text(
              'content.no_content',
              style: TextStyle(
                color: kDark,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        appBoxH8,
      ],
    );
  }
}
