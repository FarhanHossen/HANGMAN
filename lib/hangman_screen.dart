import 'package:flutter/material.dart';

class HangmanScreen extends StatefulWidget {
  const HangmanScreen(
      {Key? key,
      required this.choosenType,
      required this.choosenWord,
      required this.typeSelection})
      : super(key: key);
  final String choosenType;
  final String choosenWord;
  final String typeSelection;

  @override
  State<HangmanScreen> createState() => _HangmanScreenState();
}

class _HangmanScreenState extends State<HangmanScreen> {
  // Variables
  int countLetter = 0;
  int countWrongWord = 0;
  int hangmanCount = 0;
  int spaceCount = 0;
  static int winningDecider = 0;
  int score = 0;
  static int highScore = 0;
  List underScoreArray = [];

  //Data
  var hangman = ["H", "A", "N", "G", "M", "A", "N"];

  @override
  Widget build(BuildContext context) {
    // Type Choose

    List<String> alphabets = [
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
      "Z",
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9"
    ];

    List<int> letterCheck(String char, String word) {
      List<int> indexes = [];
      for (int i = 0; i < word.length; i++) {
        if (word[i].toLowerCase() == char.toLowerCase()) {
          indexes.add(i);
        }
      }
      print(indexes);
      print(underScoreArray);
      return indexes;
    }

    void fillGaps(String char) {
      List<int> indexes = letterCheck(char, widget.choosenWord);
      List newunderScoreArray = underScoreArray;
      for (int i = 0; i < indexes.length; i++) {
        int index = indexes[i];
        newunderScoreArray[index] = widget.choosenWord[index];
      }
      setState(() {
        underScoreArray = newunderScoreArray;
      });
      print(underScoreArray);
    }

    //Word Choose
    List<String> word = widget.choosenWord.split("");
    underScoreArray = List.filled(word.length, widget.choosenWord);
    var space = ' ';

    for (int i = 0; i < word.length; i++) {
      if (word[i] == space) {
        underScoreArray[i] = "  ";
        spaceCount++;
      } else {
        underScoreArray[i] = "_ ";
      }
    }

    // Taking Input And Others

    var newHangman = List.filled(hangman.length, widget.choosenWord);

    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: const Text(
          "             ℍ𝔸ℕ𝔾𝕄𝔸ℕ",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Text(
          "           W O R D    T Y P E           ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.teal.shade900,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          widget.typeSelection,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        //Only For Test
        const SizedBox(
          height: 20,
        ),
        Text(
          "$word",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        //End Test
        const SizedBox(
          height: 20,
        ),
        Text(
          "$underScoreArray",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 250.0,
          child: GridView.count(
            crossAxisCount: 7,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            padding: EdgeInsets.all(8.0),
            children: alphabets.map((e) {
              return RawMaterialButton(
                onPressed: () {
                  fillGaps(e);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  e,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                fillColor: Colors.blue,
              );
            }).toList(),
          ),
        )
      ]),
    );
  }
}
