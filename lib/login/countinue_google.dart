import 'package:flutter/material.dart';
import '../const.dart';
import '../onboarding/start.dart';
import '../Firebase/firebase_services.dart';

Row continueWithGoogle(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Image.asset(
        "images/google-removebg-preview.png",
        width: 40,
        height: 40,
      ),
      TextButton(
        onPressed: () async {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
          try {
            await FirebaseServices().signInWithGoogle();
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const StartingPage(),
              ),
            );
          } catch (e) {
            // Handle the sign-in cancellation or error
            print('Sign-in canceled or error: $e');
            Navigator.pop(context); // Close the progress dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Sign-in Error'),
                  content: const Text('An error occurred during sign-in.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: const Text(
          "Continue with Gmail",
          style: TextStyle(color: kwhite),
        ),
      ),
    ],
  );
}
