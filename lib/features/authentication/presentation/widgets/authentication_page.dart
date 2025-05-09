import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication_app_bar.dart';

class AuthenticationPage extends ConsumerWidget {
  const AuthenticationPage({
    super.key,
    required this.form,
  });
  final Widget form;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AuthenticationAppBar(),
          form,
        ],
      ),
    );
  }
}
