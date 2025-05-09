import 'package:flutter/material.dart';

import '../../../../core/config/app_progress_indicators.dart';
import '../../../../core/config/app_sized_box.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            height: 100,
          ),
          appBoxH50,
          appDefaultCircIndicator,
        ],
      ),
    );
  }
}
