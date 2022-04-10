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
          child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {
                Fluttertoast.showToast(msg: "Choose What You Want To Do");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GameMenuPage()));
              },
              child: const Text("Back To Menu",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold)))),
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
