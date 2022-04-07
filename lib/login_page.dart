//Log In Screen Layout

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hangman/home_screen_page.dart';
import 'package:hangman/signup_page.dart';
import 'package:hangman/reset_password_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInState();
}

class _LogInState extends State<LogInPage> {
  //Variable
  bool isHiddenPassword = true;

  //Form Key
  final formKey = GlobalKey<FormState>();

  //Editing Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //Firebase
  final _authentication = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //Email Field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Check If You Have Entered Your Email");
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter Your Email Correctly");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.mail, color: Colors.white),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Email",
            hintStyle: const TextStyle(
                fontStyle: FontStyle.italic, color: Colors.cyan),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

    //Password Field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: isHiddenPassword,
        validator: (value) {
          RegExp reg = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Please Check If You Have Entered Your Password");
          }
          if (!reg.hasMatch(value)) {
            return ("Minimum 6 Characters Password Needed");
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.vpn_key, color: Colors.white),
            suffixIcon: InkWell(
              onTap: _togglePasswordView,
              child: const Icon(Icons.visibility, color: Colors.white),
            ),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Password",
            hintStyle: const TextStyle(
                fontStyle: FontStyle.italic, color: Colors.cyan),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //Login Button
    final logInButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.green,
        child: MaterialButton(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              logIn(emailController.text, passwordController.text);
            },
            child: const Text("Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold))));

    //The Screen Design
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        //Bottom Navigation Bar With "EXIT" Button
        bottomNavigationBar: BottomAppBar(
            color: Colors.red.shade900,
            child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  Fluttertoast.showToast(msg: "See You Soon");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => exit(0)));
                },
                child: const Text("EXIT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)))),
        body: Center(
            //Logo Set
            child: SingleChildScrollView(
                child: Container(
                    color: Colors.grey.shade900,
                    child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Form(
                            key: formKey,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                      height: 200,
                                      child: Image.asset(
                                          "assets/logo_for_login_page.png",
                                          fit: BoxFit.contain)),
                                  //Fields Set
                                  const SizedBox(height: 55),
                                  emailField,
                                  const SizedBox(height: 25),
                                  passwordField,
                                  const SizedBox(height: 5),
                                  //Forgotten Password Set
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ResetPasswordPage()));
                                            },
                                            child: const Text(
                                                "Forgotten Password?",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontStyle: FontStyle.italic,
                                                    fontSize: 15)))
                                      ]),
                                  //Login And Signup Button Set
                                  const SizedBox(height: 25),
                                  logInButton,
                                  const SizedBox(height: 15),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Text("Are you a new user? ",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SignUpPage()));
                                            },
                                            child: const Text(
                                                "Create an account",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontStyle: FontStyle.italic,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ])
                                ])))))));
  }

  //Password Hidden Button
  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  //Login Functionality
  void logIn(String email, String password) async {
    if (formKey.currentState!.validate()) {
      await _authentication
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreenPage()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
