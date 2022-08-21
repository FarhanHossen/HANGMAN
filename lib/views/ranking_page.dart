import 'package:flutter/material.dart';
import 'package:hangman/models/constants.dart';
import 'package:hangman/models/users.dart';
import 'package:hangman/views/game_menu_page.dart';

class RankingPage extends StatelessWidget {
  final List<Users> easyUsers;
  final List<Users> mediumUsers;
  final List<Users> hardUsers;
  final List<Users> users;

  const RankingPage(
      {Key? key,
      required this.easyUsers,
      required this.mediumUsers,
      required this.hardUsers,
      required this.users})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colour3,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: colour2,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const GameMenuPage(),
              ),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'SCOREBOARD',
          style: TextStyle(
              fontFamily: 'Philosopher',
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TopRow(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return TableRow(
                    index: index,
                    easyUsers: easyUsers[index],
                    mediumUsers: mediumUsers[index],
                    hardUsers: hardUsers[index],
                    users: users[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TopRow extends StatelessWidget {
  const TopRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Serial
        Container(
          alignment: Alignment.center,
          width: 25,
          child: const Text(
            '#',
            style: TextStyle(
              fontFamily: 'Philosopher',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: colour2,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),

        //Name
        Container(
            width: 65,
            alignment: Alignment.center,
            child: const Text(
              'Name',
              style: TextStyle(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: colour2,
              ),
            )),
        const SizedBox(
          width: 12,
        ),

        //Region
        Container(
          width: 65,
          alignment: Alignment.center,
          child: const Text('Region',
              style: TextStyle(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: colour2,
              )),
        ),
        const SizedBox(
          width: 12,
        ),

        //Score
        Container(
          alignment: Alignment.center,
          width: 65,
          child: const Text('Easy Score',
              style: TextStyle(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: colour2,
              )),
        ),
        const SizedBox(
          width: 12,
        ),
        Container(
          width: 65,
          alignment: Alignment.center,
          child: const Text('Medium Score',
              style: TextStyle(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: colour2,
              )),
        ),
        const SizedBox(
          width: 12,
        ),
        Container(
          width: 65,
          alignment: Alignment.center,
          child: const Text('Hard Score',
              style: TextStyle(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: colour2,
              )),
        ),
      ],
    );
  }
}

class TableRow extends StatelessWidget {
  final int index;
  final Users users;
  final Users easyUsers;
  final Users mediumUsers;
  final Users hardUsers;

  const TableRow({
    required this.index,
    required this.users,
    required this.easyUsers,
    required this.mediumUsers,
    required this.hardUsers,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.8,
        ),
        color: colour2,
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 25,
            height: 50,
            color: index < 3
                ? colour12
                : index < 11
                    ? colour10
                    : index > 11
                        ? colour11
                        : Colors.grey.shade300,
            child: Text(
              (index + 1).toString(),
              style: const TextStyle(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            alignment: Alignment.center,
            width: 65,
            child: Text(
              '${users.userName}',
              style: const TextStyle(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            alignment: Alignment.center,
            width: 65,
            child: Text(
              '${users.region}',
              style: const TextStyle(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            alignment: Alignment.center,
            width: 60,
            child: Text(
              '${users.highScoreEasy}',
              style: const TextStyle(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            alignment: Alignment.center,
            width: 60,
            child: Text(
              '${users.highScoreMedium}',
              style: const TextStyle(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            alignment: Alignment.center,
            width: 60,
            child: Text(
              '${users.highScoreHard}',
              style: const TextStyle(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
