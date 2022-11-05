import 'package:flutter/material.dart';
import 'package:social_media_app/widgets/cutom_video_player.dart';
//Models
import '../models/post_model.dart';
//Widgets
import '../widgets/custom_bottom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  //page routeName
  static const routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Post> postss = Post.posts;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const _CustomAppBar(),
      bottomNavigationBar: const CustomBottomAppBar(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: postss.map((pstlist) {
            return CustomVideoPlayer(pst: pstlist);
          }).toList(),
        ),
      ),
    );
  }
}

//with PreferredSizeWidget AppBar
class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton(context, "For You"),
          _buildButton(context, "Following"),
        ],
      ),
    );
  }

  TextButton _buildButton(BuildContext context, String textt) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: const Size(100, 50),
      ),
      onPressed: () {},
      child: Text(
        textt,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
