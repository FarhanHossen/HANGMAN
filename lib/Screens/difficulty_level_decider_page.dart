import 'package:flutter/material.dart';
import 'package:hangman/Screens/Main%20Game%20Screens/easy_hangman_screen.dart';
import 'package:hangman/Screens/Main%20Game%20Screens/hard_hangman_screen.dart';
import 'package:hangman/Screens/Main%20Game%20Screens/medium_hangman_screen.dart';
import 'package:hangman/Supportive%20files/game_logic.dart';

class DifficultyLevelDeciderPage extends StatelessWidget {
  const DifficultyLevelDeciderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        children: <Widget>[
          const SizedBox(height: 300),
          Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(30),
              color: Colors.green.shade700,
              child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    List<String> choosen = chooseRandomWordEasy();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EasyHangmanScreen(
                                choosenType: choosen[0],
                                choosenWord: choosen[1])));
                  },
                  child: const Text("EASY",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)))),
          const SizedBox(height: 50),
          Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(30),
              color: Colors.orange.shade400,
              child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    List<String> choosen = chooseRandomWordMedium();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MediumHangmanScreen(
                                choosenType: choosen[0],
                                choosenWord: choosen[1])));
                  },
                  child: const Text("MEDIUM",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)))),
          const SizedBox(height: 50),
          Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(30),
              color: Colors.red.shade900,
              child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    List<String> choosen = chooseRandomWordHard();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HardHangmanScreen(
                                choosenType: choosen[0],
                                choosenWord: choosen[1])));
                  },
                  child: const Text("HARD",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)))),
        ],
      ),
    );
  }
}
