//User Profile Screen

import 'package:flutter/material.dart';
import 'package:hangman/users.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key, required this.profile}) : super(key: key);

  final Users profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,

      //Appbar With Back Button
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Icon(
              Icons.person,
              size: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
              elevation: 15,
              borderRadius: BorderRadius.circular(0),
              color: Colors.teal.shade900,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(children: <Widget>[
                  //Name Field
                  const Text(
                    "NAME",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    ":",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    profile.firstName!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    profile.lastName!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ]),
              ),
            ),

            //Mail Field
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(0),
              color: Colors.teal.shade900,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(children: [
                  const Text(
                    "MAIL",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    ":",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    profile.email!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ]),
              ),
            ),

            //Country Field
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(0),
              color: Colors.cyanAccent,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(children: [
                  const Text(
                    "COUNTRY",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    ":",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    profile.region!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ]),
              ),
            ),

            //Gender Field
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(0),
              color: Colors.cyanAccent,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(children: [
                  const Text(
                    "Gender",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    ":",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    profile.gender!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ]),
              ),
            ),

            //Easy High Score Field
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    const Text(
                      "EASY HIGH SCORE",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      ":",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      profile.highScoreEasy!.toString(),
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Medium High Score Field
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    const Text(
                      "MEDIUM HIGH SCORE",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      ":",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      profile.highScoreMedium!.toString(),
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Hard High Score Field
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    const Text(
                      "HARD HIGH SCORE",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      ":",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      profile.highScoreHard!.toString(),
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
