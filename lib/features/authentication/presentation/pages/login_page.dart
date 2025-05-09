import 'package:flutter/material.dart';

import '../widgets/authentication_page.dart';
import '../widgets/login/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthenticationPage(
      form: LoginBody(),
    );
  }
}
