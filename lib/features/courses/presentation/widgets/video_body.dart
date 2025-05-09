import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/app_font_size.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_size.dart';
import '../../../../core/config/app_sized_box.dart';

class VideoScreenBody extends StatefulWidget {
  const VideoScreenBody({super.key, required this.player});

  final Widget player;

  @override
  State<VideoScreenBody> createState() => _VideoScreenBodyState();
}

class _VideoScreenBodyState extends State<VideoScreenBody> {
  @override
  Widget build(BuildContext context) {
    final double height = AppSize.height;
    final double width = AppSize.width;
    return SizedBox(
      width: width,
      child: Padding(
        padding: appPaddingTLR8,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBoxH16,
              const AutoSizeText(
                "Video Title",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              appBoxH20,
              SizedBox(
                height: height * 0.3,
                child: widget.player,
              ),
              appBoxH20,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: AutoSizeText(
                  "In this video, we'll explore the magical world of Hogwarts and learn about the enchanting spells and potions used by the students and professors alike. From the classic 'Wingardium Leviosa' to the more complex 'Expecto Patronum', we'll delve into the intricacies of each spell and discover their unique properties. Join us on this journey of wizardry and wonder as we uncover the secrets of the wizarding world. Lumos!" *
                      10,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                  maxFontSize: appMaxSubTitleFontSize,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
              appBoxH20,
            ],
          ),
        ),
      ),
    );
  }
}
