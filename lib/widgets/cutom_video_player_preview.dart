import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../models/post_model.dart';

class CustomVideoPlayerPreview extends StatefulWidget {
  final Post pst;
  const CustomVideoPlayerPreview({super.key, required this.pst});

  @override
  State<CustomVideoPlayerPreview> createState() =>
      _CustomVideoPlayerPreviewState();
}

class _CustomVideoPlayerPreviewState extends State<CustomVideoPlayerPreview> {
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.asset(widget.pst.videoPath);
    controller.initialize().then((_) {
      setState(
        () {},
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (controller.value.isPlaying) {
            controller.pause();
          } else {
            controller.play();
          }
        });
      },
      child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(controller),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.5),
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.9, 1.0],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
