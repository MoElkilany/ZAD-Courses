import 'package:flutter/material.dart';
import '../../config/app_font_size.dart';
import '../../config/app_sized_box.dart';
import '../../config/paths.dart';
import '../../../main.dart';

class ContentsNone extends StatelessWidget {
  const ContentsNone({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: isLandscape ? appFontSizeHuge * 1.4 : appFontSizeHuge,
          ),
        ),
        appSizeBoxH02,
        Container(
          width: width * (isLandscape ? 0.2 : 0.7),
          height: width * (isLandscape ? 0.2 : 0.7),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.green[300]!,
                Colors.green[100]!,
              ],
            ),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            AppPaths.noContent,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
