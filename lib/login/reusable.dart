import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';

class ReusableTextfield extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isPasswordType;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  const ReusableTextfield({
    Key? key,
    required this.text,
    required this.icon,
    required this.isPasswordType,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  _ReusableTextfieldState createState() => _ReusableTextfieldState();
}

class _ReusableTextfieldState extends State<ReusableTextfield> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      enableSuggestions: widget.isPasswordType,
      autocorrect: widget.isPasswordType,
      cursorColor: kwhite,
      style: const TextStyle(color: kwhite),
      decoration: InputDecoration(
        fillColor: korangecolor,
        prefixIcon: Icon(widget.icon, color: Colors.white),
        suffixIcon: widget.isPasswordType
            ? GestureDetector(
                onTap: () {
                  // Toggle password visibility
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
              )
            : null,
        hintText: widget.text,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: const TextStyle(color: Colors.white),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
      maxLength: widget.isPasswordType ? 6 : null,
      keyboardType: widget.isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      validator: widget.validator,
    );
  }
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
              return korangecolor;
            }
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
    ),
  );
}
