import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/appbar/zad_app_bar.dart';
import '../../../../core/widgets/drawer/zad_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      drawer: ZADDrawer(),
      body: CustomScrollView(
        slivers: [
          ZADAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(height: 1000),
          ),
        ],
      ),
    );
  }
}
