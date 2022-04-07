//Game Menu Screen Layout

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hangman/gameLogic.dart';
import 'package:hangman/global_chat_page.dart';
import 'package:hangman/hangman_screen.dart';
import 'package:hangman/home_screen_page.dart';
import 'package:hangman/ranking_page.dart';
import 'package:hangman/check_users_login_activity.dart';
import 'package:hangman/user_profile_page.dart';

class GameMenuPage extends StatefulWidget {
  const GameMenuPage({Key? key}) : super(key: key);

  @override
  State<GameMenuPage> createState() => _GameMenuState();
}

class _GameMenuState extends State<GameMenuPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          floatingActionButton: Row(children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: FloatingActionButton(
                    backgroundColor: Colors.tealAccent.shade400,
                    child: Icon(Icons.arrow_back_ios_new,
                        color: Colors.blueGrey.shade900, size: 30),
                    onPressed: () {
                      Fluttertoast.showToast(msg: "Back to Homepage");
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreenPage()));
                    }))
          ]),
          backgroundColor: Colors.grey.shade900,
          body: GridView.count(crossAxisCount: 2, children: <Widget>[
            //Play Option
            GestureDetector(
              child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Stack(children: <Widget>[
                    Center(
                        child: IconButton(
                            icon: Icon(Icons.games,
                                size: 70, color: Colors.red.shade900),
                            onPressed: () {
                              Fluttertoast.showToast(msg: "Let's Go");
                              List<String> choosen = chooseRandomWord();
                              print(choosen);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HangmanScreen(
                                          choosenType: choosen[0],
                                          choosenWord: choosen[1])));
                            })),
                    Container(
                        margin: const EdgeInsets.only(top: 150, left: 89),
                        child: const Text("PLAY",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.cyan,
                                fontStyle: FontStyle.italic)))
                  ])),
            ),

            //Ranking Option
            Card(
                color: Colors.transparent,
                elevation: 0,
                child: Stack(children: <Widget>[
                  Center(
                      child: IconButton(
                          icon: const Icon(Icons.score,
                              size: 70, color: Colors.cyan),
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: "Welcome to Global Ranking");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RankingPage()));
                          })),
                  Container(
                      margin: const EdgeInsets.only(top: 150, left: 70.5),
                      child: const Text("RANKING",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.green,
                              fontStyle: FontStyle.italic)))
                ])),

            //Chat Option
            Card(
                color: Colors.transparent,
                elevation: 0,
                child: Stack(children: <Widget>[
                  Center(
                      child: IconButton(
                          icon: const Icon(Icons.chat,
                              size: 70, color: Colors.green),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GlobalChatPage()));
                          })),
                  Container(
                      margin: const EdgeInsets.only(top: 150, left: 89),
                      child: const Text("CHAT",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue,
                              fontStyle: FontStyle.italic)))
                ])),

            //Profile Option
            Card(
                color: Colors.transparent,
                elevation: 0,
                child: Stack(children: <Widget>[
                  Center(
                      child: IconButton(
                          icon: const Icon(Icons.account_box_rounded,
                              size: 70, color: Colors.blue),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UserProfilePage()));
                          })),
                  Container(
                      margin: const EdgeInsets.only(top: 150, left: 74),
                      child: const Text("PROFILE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                              fontStyle: FontStyle.italic)))
                ])),

            //Log Out Option
            Card(
                color: Colors.transparent,
                elevation: 0,
                child: Stack(children: <Widget>[
                  Center(
                      child: IconButton(
                          icon: const Icon(Icons.logout_sharp,
                              size: 70, color: Colors.white),
                          onPressed: () {
                            Fluttertoast.showToast(msg: "Login Again To Play");
                            FirebaseAuth.instance.signOut();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CheckUsersLoginActivity()));
                          })),
                  Container(
                      margin: const EdgeInsets.only(top: 150, left: 77),
                      child: Text("Log Out",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.red.shade900,
                              fontStyle: FontStyle.italic)))
                ])),

            //Exit Option
            Card(
                color: Colors.transparent,
                elevation: 0,
                child: Stack(children: <Widget>[
                  Center(
                      child: IconButton(
                          icon: const Icon(Icons.exit_to_app,
                              size: 70, color: Colors.teal),
                          onPressed: () {
                            Fluttertoast.showToast(msg: "See You Soon");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => exit(0)));
                          })),
                  Container(
                      margin: const EdgeInsets.only(top: 150, left: 95),
                      child: Text("Exit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.amberAccent.shade700,
                              fontStyle: FontStyle.italic)))
                ]))
          ]),
        ));
  }
}
