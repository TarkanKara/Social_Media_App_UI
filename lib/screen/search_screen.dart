import 'package:flutter/material.dart';
import 'package:social_media_app/widgets/custom_bottom_app_bar.dart';

class SearchScreen extends StatelessWidget {
  //page routeName
  static const routeName = "/search";
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, // Remove back button
        centerTitle: true,
        title: Text(
          "Discover",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
