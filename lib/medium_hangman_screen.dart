//Game Screen For Medium Mode
//There is a test part in this file only for test as you don't know the word(Choosen randomly)

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hangman/score_showcase_page.dart';
import 'package:hangman/game_logic.dart';

class MediumHangmanScreen extends StatefulWidget {
  const MediumHangmanScreen(
      {Key? key, required this.choosenType, required this.choosenWord})
      : super(key: key);
  final String choosenType;
  final String choosenWord;

  @override
  State<MediumHangmanScreen> createState() => _MediumHangmanScreenState();
}

class _MediumHangmanScreenState extends State<MediumHangmanScreen> {
  //Firebase
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Variables
  List<String> underScoreArray = [];
  String wordToGuess = '';
  String wordType = '';
  String originalWord = '';
  String hangman = '';
  int hangmanCount = 0;
  int scoreMedium = 0;
  String hangmanWord = 'HANGMAN';
  int spaceCount = 0;
  List<String> alphabets = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  @override
  void initState() {
    super.initState();
    String initialWord = widget.choosenWord;
    underScoreArray = List.filled(initialWord.length, initialWord);

    // Underscore Create For The First Choosen Word
    for (int i = 0; i < initialWord.length; i++) {
      if (initialWord[i] == ' ') {
        underScoreArray[i] = "  ";
        spaceCount++;
      } else {
        underScoreArray[i] = "_ ";
      }
    }
    setState(
      () {
        wordToGuess = underScoreArray.join("");
        wordType = widget.choosenType;
        originalWord = initialWord;
      },
    );
  }

  //Successfull Round
  void setNextWord() {
    List<String> choosen = chooseRandomWordMedium();
    spaceCount = 0;
    String newWord = choosen[1];
    underScoreArray = List.filled(newWord.length, newWord);
    for (int i = 0; i < newWord.length; i++) {
      if (newWord[i] == ' ') {
        underScoreArray[i] = "  ";
        spaceCount++;
      } else {
        underScoreArray[i] = "_ ";
      }
    }
    setState(() {
      wordToGuess = underScoreArray.join("");
      wordType = choosen[0];
      originalWord = newWord;
      hangman = '';
      hangmanCount = 0;
      scoreMedium = scoreMedium + 50;
    });
  }

  //Filling The Underscores After Getting Correct Input
  void fillGaps(String letter) {
    if (hangmanCount == 7) {
      return;
    }
    List<int> indexes = letterCheck(letter, originalWord);
    if (indexes.isEmpty) {
      hangmanCount++;
      setState(
        () {
          hangman = hangmanWord.substring(0, hangmanCount);
        },
      );
    } else {
      for (int i = 0; i < indexes.length; i++) {
        int index = indexes[i];
        underScoreArray[index] = originalWord[index];
      }
      setState(
        () {
          wordToGuess = underScoreArray.join("");
        },
      );
    }
  }

  //Getting The Index Numbers Of The Letter Gotten From Keyboard
  List<int> letterCheck(String letter, String originalWord) {
    List<int> indexes = [];
    for (int i = 0; i < originalWord.length; i++) {
      if (originalWord[i] == letter.toUpperCase()) {
        indexes.add(i);
      }
    }
    return indexes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: AppBar(
        title: Center(
          child: Text(
            hangman,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          const Text(
            "W O R D    T Y P E",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.amberAccent,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            wordType,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.tealAccent,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            wordToGuess,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 45,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: double.infinity,
            height: 180.0,
            child: GridView.count(
              crossAxisCount: 10,
              mainAxisSpacing: 6.0,
              crossAxisSpacing: 6.0,
              padding: const EdgeInsets.all(6.0),
              children: alphabets.map((e) {
                return RawMaterialButton(
                    onPressed: () {
                      fillGaps(e);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    child: Text(
                      e,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                    fillColor: Colors.grey.shade900);
              }).toList(),
            ),
          ),
          if ((wordToGuess.length) == (originalWord.length + spaceCount))
            RawMaterialButton(
                onPressed: setNextWord,
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                fillColor: Colors.lightBlue),
          if (hangmanCount == 7)
            RawMaterialButton(
              onPressed: () async {
                int highscoreMedium = await getHighscore();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScoreShowcasePage(
                        score: scoreMedium, highScore: highscoreMedium),
                  ),
                );
              },
              child: const Text(
                'Game Over',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              fillColor: Colors.red.shade900,
            ),

          //Only For Test
          const SizedBox(
            height: 5,
          ),
          Text(
            originalWord,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
          //End Test
        ],
      ),
    );
  }

  Future<int> getHighscore() async {
    final User user = auth.currentUser!;
    final query = await firebaseFirestore
        .collection('users')
        .where('Email', isEqualTo: user.email)
        .get();

    final doc = query.docs.first.data();
    final int highScoreMedium = doc['Medium High Score'];
    if (highScoreMedium < scoreMedium) {
      final docId = query.docs.first.id;
      await firebaseFirestore
          .collection('users')
          .doc(docId)
          .update({'Medium High Score': scoreMedium});
      return scoreMedium;
    }
    return highScoreMedium;
  }
}
