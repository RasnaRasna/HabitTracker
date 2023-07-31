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
    style: const TextStyle(color: kblack),
    decoration: InputDecoration(
      fillColor: Color.fromARGB(255, 200, 186, 186),
      prefixIcon: Icon(icon, color: Colors.black),
      hintText: text,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintStyle: const TextStyle(color: kblack),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    validator: validator, // Pass the validator parameter here
  );
}

Container FirebaseButton(BuildContext context, String title, Function ontap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {
        ontap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return kblack;
            } else {
              return Color.fromARGB(255, 200, 186, 186);
            }
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(title,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
    ),
  );
}
