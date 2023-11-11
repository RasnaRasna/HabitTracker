import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/login/reusable.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Reset password",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: kblack,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/back.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  kheight10,
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ReusableTextfield(
                      text: "Enter Email Id",
                      icon: Icons.email,
                      isPasswordType: false,
                      controller: _emailTextController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an Email Id';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  kheight10,
                  FirebaseButton(context, "Reset Password", () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(
                              email: _emailTextController.text)
                          .then((value) => Navigator.of(context).pop());
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
