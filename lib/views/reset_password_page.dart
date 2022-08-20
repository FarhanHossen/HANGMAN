//Reset Password Screen Layout

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hangman/models/constants.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  //Variable
  late String email;

  //Firebase
  final _authentication = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      //Appbar
      appBar: AppBar(
        backgroundColor: colour1,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Reset Password",
          style: TextStyle(
            fontFamily: 'Philosopher',
            color: colour2,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Text
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Enter your",
              style: TextStyle(
                fontFamily: 'Philosopher',
                color: colour2,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Email Address",
              style: TextStyle(
                fontFamily: 'Philosopher',
                color: colour6,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "to get the",
              style: TextStyle(
                fontFamily: 'Philosopher',
                color: colour2,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Password Reset Link",
              style: TextStyle(
                fontFamily: 'Philosopher',
                color: colour6,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),

            //Email Field
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  labelText: ("Email"),
                  labelStyle: const TextStyle(
                    fontFamily: 'Philosopher',
                    color: colour3,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: const Icon(
                    Icons.mail,
                    color: colour3,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: colour2,
                  filled: true,
                ),
                onChanged: (value) {
                  setState(
                    () {
                      email = value;
                    },
                  );
                },
              ),
            ),

            //Send Request Button
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(20),
              color: Colors.red.shade900,
              child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                //minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  _authentication.sendPasswordResetEmail(email: email);
                  Fluttertoast.showToast(msg: "Mail Sent");
                },
                child: const Text(
                  "Send Request",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Philosopher',
                    fontSize: 25,
                    color: colour5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
