import 'package:flutter/material.dart';

import '../screen/home_screen.dart';
import '../screen/profile_screen.dart';
import '../screen/search_screen.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, HomeScreen.routeName);
              },
              color: Colors.white,
              iconSize: 35,
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, SearchScreen.routeName);
              },
              color: Colors.white,
              iconSize: 35,
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              color: Colors.white,
              iconSize: 35,
              icon: const Icon(Icons.add_circle),
            ),
            IconButton(
              onPressed: () {},
              color: Colors.white,
              iconSize: 35,
              icon: const Icon(Icons.message),
            ),
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, ProfileScreen.routeName);
              },
              color: Colors.white,
              iconSize: 35,
              icon: const Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
