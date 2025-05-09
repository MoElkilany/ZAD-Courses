import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/appbar/zad_app_bar.dart';
import '../../../../core/widgets/drawer/zad_drawer.dart';
import '../widgets/zoom/zoom_body_desktop.dart';
import '../widgets/zoom/zoom_body_mobile.dart';
import '../../../../main.dart';

class ZoomScreen extends ConsumerWidget {
  const ZoomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: const ZADDrawer(),
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          const ZADAppBar(),
          SliverFillRemaining(
            child: isLandscape ? const ZoomBodyDesktop() : const ZoomBodyMobile(),
          ),
        ],
      ),
    );
  }
}
