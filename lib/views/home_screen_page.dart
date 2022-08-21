//The Home Screen Page Layout

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hangman/views/game_menu_page.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    //Full Home Screen Build
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/backgrounds/home.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //The Bottom Navigation Bar For Going Forward
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.cyan.shade900,
                size: 35,
              ),
              onPressed: () {
                Fluttertoast.showToast(msg: "Choose what you want to do");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameMenuPage(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
