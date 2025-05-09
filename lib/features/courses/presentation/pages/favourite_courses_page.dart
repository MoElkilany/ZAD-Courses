import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/appbar/zad_app_bar.dart';
import '../../../../core/widgets/drawer/zad_drawer.dart';
import '../widgets/favourite_courses_body.dart';

class FavouriteCoursesScreen extends ConsumerWidget {
  const FavouriteCoursesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      drawer: ZADDrawer(),
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          ZADAppBar(),
          SliverFillRemaining(
            child: FavouriteCoursesBody(),
          ),
        ],
      ),
    );
  }
}
