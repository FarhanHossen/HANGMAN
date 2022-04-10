//This Class Will Check If The User Is Already Loged In Or Not

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hangman/Screens/home_screen_page.dart';
import 'package:hangman/Screens/login_page.dart';

class CheckUsersLoginActivity extends StatelessWidget {
  const CheckUsersLoginActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data != null) {
            return const HomeScreenPage();
          } else {
            return const LogInPage();
          }
        });
  }
}
