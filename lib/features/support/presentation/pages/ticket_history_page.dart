import 'package:flutter/material.dart';
import '../../../../core/widgets/appbar/zad_app_bar.dart';
import '../../../../core/widgets/drawer/zad_drawer.dart';
import '../widgets/platformSupport/ticket_history_body_platform.dart';

class TicketHistoryPagePlatform extends StatelessWidget {
  const TicketHistoryPagePlatform({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: ZADDrawer(),
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          ZADAppBar(),
          SliverFillRemaining(
            child: TicketHistoryBodyPlatform(),
          ),
        ],
      ),
    );
  }
}
