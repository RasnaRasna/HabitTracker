import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:habits_track/Firebase/logout.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/login/sign.dart';
import 'package:habits_track/settings/entery.dart';

import 'package:habits_track/settings/privacy.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const Entery(
                              fromGuidedJournaling: false,
                            )));
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
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => AboutScreen()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.delete,
              color: kredcolor,
            ),
            title: const Text(
              ' Delete Account',
              style: TextStyle(fontSize: 18, color: kredcolor),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: korangecolor,
                    title: const Text(
                      'Delete Account',
                      style: TextStyle(color: Colors.white),
                    ),
                    content: const Text(
                      'Are you sure you want to Delete your Account  ?',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'CANCEL',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          try {
                            // Delete the user's account
                            await FirebaseAuth.instance.currentUser?.delete();

                            // Redirect to the login page or any appropriate screen after deletion
                            Navigator.of(context).pop();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => const SignPage()));
                          } catch (error) {
                            // Handle errors, e.g., display a snackbar or show an error dialog
                            print("Error occurred: ${error.toString()}");
                          }
                        },
                        child: const Text(
                          'YES',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.privacy_tip,
              color: kredcolor,
            ),
            title: const Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 18, color: kredcolor),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => PrivacyPolicyScreen()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.message,
              color: kredcolor,
            ),
            title: const Text(
              'Feedback',
              style: TextStyle(fontSize: 18, color: kredcolor),
            ),
            onTap: () async {
              const url =
                  'mailto:rasnack7@gmail.com?subject=Review on Habit Tracker  &body= need';

              Uri uri = Uri.parse(url);
              await launchUrl(uri);
            },
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
            onTap: () {
              share();
            },
          ),
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
                showLogoutConfirmationDialog(context);
              }),
        ],
      ),
    );
  }
}

Future share() async {
  await FlutterShare.share(
      title: ' Habit Tracker',
      text: 'Habit Tracker',
      linkUrl:
          'https://play.google.com/store/apps/details?id=in.brototype.habits_track&pcampaignid=web_share');
}
