//The Main Class From Where The App Starts

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hangman/Supportive%20files/check_users_login_activity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Hangman());
}

class Hangman extends StatelessWidget {
  const Hangman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hangman',
        theme:
            ThemeData(primarySwatch: Colors.red, brightness: Brightness.dark),
        home: const CheckUsersLoginActivity());
  }
}
