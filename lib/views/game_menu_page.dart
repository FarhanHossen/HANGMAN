//Game Menu Screen Layout

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hangman/models/constants.dart';
import 'package:hangman/views/difficulty_level_decider_page.dart';
import 'package:hangman/views/home_screen_page.dart';
import 'package:hangman/models/users.dart';
import 'package:hangman/controllers/check_users_login_activity.dart';
import 'package:hangman/views/user_profile_page.dart';

class GameMenuPage extends StatefulWidget {
  const GameMenuPage({Key? key}) : super(key: key);

  @override
  State<GameMenuPage> createState() => _GameMenuState();
}

class _GameMenuState extends State<GameMenuPage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<Users> getUser() async {
    final User user = auth.currentUser!;
    final query = await firebaseFirestore
        .collection('users')
        .where('Email', isEqualTo: user.email)
        .get();
    final doc = query.docs.first.data();
    Users profile = Users.fromFirestore(doc);
    return profile;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/game_menu_page_background.jpg',
          ),
          fit: BoxFit.cover,
          opacity: 0.4,
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: FloatingActionButton(
                  backgroundColor: Colors.tealAccent.shade400,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.blueGrey.shade900,
                    size: 30,
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Back to Homepage");
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreenPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          body: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              //Play Option
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: "Let's Go");
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const DifficultyLevelDeciderPage(),
                    ),
                  );
                },
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Stack(
                    children: <Widget>[
                      const Center(
                        child: Icon(
                          Icons.games,
                          size: 100,
                          color: colour12,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 170,
                          left: 75,
                        ),
                        child: const Text(
                          "PLAY",
                          style: TextStyle(
                            fontFamily: 'Philosopher',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Profile Option
              GestureDetector(
                onTap: () async {
                  final profile = await getUser();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfilePage(
                        profile: profile,
                      ),
                    ),
                  );
                },
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Stack(
                    children: <Widget>[
                      const Center(
                        child: Icon(
                          Icons.account_box_rounded,
                          size: 100,
                          color: colour9,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 170,
                          left: 63,
                        ),
                        child: const Text(
                          "PROFILE",
                          style: TextStyle(
                            fontFamily: 'Philosopher',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Log Out Option
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: "Login Again To Play");
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckUsersLoginActivity(),
                    ),
                  );
                },
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Stack(
                    children: <Widget>[
                      const Center(
                        child: Icon(
                          Icons.logout_sharp,
                          size: 100,
                          color: colour10,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 170,
                          left: 59,
                        ),
                        child: const Text(
                          "LOG OUT",
                          style: TextStyle(
                            fontFamily: 'Philosopher',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Exit Option
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: "See You Soon");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => exit(0),
                    ),
                  );
                },
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Stack(
                    children: <Widget>[
                      const Center(
                        child: Icon(
                          Icons.exit_to_app,
                          size: 100,
                          color: colour11,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 170,
                          left: 80,
                        ),
                        child: const Text(
                          "EXIT",
                          style: TextStyle(
                            fontFamily: 'Philosopher',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
