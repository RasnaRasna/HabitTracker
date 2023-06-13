import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habits_track/const.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          kheight20,
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("settings"),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Container(
              width: 35,
              height: 35,
              // decoration: BoxDecoration(
              //     color: Color.fromARGB(255, 236, 149, 149),
              //     borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: kblack,
                  size: 20,
                ),
              ),
            ),
            title: Text(
              'About',
              style: GoogleFonts.acme(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 140, 140, 140)),
            ),
          ),
          Kwidth,
          ListTile(
            leading: Container(
              width: 35,
              height: 35,
              // decoration: BoxDecoration(
              //     color: Color.fromARGB(255, 236, 149, 149),
              //     borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.privacy_tip,
                  color: kblack,
                  size: 20,
                ),
              ),
            ),
            title: Text(
              'Privacy Policy',
              style: GoogleFonts.acme(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 140, 140, 140)),
            ),
          ),
          ListTile(
            leading: Container(
              width: 35,
              height: 35,
              // decoration: BoxDecoration(
              //     color: Color.fromARGB(255, 236, 149, 149),
              //     borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: kblack,
                  size: 20,
                ),
              ),
            ),
            title: Text(
              'share',
              style: GoogleFonts.acme(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 140, 140, 140)),
            ),
          ),
          Kwidth,
          ListTile(
            leading: Container(
              width: 35,
              height: 35,
              // decoration: BoxDecoration(
              //     color: Color.fromARGB(255, 236, 149, 149),
              //     borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: kblack,
                  size: 20,
                ),
              ),
            ),
            title: Text(
              'About',
              style: GoogleFonts.acme(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 140, 140, 140)),
            ),
          ),
        ],
      ),
    );
  }
}
