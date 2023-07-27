import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:habits_track/login/sign.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            // curve: Curves.easeOut,
            decoration: BoxDecoration(color: Colors.pink.shade100),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'Habit Tracker',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text(
                'settings',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {}),
          ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => SignPage()));
                });
              }),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
            ),
            title: Text(
              'About',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.feedback_outlined,
            ),
            title: Text(
              'Feedback',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
            ),
            title: Text(
              'Share',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
