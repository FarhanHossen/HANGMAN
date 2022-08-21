//User Profile Screen

import 'package:flutter/material.dart';
import 'package:hangman/models/constants.dart';
import 'package:hangman/models/users.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key, required this.profile}) : super(key: key);

  final Users profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colour3,

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
        centerTitle: true,
        title: const Text(
          'PROFILE',
          style: TextStyle(
              fontFamily: 'Philosopher',
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(50),
                color: colour2,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(children: <Widget>[
                    //Name Field
                    const Text(
                      "NAME :",
                      style: TextStyle(
                        color: colour3,
                        fontFamily: 'Philosopher',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      profile.userName!,
                      style: const TextStyle(
                        color: colour3,
                        fontFamily: 'Philosopher',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ]),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              //Mail Field
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(50),
                color: colour2,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(children: [
                    const Text(
                      "MAIL :",
                      style: TextStyle(
                        color: colour3,
                        fontFamily: 'Philosopher',
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
                        color: colour3,
                        fontFamily: 'Philosopher',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Country Field
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(50),
                color: colour2,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(children: [
                    const Text(
                      "REGION :",
                      style: TextStyle(
                        color: colour3,
                        fontFamily: 'Philosopher',
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
                        color: colour3,
                        fontFamily: 'Philosopher',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              //Score Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(50),
                  color: colour2,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Score",
                            style: TextStyle(
                              color: colour3,
                              fontFamily: 'Philosopher',
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              //Easy High Score Field
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(50),
                      color: colour2,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "EASY HIGH SCORE :",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: colour3,
                            fontFamily: 'Philosopher',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(50),
                      color: colour2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          profile.highScoreEasy!.toString(),
                          style: const TextStyle(
                            color: colour3,
                            fontFamily: 'Philosopher',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Medium High Score Field
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(50),
                      color: colour2,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "MEDIUM HIGH SCORE :",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: colour3,
                            fontFamily: 'Philosopher',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 55,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(50),
                      color: colour2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          profile.highScoreMedium!.toString(),
                          style: const TextStyle(
                            color: colour3,
                            fontFamily: 'Philosopher',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Hard High Score Field
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(50),
                      color: colour2,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "HARD HIGH SCORE :",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: colour3,
                            fontFamily: 'Philosopher',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(50),
                      color: colour2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          profile.highScoreHard!.toString(),
                          style: const TextStyle(
                            color: colour3,
                            fontFamily: 'Philosopher',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
