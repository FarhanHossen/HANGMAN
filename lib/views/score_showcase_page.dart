//Shows the user his current score and own highscore

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hangman/models/constants.dart';
import 'package:hangman/views/game_menu_page.dart';

class ScoreShowcasePage extends StatefulWidget {
  const ScoreShowcasePage(
      {Key? key, required this.score, required this.highScore})
      : super(key: key);

  final int score;
  final int highScore;

  @override
  State<ScoreShowcasePage> createState() => _ScoreShowcasePageState();
}

class _ScoreShowcasePageState extends State<ScoreShowcasePage> {
  @override
  Widget build(BuildContext context) {
    //The Screen Design
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/backgrounds/score_showcase.jpg',
          ),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: Scaffold(
        //Bottom Navigation Bar With "EXIT" Button
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: MaterialButton(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              Fluttertoast.showToast(msg: "Choose What You Want To Do");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const GameMenuPage(),
                ),
              );
            },
            child: const Text(
              "Back To Menu",
              style: TextStyle(
                fontFamily: 'Philosopher',
                fontSize: 25,
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(children: <Widget>[
            const SizedBox(
              height: 230,
            ),
            const Text(
              "SCORE",
              style: TextStyle(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: colour2,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.score.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: colour11,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "HIGH SCORE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: colour2,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.highScore.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: colour12,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
