import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/login/reusable.dart';
import 'package:habits_track/login/signup.dart';
import 'package:habits_track/onboarding/start.dart';

class SignPage extends StatefulWidget {
  SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  bool passwordVisible = false;
  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

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
                "Enter Username",
                Icons.person,
                false,
                _emailcontroller,
              ),
            ),
            kheight10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: reusableTextfield(
                "Enter password",
                Icons.lock_outline,
                true,
                _passwordcontroller,
              ),
            ),
            kheight10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: signInSignupButton(context, true, () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => StartingPage()));
              }),
            ),
            signupOption(context)
          ],
        ),
      ),
    );
  }

  Row signupOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don,t have an account ?",
          style: TextStyle(color: Colors.black45),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignupScreen()));
          },
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
        )
      ],
    );
  }
}
