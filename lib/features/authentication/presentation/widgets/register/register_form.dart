import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/app_sized_box.dart';

import '../../../../../core/config/colors.dart';
import '../common/field_builder.dart';
import '../../../../../core/widgets/wrappers/highlighted_button_wrapper.dart';
import '../../../../../router/router_utils.dart';
import '../common/or_divider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final fkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            appBoxH16,
            title(theme),
            appBoxH40,
            form(theme),
            appBoxH16,
            loginButton(),
            appBoxH16,
            const OrDivider(),
            appBoxH30,
            loginInstead(),
            appBoxH30,
          ],
        ),
      ),
    );
  }

  Row loginInstead() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('login.already-have-account').tr(),
        TextButton(
          onPressed: () {
            context.go(AppPages.login.toPath);
          },
          child: const Text(
            'buttons.login',
            style: TextStyle(
              color: kDark,
              fontWeight: FontWeight.bold,
            ),
          ).tr(),
        ),
      ],
    );
  }

  HighlightedButtonWrapper loginButton() {
    return HighlightedButtonWrapper(
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('buttons.register').tr(),
      ),
    );
  }

  Form form(ThemeData theme) {
    return Form(
      key: fkey,
      child: Column(
        children: [
          buildAuthenticationField(
            Text(
              'labels.email',
              style: theme.textTheme.labelLarge,
            ).tr(),
            TextFormField(),
          ),
          buildAuthenticationField(
            Text(
              'labels.phone-number',
              style: theme.textTheme.labelLarge,
            ).tr(),
            TextFormField(),
          ),
          buildAuthenticationField(
            Text(
              'labels.full-name',
              style: theme.textTheme.labelLarge,
            ).tr(),
            TextFormField(),
          ),
          buildAuthenticationField(
            Text(
              'labels.password',
              style: theme.textTheme.labelLarge,
            ).tr(),
            TextFormField(),
          ),
          buildAuthenticationField(
            Text(
              'labels.confirm-password',
              style: theme.textTheme.labelLarge,
            ).tr(),
            TextFormField(),
          ),
          buildAuthenticationField(
            Text(
              'labels.parent-email',
              style: theme.textTheme.labelLarge,
            ).tr(),
            TextFormField(),
          ),
          buildAuthenticationField(
            Text(
              'labels.parent-email',
              style: theme.textTheme.labelLarge,
            ).tr(),
            TextFormField(),
          ),
          buildAuthenticationField(
            Text(
              'labels.time-zone',
              style: theme.textTheme.labelLarge,
            ).tr(),
            TextFormField(),
          ),
        ],
      ),
    );
  }

  Center title(ThemeData theme) {
    return Center(
      child: Text(
        'titles.register',
        style: theme.textTheme.headlineLarge,
      ).tr(),
    );
  }
}
