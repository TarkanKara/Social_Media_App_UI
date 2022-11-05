import 'package:flutter/material.dart';

import 'screen/home_screen.dart';
import 'screen/profile_screen.dart';
import 'screen/search_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social App',
      initialRoute: "/home",
      routes: {
        "/home": (context) => const HomeScreen(),
        "/search": (context) => const SearchScreen(),
        "/profile": (context) => const ProfileScreen(),
      },
    );
  }
}
