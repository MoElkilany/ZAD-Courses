import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/appbar/zad_app_bar.dart';
import '../../../../core/widgets/drawer/zad_drawer.dart';
import '../widgets/quiz_results_body.dart';

class QuizResultsScreen extends ConsumerWidget {
  const QuizResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final YoutubePlayerController controller = YoutubePlayerController(
    //   initialVideoId:
    //       'https://www.youtube.com/watch?v=G-R-1rzR3zw&list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech&index=14&pp=iAQB',
    //   flags: const YoutubePlayerFlags(
    //     autoPlay: true,
    //     mute: false,
    //   ),
    // );

    return const Scaffold(
      drawer: ZADDrawer(),
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          ZADAppBar(),
          SliverFillRemaining(
            child: QuizResultsBody(),
          ),
        ],
      ),
    );
  }
}
