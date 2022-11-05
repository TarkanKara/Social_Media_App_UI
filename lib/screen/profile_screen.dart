// ignore_for_file: unused_local_variable, unused_element

import 'package:flutter/material.dart';

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
          "@@${userss.username} - ${userss.likes} likes",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.red,
                fontSize: 25,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [_ProfileInformation(users: userss)],
        ),
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
