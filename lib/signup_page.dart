//Sign Up Screen Layout

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hangman/login_page.dart';
import 'package:hangman/users.dart';

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
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final genderController = TextEditingController();
  final regionController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final birthDateController = TextEditingController();
  final ageController = TextEditingController();
  final contactController = TextEditingController();

  //Firebase
  final _authentication = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //First Name Field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameController,
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
        firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.person,
          color: Colors.tealAccent,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "First Name",
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        hintText: "Minimum 3 Characters Needed",
        hintStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.cyan,
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Last Name Field
    final lastNameField = TextFormField(
      autofocus: false,
      controller: lastNameController,
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
        lastNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.person,
          color: Colors.tealAccent,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Last Name",
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        hintText: "Minimum 3 Characters Needed",
        hintStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.cyan,
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Gender Field
    final genderField = TextFormField(
      autofocus: false,
      controller: genderController,
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
        firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          MdiIcons.genderMaleFemale,
          color: Colors.blueAccent,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Gender",
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
        firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          MdiIcons.flag,
          color: Colors.blueAccent,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Region",
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Birth Date Field
    final birthDateField = TextFormField(
      autofocus: false,
      controller: birthDateController,
      keyboardType: TextInputType.datetime,
      onSaved: (value) {
        birthDateController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.calendar_view_day,
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Birth Date",
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Age Field
    final ageField = TextFormField(
      autofocus: false,
      controller: ageController,
      keyboardType: TextInputType.number,
      onSaved: (value) {
        ageController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.calendar_view_month,
          color: Colors.lightGreenAccent,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Age",
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Contact Field
    final contactField = TextFormField(
      autofocus: false,
      controller: contactController,
      keyboardType: TextInputType.number,
      onSaved: (value) {
        contactController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.phone,
          color: Colors.orangeAccent,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Contact",
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
          color: Colors.lightBlue,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Email",
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
          color: Colors.red,
        ),
        suffixIcon: InkWell(
          onTap: _togglePasswordView,
          child: const Icon(
            Icons.visibility,
            color: Colors.white,
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Password",
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        hintText: "Minimum 6 Characters Password Needed",
        hintStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.cyan,
          fontSize: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
          color: Colors.red,
        ),
        suffixIcon: InkWell(
          onTap: _toggleConfirmPasswordView,
          child: const Icon(
            Icons.visibility,
            color: Colors.white,
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Confirm Password",
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        hintText: "Minimum 6 Characters Password Needed",
        hintStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.cyan,
          fontSize: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Create Account Button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.teal,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailController.text, passwordController.text);
        },
        child: const Text(
          "Create Account",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    //Other Works
    return Scaffold(
      backgroundColor: Colors.black,
      //Appbar With Back Button
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        //Logo Set
        child: Center(
          child: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/logo_for_signup_page.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    //Fields Set
                    const SizedBox(
                      height: 50,
                    ),
                    firstNameField,
                    const SizedBox(
                      height: 20,
                    ),
                    lastNameField,
                    const SizedBox(
                      height: 20,
                    ),
                    genderField,
                    const SizedBox(
                      height: 20,
                    ),
                    regionField,
                    const SizedBox(
                      height: 20,
                    ),
                    birthDateField,
                    const SizedBox(
                      height: 20,
                    ),
                    ageField,
                    const SizedBox(
                      height: 20,
                    ),
                    contactField,
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
      await _authentication
          .createUserWithEmailAndPassword(email: email, password: password)
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
    users.firstName = firstNameController.text;
    users.lastName = lastNameController.text;
    users.gender = genderController.text;
    users.region = regionController.text;
    users.highScoreEasy = 0;
    users.highScoreMedium = 0;
    users.highScoreHard = 0;
    users.birthDate = birthDateController.text;
    users.age = ageController.text;
    users.contact = contactController.text;

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
