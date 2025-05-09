import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import '../../../../core/widgets/appbar/zad_app_bar.dart';
import '../../../../core/widgets/drawer/zad_drawer.dart';
import '../widgets/new_ticket_body.dart';

class NewTicketPage extends StatelessWidget {
  const NewTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: ZADDrawer(),
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          ZADAppBar(),
          SliverFillRemaining(
            child: OKToast(
              child: NewTicketBody(),
            ),
          ),
        ],
      ),
    );
  }
}
