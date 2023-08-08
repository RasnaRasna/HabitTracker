import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/entery.dart';

import 'package:habits_track/login/sign.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // curve: Curves.easeOut,
            decoration: BoxDecoration(color: korangecolor),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'Habit Tracker',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          ListTile(
              leading: const Icon(
                Icons.notes,
                color: kredcolor,
              ),
              title: const Text(
                'Entries',
                style: TextStyle(fontSize: 18, color: kredcolor),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const Entery()));
              }),
          ListTile(
              leading: const Icon(
                Icons.settings,
                color: kredcolor,
              ),
              title: const Text(
                'settings',
                style: TextStyle(fontSize: 18, color: kredcolor),
              ),
              onTap: () {}),
          ListTile(
              leading: const Icon(
                Icons.logout,
                color: kredcolor,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 18, color: kredcolor),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const SignPage()));
                });
              }),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              color: kredcolor,
            ),
            title: const Text(
              'About',
              style: TextStyle(fontSize: 18, color: kredcolor),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.feedback_outlined,
              color: kredcolor,
            ),
            title: const Text(
              'Feedback',
              style: TextStyle(fontSize: 18, color: kredcolor),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
              color: kredcolor,
            ),
            title: const Text(
              'Share',
              style: TextStyle(fontSize: 18, color: kredcolor),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
