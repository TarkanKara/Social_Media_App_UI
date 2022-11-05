// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../models/post_model.dart';

//Packages
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
    return VisibilityDetector(
      key: Key(controller.dataSource),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.5) {
          controller.play();
        } else {
          if (mounted) {
            controller.pause();
          }
        }
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
          });
        },
        //AspectRatio 9/16 Ekran
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
              _buildVideoCaptions(context),
              _buildVideoActions(context),
            ],
          ),
        ),
      ),
    );
  }

  //Methods
  Align _buildVideoActions(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: controller.value.size.height,
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            _VideoActions(
              iconn: Icons.favorite,
              valuee: "11.4K",
              colorr: Colors.red,
            ),
            SizedBox(height: 10),
            _VideoActions(
              iconn: Icons.comment,
              valuee: "5K",
              colorr: Colors.green,
            ),
            SizedBox(height: 10),
            _VideoActions(
              iconn: Icons.forward_rounded,
              valuee: "100B",
              colorr: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  //Methods
  Align _buildVideoCaptions(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        height: 125,
        width: MediaQuery.of(context).size.width * 0.75,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "@@${widget.pst.user.username}",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.greenAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.pst.caption,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

//Widget
class _VideoActions extends StatelessWidget {
  final IconData iconn;
  final String valuee;
  final Color colorr;

  const _VideoActions({
    Key? key,
    required this.iconn,
    required this.valuee,
    required this.colorr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: Ink(
            decoration: ShapeDecoration(
              color: colorr,
              shape: const CircleBorder(),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(iconn),
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          valuee,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
