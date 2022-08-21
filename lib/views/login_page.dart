//Log In Screen Layout

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hangman/controllers/auth_controller.dart';
import 'package:hangman/models/constants.dart';
import 'package:hangman/views/home_screen_page.dart';
import 'package:hangman/views/signup_page.dart';
import 'package:hangman/views/reset_password_page.dart';

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
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter Your Email Correctly");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.mail,
          color: colour3,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Email",
        labelStyle: const TextStyle(
          fontFamily: 'Philosopher',
          fontSize: 20,
          color: colour3,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: colour2,
        filled: true,
      ),
    );

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
        prefixIcon: const Icon(
          Icons.vpn_key,
          color: colour3,
        ),
        suffixIcon: InkWell(
          onTap: _togglePasswordView,
          child: const Icon(
            Icons.visibility,
            color: colour3,
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Password",
        labelStyle: const TextStyle(
          fontFamily: 'Philosopher',
          fontSize: 20,
          color: colour3,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: colour2,
        filled: true,
      ),
    );

    //Login Button
    final logInButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(60),
      color: colour1,
      child: MaterialButton(
        padding: const EdgeInsets.all(10),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          logIn(emailController.text, passwordController.text);
        },
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: colour2,
            fontFamily: 'Philosopher',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    //The Screen Design
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/backgrounds/log_in.jpg',
          ),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: Scaffold(
        //Bottom Navigation Bar With "EXIT" Button
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomAppBar(
          color: colour4,
          child: MaterialButton(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              Fluttertoast.showToast(msg: "See You Soon");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => exit(0),
                ),
              );
            },
            child: const Text(
              "EXIT",
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
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/logos/log_in_sign_up.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    //Fields Set
                    const SizedBox(
                      height: 85,
                    ),
                    emailField,
                    const SizedBox(
                      height: 25,
                    ),
                    passwordField,
                    const SizedBox(
                      height: 5,
                    ),
                    //Forgot Password Set
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ResetPasswordPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontFamily: 'Philosopher',
                              color: Colors.red,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Login And Create Account Button Set
                    const SizedBox(
                      height: 25,
                    ),
                    logInButton,
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Are you a new user? ",
                          style: TextStyle(
                            fontFamily: 'Philosopher',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Create an account",
                            style: TextStyle(
                              fontFamily: 'Philosopher',
                              color: Colors.red,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Password Hidden Button
  void _togglePasswordView() {
    setState(
      () {
        isHiddenPassword = !isHiddenPassword;
      },
    );
  }

  //Login Functionality
  void logIn(String email, String password) async {
    if (formKey.currentState!.validate()) {
      await AuthController.instance
          .login(email: email, password: password)
          .then(
            (uid) => {
              Fluttertoast.showToast(msg: "Login Successful"),
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreenPage(),
                ),
              ),
            },
          )
          .catchError(
        (e) {
          Fluttertoast.showToast(msg: e!.message);
        },
      );
    }
  }
}
