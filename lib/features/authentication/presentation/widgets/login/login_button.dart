import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/buttons/highlighted_elevated_button.dart';
import '../../../../../di/initialisation.dart';
import '../../../domain/entities/login/login_request.dart';
import '../../providers/login.dart';
// import 'package:zad_test/features/common/presentation/widgets/restart.dart';
import 'package:zad_test/router/router_utils.dart';

import '../../../../../di/authentication.dart';

class LoginButton extends ConsumerStatefulWidget {
  const LoginButton({
    super.key,
    required this.fkey,
  });
  final GlobalKey<FormState> fkey;

  @override
  ConsumerState<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends ConsumerState<LoginButton> {
  @override
  Widget build(BuildContext context) {
    final login = ref.read(AuthenticationDI.login);
    final username = ref.watch(usernameProvider);
    final password = ref.watch(passwordProvider);
    // return HighlightedButtonWrapper(
    //   child: ElevatedButton(
    //     onPressed: () {
    //       if (fkey.currentState != null) {
    //         if (fkey.currentState!.validate()) {
    //           fkey.currentState!.save();
    //           login(const LoginRequest(
    //               username: 'username', password: ' password'));
    //         }
    //       }
    //     },
    //     child: const Text('buttons.login').tr(),
    //   ),
    // );
    return SizedBox(
      width: double.infinity,
      child: ZadHighlightedAsyncButton(
        onPressed: () async {
          if (widget.fkey.currentState != null) {
            if (widget.fkey.currentState!.validate()) {
              widget.fkey.currentState!.save();
              await login
                  .call(LoginRequest(
                username: username,
                password: password,
              ))
                  .then(
                (value) async {
                  // log('res: $res');
                  final details = value.fold((l) => null, (r) => r);
                  if (details != null) {
                    //set app to be authenticated
                    if (details.success) {
                      await ref.read(AppServices.initializationListnable).init().then(
                        (value) {
                          if (!mounted) return;
                          // ignore: use_build_context_synchronously
                          context.go(
                            AppPages.splash.toPath,
                          );
                        },
                      );
                      return true;
                      // ref.read(AppServices.initializationListnable).authenticated = true;

                      // //get user info
                      // await ref.read(AppSettingsDI.getUserInfo).call(NoParameters()).then((value) {
                      //   ref.watch(AppServices.initializationListnable).init();
                      // });
                    } else {
                      return false;
                    }
                  } else {
                    return false;
                  }
                },
              );
            } else {
              return false;
            }
          }
          return true;
        },
        text: 'buttons.login',
      ),
    );
  }
}
