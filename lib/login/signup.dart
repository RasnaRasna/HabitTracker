import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/login/reusable.dart';
import 'package:habits_track/onboarding/start.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  TextEditingController _usertextcontroller = TextEditingController();

  TextEditingController _emailTextcontroller = TextEditingController();
  TextEditingController _passwordTextcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: reusableTextfield(
                "Enter UserName",
                Icons.person,
                false,
                _usertextcontroller,
              ),
            ),
            kheight10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: reusableTextfield(
                "Enter Email Id",
                Icons.lock_outline,
                true,
                _emailTextcontroller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: reusableTextfield(
                "Enter Password",
                Icons.lock_outline,
                true,
                _passwordTextcontroller,
              ),
            ),
            kheight10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FirebaseButton(context, "Sign up", () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailTextcontroller.text,
                        password: _passwordTextcontroller.text)
                    .then((value) {
                  print("Created new account");
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => StartingPage()));
                }).onError((error, stackTrace) {
                  print("Error${error.toString()}");
                });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
