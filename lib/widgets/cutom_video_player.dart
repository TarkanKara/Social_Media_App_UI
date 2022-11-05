// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import '../models/post_model.dart';

//Packages
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final Post pst;
  const CustomVideoPlayer({super.key, required this.pst});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  //Packages Controller
  late VideoPlayerController controller;

  //İnitialize
  //Paket kullanımına bakınız.
  @override
  void initState() {
    controller = VideoPlayerController.asset(widget.pst.videoPath);
    //Video başlatılmadan önce ekrandan izleniyor olması
    controller.initialize().then((_) {
      setState(
        () {},
      );
    });
    super.initState();
  }

  //dispose
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //AspectRatio 9/16 Ekran
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
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.1, 0.8, 1.0],
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
