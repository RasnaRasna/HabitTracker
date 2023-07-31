import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/login/resetpassword.dart';

Widget forgetpassword(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 35,
    alignment: Alignment.bottomRight,
    child: TextButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => ResetPassword()),
      ),
      child: const Text(
        "Forgot password?",
        style: TextStyle(
          color: kwhite,
        ),
        textAlign: TextAlign.right,
      ),
    ),
  );
}
