import 'package:flutter/material.dart';

import '../widgets/authentication_page.dart';
import '../widgets/register/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthenticationPage(
      form: RegisterForm(),
    );
  }
}
