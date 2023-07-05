import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';

TextFormField reusableTextfield(
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller,
  FormFieldValidator<String> validator,
) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: isPasswordType,
    autocorrect: isPasswordType,
    cursorColor: kwhite,
    style: TextStyle(color: kblack),
    decoration: InputDecoration(
      fillColor: Colors.white,
      prefixIcon: Icon(icon, color: Colors.black),
      hintText: text,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintStyle: TextStyle(color: kblack),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    validator: validator, // Pass the validator parameter here
  );
}

// TextField reusableTextfield(
//   String text,
//   IconData icon,
//   bool isPasswordType,
//   TextEditingController controller,
//    FormFieldValidator<String> validator,
// ) {
//   return TextField(
//     controller: controller,
//     obscureText: isPasswordType,
//     enableSuggestions: isPasswordType,
//     autocorrect: isPasswordType,
//     cursorColor: kwhite,
//     style: TextStyle(color: kblack),
//     decoration: InputDecoration(
//       fillColor: Colors.white,
//       prefixIcon: Icon(icon, color: Colors.black),
//       hintText: text,
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       hintStyle: TextStyle(color: kblack),
//       filled: true,
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//           borderSide: BorderSide(width: 0, style: BorderStyle.none)),
//     ),
//     keyboardType: isPasswordType
//         ? TextInputType.visiblePassword
//         : TextInputType.emailAddress,
//   );
// }

Container FirebaseButton(BuildContext context, String title, Function ontap) {
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
      child: Text(title,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return kblack;
            } else {
              return Colors.white;
            }
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
