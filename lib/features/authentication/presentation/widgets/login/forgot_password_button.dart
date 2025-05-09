import 'package:flutter/material.dart';
import '../../../../../core/widgets/buttons/text_button.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ZadTextButton(
        onPressed: () {},
        text: 'buttons.forgot-password',
      ),
    );
  }
}
