import 'package:flutter/material.dart';
import '../../config/app_border.dart';
import '../../config/app_sized_box.dart';

import 'zad_dawer_items.dart';

class ZADDrawer extends StatelessWidget {
  const ZADDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      backgroundColor: theme.colorScheme.secondary,
      shape: const RoundedRectangleBorder(
        borderRadius: appBordRadHR4,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              appBoxH20,
              Image.asset(
                'assets/slogan.png',
                height: 60,
              ),
              appBoxH40,
              const ZadDrawerItems(),
            ],
          ),
        ),
      ),
    );
  }
}
