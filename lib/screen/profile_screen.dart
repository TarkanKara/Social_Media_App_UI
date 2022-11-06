// ignore_for_file: unused_local_variable, unused_element

import 'package:flutter/material.dart';
import 'package:social_media_app/widgets/cutom_video_player_preview.dart';

import '../models/post_model.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  //page routeName
  static const routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //
    //Sadece kullanıcı parametresini alıp yönlendirme işlemleri
    User? userss = ModalRoute.of(context)!.settings.arguments as User?;
    userss = userss ??= User.users[0];

    List<Post> ptss = Post.posts.where(
      (element) {
        return element.user.id == userss!.id;
      },
    ).toList();
    //
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "@@${userss.username}",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: const Color(0xFFFF006E),
                fontSize: 25,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ProfileInformation(users: userss),
            const SizedBox(height: 10),
            _ProfileContent(posts: ptss),
          ],
        ),
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  final List<Post> posts;
  const _ProfileContent({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            indicatorColor: Color(0xFFFF006E),
            tabs: [
              Tab(icon: Icon(Icons.grid_view_rounded)),
              Tab(icon: Icon(Icons.favorite)),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              children: [
                //First Tab
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: posts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 9 / 16,
                  ),
                  itemBuilder: (context, index) {
                    return CustomVideoPlayerPreview(
                      pst: posts[index],
                    );
                  },
                ),
                //Second Tab
                const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInformation extends StatelessWidget {
  final User users;
  const _ProfileInformation({required this.users});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(users.imagePath),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: [
              _buildUserInfo(context, "Following", "${users.followings}"),
              _buildUserInfo(context, "Folowers", "${users.followers}"),
              _buildUserInfo(context, "Likes", "${users.likes}"),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF006E),
                fixedSize: const Size(200, 50),
              ),
              child: Text(
                "Follow",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: const Size(60, 50),
              ),
              child: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Expanded _buildUserInfo(BuildContext context, String type, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            type,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 1.5,
                ),
          ),
        ],
      ),
    );
  }
}
