import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: const Text('login.login-with').tr()),
        appBoxH8,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesome5Brands.google,
                color: Colors.blue,
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesome5Brands.apple,
                color: kGrayDark,
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesome5Brands.facebook_f,
                color: Colors.blue,
                size: 32,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
