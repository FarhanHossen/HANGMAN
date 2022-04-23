//Reset Password Screen Layout

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        backgroundColor: Colors.teal.shade500,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Reset Password",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          //Text
          const SizedBox(
            height: 100,
          ),
          const Text(
            "Enter your email address to",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "get the password reset link",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
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
                labelText: ("Email"),
                labelStyle: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.cyan,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: const Icon(
                  Icons.mail,
                  color: Colors.cyan,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
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
            elevation: 5,
            borderRadius: BorderRadius.circular(25),
            color: Colors.red.shade900,
            child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {
                _authentication.sendPasswordResetEmail(email: email);
                Fluttertoast.showToast(msg: "Mail Sent");
              },
              child: const Text(
                "Send Request",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
