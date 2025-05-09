import 'package:flutter/material.dart';
import '../../config/colors.dart';

class BackButtonIos extends StatelessWidget {
  const BackButtonIos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: kWhite,
        ));
  }
}
