import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hangman/Screens/game_menu_page.dart';

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
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade900,
        child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.cyan, size: 35),
            onPressed: () {
              Fluttertoast.showToast(msg: "Choose what you want to do");
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GameMenuPage()));
            }),
      ),
      backgroundColor: Colors.cyan.shade900,
      body: Center(
        child: Column(children: <Widget>[
          const SizedBox(height: 280),
          const Text("SCORE",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          const SizedBox(height: 20),
          Text(widget.score.toString(),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          const SizedBox(height: 30),
          const Text("HIGH SCORE",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          const SizedBox(height: 20),
          Text(widget.highScore.toString(),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
        ]),
      ),
    );
  }
}
