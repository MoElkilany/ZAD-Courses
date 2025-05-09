import 'package:flutter/material.dart';

class AuthenticationAppBar extends StatelessWidget {
  const AuthenticationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: 200,
      toolbarHeight: 60,
      flexibleSpace: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/logo.png',
            height: 100,
          ),
        ),
      ),
    );
  }
}
