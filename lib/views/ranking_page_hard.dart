import 'package:flutter/material.dart';
import 'package:hangman/models/constants.dart';
import 'package:hangman/models/users.dart';
import 'package:hangman/views/ranking_level_decider_page.dart';

class RankingPageHard extends StatelessWidget {
  final List<Users> hardUsers;
  const RankingPageHard({Key? key, required this.hardUsers}) : super(key: key);

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
                builder: (context) => const RankingLevelDeciderPage(),
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
              itemCount: hardUsers.length,
              itemBuilder: (context, index) {
                return TableRow(
                  index: index,
                  hardUsers: hardUsers[index],
                );
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
          width: 30,
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
          width: 15,
        ),

        //Name
        Container(
            width: 80,
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
          width: 15,
        ),

        //Region
        Container(
          width: 80,
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
          width: 15,
        ),

        //Score
        Container(
          alignment: Alignment.center,
          width: 80,
          child: const Text('Score',
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
  final Users hardUsers;

  const TableRow({
    required this.index,
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
            width: 20,
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
            width: 15,
          ),
          Container(
            alignment: Alignment.center,
            width: 80,
            child: Text(
              '${hardUsers.userName}',
              style: const TextStyle(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            alignment: Alignment.center,
            width: 80,
            child: Text(
              '${hardUsers.region}',
              style: const TextStyle(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            alignment: Alignment.center,
            width: 80,
            child: Text(
              '${hardUsers.highScoreHard}',
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
