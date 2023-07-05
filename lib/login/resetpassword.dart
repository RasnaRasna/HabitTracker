import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/login/reusable.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  TextEditingController _emailTextcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Reset password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("images/waal.jpg"), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: [
                kheight10,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: reusableTextfield(
                    "Enter Email Id",
                    Icons.lock_outline,
                    true,
                    _emailTextcontroller,
                    (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                ),
                kheight10,
                FirebaseButton(context, "Reset Password", () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _emailTextcontroller.text)
                      .then((value) => Navigator.of(context).pop());
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
