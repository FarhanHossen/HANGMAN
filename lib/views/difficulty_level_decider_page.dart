//Difficulty Decide Screen

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hangman/models/constants.dart';
import 'package:hangman/views/easy_hangman_screen.dart';
import 'package:hangman/views/game_menu_page.dart';
import 'package:hangman/views/hard_hangman_screen.dart';
import 'package:hangman/views/medium_hangman_screen.dart';
import 'package:hangman/models/game_variables.dart';

class DifficultyLevelDeciderPage extends StatelessWidget {
  const DifficultyLevelDeciderPage({Key? key}) : super(key: key);

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
      backgroundColor: Colors.grey.shade900,
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
                  onPressed: () {
                    List<String> choosen = chooseRandomWordEasy();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EasyHangmanScreen(
                          choosenType: choosen[0],
                          choosenWord: choosen[1],
                        ),
                      ),
                    );
                  },
                  child: const Text("EASY",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Philosopher',
                          fontSize: 30,
                          color: colour3,
                          fontWeight: FontWeight.bold)))),
          const SizedBox(height: 50),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            color: colour10,
            child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {
                List<String> choosen = chooseRandomWordMedium();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MediumHangmanScreen(
                      choosenType: choosen[0],
                      choosenWord: choosen[1],
                    ),
                  ),
                );
              },
              child: const Text(
                "MEDIUM",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Philosopher',
                  fontSize: 30,
                  color: colour3,
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
              onPressed: () {
                List<String> choosen = chooseRandomWordHard();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HardHangmanScreen(
                      choosenType: choosen[0],
                      choosenWord: choosen[1],
                    ),
                  ),
                );
              },
              child: const Text(
                "HARD",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Philosopher',
                  fontSize: 30,
                  color: colour3,
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
