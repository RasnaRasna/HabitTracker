import 'package:flutter/material.dart';
import 'package:habits_track/signuppage.dart/signup.dart';

Row signupOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Don't have an account? ",
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignupScreen()),
          );
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Sign Up",
          ),
        ),
      ),
    ],
  );
}
