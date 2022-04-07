import 'package:flutter/material.dart';
import 'package:hangman/auth_services.dart';
import 'package:hangman/game_menu_page.dart';
import 'package:provider/provider.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      //Appbar With Back Button
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.red),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => GameMenuPage()));
              })),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          FutureBuilder(
            future: Provider.of<AuthService>(context).auth.getCurrentUID(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Text("DONE");
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ],
      )),
    );
  }
}
