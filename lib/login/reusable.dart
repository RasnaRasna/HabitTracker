import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';

TextField reusableTextfield(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: isPasswordType,
    autocorrect: isPasswordType,
    cursorColor: kwhite,
    style: TextStyle(color: kblack),
    decoration: InputDecoration(
      fillColor: Colors.pink.shade100,
      prefixIcon: Icon(icon, color: Colors.black),
      hintText: text,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintStyle: TextStyle(color: kblack),
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInSignupButton(
    BuildContext context, bool isLogin, Function ontap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {
        ontap();
      },
      child: Text(isLogin ? "LOG IN" : "SIGN UP",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return kblack;
            } else {
              return Colors.pink.shade100;
            }
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
