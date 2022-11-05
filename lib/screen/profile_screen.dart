// ignore_for_file: unused_local_variable

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
          "@@${userss.username}",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.red,
                fontSize: 25,
              ),
        ),
      ),
      body: Container(),
    );
  }
}
