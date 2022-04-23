//Game Menu Screen Layout

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hangman/difficulty_level_decider_page.dart';
import 'package:hangman/home_screen_page.dart';
import 'package:hangman/users.dart';
import 'package:hangman/check_users_login_activity.dart';
import 'package:hangman/user_profile_page.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        backgroundColor: Colors.grey.shade900,
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
                    Center(
                      child: Icon(
                        Icons.games,
                        size: 70,
                        color: Colors.red.shade900,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 150,
                        left: 75,
                      ),
                      child: const Text(
                        "PLAY",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.cyan,
                          fontStyle: FontStyle.italic,
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
                        size: 70,
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 150,
                        left: 63,
                      ),
                      child: const Text(
                        "PROFILE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
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
                        size: 70,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 150,
                        left: 59,
                      ),
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red.shade900,
                          fontStyle: FontStyle.italic,
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
                        size: 70,
                        color: Colors.teal,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 150,
                        left: 80,
                      ),
                      child: Text(
                        "Exit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.amberAccent.shade700,
                          fontStyle: FontStyle.italic,
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
    );
  }
}
