import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/widgets/appbar/zad_app_bar.dart';
import '../../../../core/widgets/drawer/zad_drawer.dart';
import '../widgets/video_body.dart';

class VideoScreen extends ConsumerWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: 'https://www.youtube.com/watch?v=G-R-1rzR3zw&list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech&index=14&pp=iAQB',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: kRed,
        progressColors: const ProgressBarColors(
          playedColor: kRed,
          handleColor: kGray,
        ),
      ),
      builder: (context, player) {
        return Scaffold(
          drawer: const ZADDrawer(),
          body: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              const ZADAppBar(),
              SliverFillRemaining(
                child: VideoScreenBody(
                  player: player,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
