import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habits_track/const.dart';

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
                style: GoogleFonts.acme(color: Colors.white, fontSize: 25),
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
                style: GoogleFonts.acme(fontSize: 18),
              ),
              onTap: () {}),
          ListTile(
              leading: Icon(
                Icons.sync,
                color: Colors.black,
              ),
              title: Text(
                'sync',
                style: GoogleFonts.acme(fontSize: 18),
              ),
              onTap: () {}),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
            ),
            title: Text(
              'About',
              style: GoogleFonts.acme(fontSize: 18),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.feedback_outlined,
            ),
            title: Text(
              'Feedback',
              style: GoogleFonts.acme(fontSize: 18),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
            ),
            title: Text(
              'Share',
              style: GoogleFonts.acme(fontSize: 18),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
