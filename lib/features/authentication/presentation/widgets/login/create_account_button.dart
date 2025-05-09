import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/buttons/text_button.dart';

import '../../../../../router/router_utils.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('login.dont-have-account').tr(),
        ZadTextButton(
          onPressed: () {
            context.go(AppPages.register.toPath);
          },
          text: 'buttons.create-account',
        ),
      ],
    );
  }
}
