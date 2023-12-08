import 'package:flutter/material.dart';
import 'package:ocr_app/components/reusable_widget.dart';
import 'package:ocr_app/pages/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ocr_app/utils/color_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("FEEA37"),
            hexStringToColor("FE7537"),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(children: <Widget>[
              logoWidget("assets/images/logo.png"),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Username", Icons.person_outline, false,
                  _usernameTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField(
                  "Email", Icons.mail_outline, false, _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Password", Icons.lock_outline, false,
                  _passwordTextController),
              const SizedBox(
                height: 20,
              ),
              firebaseUIButton(context, "Sign Up", () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                }).onError((error, stackTrace) {});
              }),
            ]),
          ),
        ),
      ),
    );
  }
}
