//Sign Up Screen Layout

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hangman/controllers/auth_controller.dart';
import 'package:hangman/models/constants.dart';
import 'package:hangman/models/users.dart';
import 'package:hangman/views/login_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  //Variable
  bool isHiddenPassword = true;
  bool isHiddenConfirmPassword = true;

  //Form Key
  final formKey = GlobalKey<FormState>();

  //Editing Controller
  final userNameController = TextEditingController();
  final regionController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //Firebase
  final _authentication = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //User Name Field
    final userNameField = TextFormField(
      autofocus: false,
      controller: userNameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp reg = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("You Cannot Skip This Part");
        }
        if (!reg.hasMatch(value)) {
          return ("Minimum 3 Characters Needed");
        }
        return null;
      },
      onSaved: (value) {
        userNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.person,
          color: colour3,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "User Name",
        labelStyle: const TextStyle(
          fontFamily: 'Philosopher',
          fontSize: 20,
          color: colour3,
        ),
        hintText: "Minimum 3 Characters Needed",
        hintStyle: const TextStyle(
          fontFamily: 'Philosopher',
          color: colour3,
          fontSize: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: colour2,
        filled: true,
      ),
    );

    //Region Field
    final regionField = TextFormField(
      autofocus: false,
      controller: regionController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp reg = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("You Cannot Skip This Part");
        }
        if (!reg.hasMatch(value)) {
          return ("Minimum 3 Characters Needed");
        }
        return null;
      },
      onSaved: (value) {
        regionController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          MdiIcons.flag,
          color: colour3,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Region",
        labelStyle: const TextStyle(
          fontFamily: 'Philosopher',
          fontSize: 20,
          color: colour3,
        ),
        hintText: "Full Name Preferable",
        hintStyle: const TextStyle(
          fontFamily: 'Philosopher',
          color: colour3,
          fontSize: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: colour2,
        filled: true,
      ),
    );

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
      textInputAction: TextInputAction.next,
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
          color: colour3,
          fontSize: 20,
        ),
        hintText: "Minimum 6 Characters Password Needed",
        hintStyle: const TextStyle(
          fontFamily: 'Philosopher',
          color: colour3,
          fontSize: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: colour2,
        filled: true,
      ),
    );

    //Confirm Password Field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordController,
      obscureText: isHiddenConfirmPassword,
      validator: (value) {
        if (confirmPasswordController.text != passwordController.text) {
          return ("Password doesn't match. Try Again");
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.vpn_key,
          color: colour3,
        ),
        suffixIcon: InkWell(
          onTap: _toggleConfirmPasswordView,
          child: const Icon(
            Icons.visibility,
            color: colour3,
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Confirm Password",
        labelStyle: const TextStyle(
          fontFamily: 'Philosopher',
          color: colour3,
          fontSize: 20,
        ),
        hintText: "Minimum 6 Characters Password Needed",
        hintStyle: const TextStyle(
          color: colour3,
          fontFamily: 'Philosopher',
          fontSize: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: colour2,
        filled: true,
      ),
    );

    //Create Account Button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: colour1,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailController.text, passwordController.text);
        },
        child: const Text(
          "Create Account",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            color: colour2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    //Other Works
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/backgrounds/sign_up.jpg',
          ),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: Scaffold(
        // Appbar With Back Button
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: colour2,
              size: 40,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          //Logo Set
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/logos/log_in_sign_up.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    //Fields Set
                    const SizedBox(
                      height: 50,
                    ),
                    userNameField,
                    const SizedBox(
                      height: 20,
                    ),
                    regionField,
                    const SizedBox(
                      height: 20,
                    ),
                    emailField,
                    const SizedBox(
                      height: 20,
                    ),
                    passwordField,
                    const SizedBox(
                      height: 20,
                    ),
                    confirmPasswordField,
                    //Button Set
                    const SizedBox(
                      height: 30,
                    ),
                    signUpButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Signup Functionality
  void signUp(String email, String password) async {
    if (formKey.currentState!.validate()) {
      await AuthController.instance
          .signUp(email: email, password: password)
          .then((value) => {uploadToFirestore()})
          .catchError(
        (e) {
          Fluttertoast.showToast(msg: e!.message);
        },
      );
    }
  }

  //Uploading In Firestore
  uploadToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _authentication.currentUser;
    Users users = Users();

    users.email = user!.email;
    users.uid = user.uid;
    users.userName = userNameController.text;
    users.region = regionController.text;
    users.highScoreEasy = 0;
    users.highScoreMedium = 0;
    users.highScoreHard = 0;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(users.toMap());
    Fluttertoast.showToast(msg: "Your Account Has Been Created");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(
          builder: (context) => const LogInPage(),
        ),
        (route) => false);
  }

  //Password Hidden Button
  void _togglePasswordView() {
    setState(
      () {
        isHiddenPassword = !isHiddenPassword;
      },
    );
  }

  void _toggleConfirmPasswordView() {
    setState(
      () {
        isHiddenConfirmPassword = !isHiddenConfirmPassword;
      },
    );
  }
}
