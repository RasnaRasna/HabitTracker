import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login/sign.dart';

Future<void> showLogoutConfirmationDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              print("Signed Out");
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => const SignPage()));
            },
            child: const Text("Logout"),
          ),
        ],
      );
    },
  );
}
