import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/login.dart';
import '../../../../../main.dart';

import '../common/field_builder.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({
    super.key,
    required this.fkey,
  });

  final GlobalKey<FormState> fkey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Form(
      key: fkey,
      child: SizedBox(
        width: isLandscape ? 500 : null,
        child: Column(
          children: [
            buildAuthenticationField(
              Text(
                'labels.username',
                style: theme.textTheme.labelLarge,
              ).tr(),
              TextFormField(
                onChanged: (value) => ref.read(usernameProvider.notifier).setUsername(value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'errors.requiredField'.tr();
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            buildAuthenticationField(
              Text(
                'labels.password',
                style: theme.textTheme.labelLarge,
              ).tr(),
              TextFormField(
                onChanged: (value) => ref.read(passwordProvider.notifier).setPassword(value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'errors.requiredField'.tr();
                  }
                  return null;
                },
                obscureText: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
