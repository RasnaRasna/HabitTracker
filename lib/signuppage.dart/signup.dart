import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/login/reusable.dart';
import 'package:habits_track/onboarding/start.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _usertextcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailTextcontroller = TextEditingController();

  TextEditingController _passwordTextcontroller = TextEditingController();

  bool _isLoading = false;

  Future<void> _signUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailTextcontroller.text.trim(),
          password: _passwordTextcontroller.text.trim(),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => StartingPage()),
        );
      } catch (error) {
        // Handle the error
        print('Error: $error');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

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
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("SIGN UP TO COUNTINUE",
                    style: TextStyle(
                        fontSize: 24,
                        color: kblack,
                        fontWeight: FontWeight.bold)),
                kheight20,
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ReusableTextfield(
                    text: "Enter UserName",
                    icon: Icons.person,
                    isPasswordType: false,
                    controller: _usertextcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ReusableTextfield(
                    text: "Enter Email Id",
                    icon: Icons.email,
                    isPasswordType: false,
                    controller: _emailTextcontroller,
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ReusableTextfield(
                    text: "Enter Password",
                    icon: Icons.lock_outline,
                    isPasswordType: true,
                    controller: _passwordTextcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Password';
                      } else if (value.length < 6) {
                        // You can adjust the minimum length as needed
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : FirebaseButton(context, "Sign up", () {
                          _signUp(context);
                        }),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
