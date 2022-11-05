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
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(controller),
        ],
      ),
    );
  }
}
