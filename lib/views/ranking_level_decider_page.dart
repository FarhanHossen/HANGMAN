import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hangman/models/constants.dart';
import 'package:hangman/models/users.dart';
import 'package:hangman/views/game_menu_page.dart';
import 'package:hangman/views/ranking_page_easy.dart';
import 'package:hangman/views/ranking_page_hard.dart';
import 'package:hangman/views/ranking_page_medium.dart';

class RankingLevelDeciderPage extends StatefulWidget {
  const RankingLevelDeciderPage({Key? key}) : super(key: key);

  @override
  State<RankingLevelDeciderPage> createState() =>
      _RankingLevelDeciderPageState();
}

class _RankingLevelDeciderPageState extends State<RankingLevelDeciderPage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  //Get list of Users
  Future<List<Users>> getUsers() async {
    final query = await firebaseFirestore
        .collection('users')
        .orderBy('User Name', descending: false)
        .get();
    final List<Users> users = query.docs.map((doc) {
      return Users.fromFirestore(doc.data());
    }).toList();
    return users;
  }

  //Get list of Users for Ranking(Easy)
  Future<List<Users>> getUserScoreEasy() async {
    final query = await firebaseFirestore
        .collection('users')
        .orderBy('Easy High Score', descending: true)
        .get();
    final List<Users> users = query.docs.map((doc) {
      return Users.fromFirestore(doc.data());
    }).toList();
    return users;
  }

  //Get list of Users for Ranking(Medium)
  Future<List<Users>> getUserScoreMedium() async {
    final query = await firebaseFirestore
        .collection('users')
        .orderBy('Medium High Score', descending: true)
        .get();
    final List<Users> users = query.docs.map((doc) {
      return Users.fromFirestore(doc.data());
    }).toList();
    return users;
  }

  //Get list of Users for Ranking(Hard)
  Future<List<Users>> getUserScoreHard() async {
    final query = await firebaseFirestore
        .collection('users')
        .orderBy('Hard High Score', descending: true)
        .get();
    final List<Users> users = query.docs.map((doc) {
      return Users.fromFirestore(doc.data());
    }).toList();
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.red.shade900,
                size: 30,
              ),
              onPressed: () {
                Fluttertoast.showToast(msg: "Choose what you want to do");
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const GameMenuPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: colour3,
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 300,
          ),
          Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(30),
              color: colour12,
              child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () async {
                    final easyList = await getUserScoreEasy();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RankingPageEasy(
                          easyUsers: easyList,
                        ),
                      ),
                    );
                  },
                  child: const Text("Easy Score Board",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Philosopher',
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)))),
          const SizedBox(height: 50),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            color: colour10,
            child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () async {
                final mediumList = await getUserScoreMedium();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RankingPageMedium(
                      mediumUsers: mediumList,
                    ),
                  ),
                );
              },
              child: const Text(
                "Medium Score Board",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Philosopher',
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            color: colour13,
            child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () async {
                final hardList = await getUserScoreHard();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RankingPageHard(
                      hardUsers: hardList,
                    ),
                  ),
                );
              },
              child: const Text(
                "Hard Score Board",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Philosopher',
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
