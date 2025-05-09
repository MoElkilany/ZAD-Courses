import 'package:flutter/material.dart';
import '../../../../core/widgets/appbar/zad_app_bar.dart';
import '../../../../core/widgets/drawer/zad_drawer.dart';
import '../widgets/profile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ZADDrawer(),
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        scrollBehavior: const ScrollBehavior().copyWith(
          scrollbars: false,
        ),
        slivers: const [
          ZADAppBar(),
          SliverFillRemaining(
            child: ProfileBody(),
          ),
        ],
      ),
    );
  }
}
