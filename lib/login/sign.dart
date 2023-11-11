import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/login/countinue_google.dart';
import 'package:habits_track/login/forget_password.dart';
import 'package:habits_track/login/reusable.dart';
import 'package:habits_track/login/signoption.dart';
import 'package:habits_track/onboarding/start.dart';
import 'package:email_validator/email_validator.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key, Key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool isSigningIn = false;
  // Track the sign-in process
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/back.jpeg"),
            // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SIGN IN TO CONTINUE",
                    style: GoogleFonts.acme(
                      fontSize: 24,
                    ),
                  ),
                  kheight20,
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ReusableTextfield(
                      text: "Enter email",
                      icon: Icons.person,
                      isPasswordType: false,
                      controller: _emailcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an email';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ReusableTextfield(
                      text: "Enter password",
                      icon: Icons.lock_outline,
                      isPasswordType: true,
                      controller: _passwordcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                  ),
                  forgetpassword(context),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child:
                        isSigningIn // Display CircularProgressIndicator when signing in
                            ? const CircularProgressIndicator()
                            : FirebaseButton(
                                context,
                                "SIGN IN",
                                () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      isSigningIn = true;
                                    });

                                    FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                      email: _emailcontroller.text,
                                      password: _passwordcontroller.text,
                                    )
                                        .then((value) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (ctx) =>
                                              const StartingPage(),
                                        ),
                                      );
                                    }).catchError((error) {
                                      if (error.code == 'wrong-password') {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                'Wrong Password',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              content: const Text(
                                                'The password you entered is incorrect.',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('OK'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        print(
                                            "Error occurred: ${error.toString()}");
                                      }
                                    }).whenComplete(() {
                                      setState(() {
                                        isSigningIn = false;
                                      });
                                    });
                                  }
                                },
                              ),
                  ),
                  signupOption(context),
                  const Text(
                    "OR",
                  ),
                  continueWithGoogle(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
