//The Home Screen Page Layout

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hangman/Screens/game_menu_page.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    //Full Home Screen Build
    return Scaffold(
        //The Bottom Navigation Bar For Going Forward
        bottomNavigationBar: BottomAppBar(
            color: Colors.grey.shade900,
            child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: IconButton(
                    icon: Icon(Icons.arrow_forward,
                        color: Colors.cyan.shade900, size: 35),
                    onPressed: () {
                      Fluttertoast.showToast(msg: "Choose what you want to do");
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GameMenuPage()));
                    }))),
        //Background Image Setup
        backgroundColor: Colors.grey.shade900,
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/home_screen_background.jpg'),
                    fit: BoxFit.fill)),
            //Writing "Welcome To Hangman" On The Screen
            child: Center(
                child: Column(children: <Widget>[
              const SizedBox(height: 280),
              Row(children: <Widget>[
                const SizedBox(width: 190),
                Text("𝖂𝖊𝖑𝖈𝖔𝖒𝖊",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900,
                        shadows: [
                          Shadow(
                              color: Colors.grey.shade900,
                              blurRadius: 50.0,
                              offset: const Offset(5, 2))
                        ]))
              ]),
              const SizedBox(height: 10),
              Row(children: <Widget>[
                const SizedBox(width: 240),
                Text("𝕿𝖔",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900,
                        shadows: [
                          Shadow(
                              color: Colors.grey.shade900,
                              blurRadius: 50.0,
                              offset: const Offset(5, 2))
                        ]))
              ]),
              const SizedBox(height: 10),
              Row(children: <Widget>[
                const SizedBox(width: 190),
                Text("𝕳𝖆𝖓𝖌𝖒𝖆𝖓",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900,
                        shadows: [
                          Shadow(
                              color: Colors.grey.shade900,
                              blurRadius: 50.0,
                              offset: const Offset(5, 2))
                        ]))
              ])
            ]))));
  }
}
