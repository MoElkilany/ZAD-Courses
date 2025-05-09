import 'package:flutter/material.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../main.dart';

// import '../common/or_divider.dart';
// import 'create_account_button.dart';
// import 'forgot_password_button.dart';
// import 'login_options.dart';
import 'login_button.dart';
import 'login_form.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final fkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          width: isLandscape ? 500 : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              appBoxH16,
              // Center(
              //   child: Text(
              //     'titles.login',
              //     style: theme.textTheme.headlineLarge,
              //   ).tr(),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              LoginForm(fkey: fkey),
              appBoxH16,
              SizedBox(
                width: isLandscape ? 500 : null,
                child: LoginButton(fkey: fkey),
              ),
              // appBoxH16,
              // const OrDivider(),
              // appBoxH30,
              // const LoginOptions(),
              // appBoxH30,
              // const ForgotPasswordButton(),
              // const CreateAccountButton(),
              // appBoxH30,
            ],
          ),
        ),
      ),
    );
  }
}
