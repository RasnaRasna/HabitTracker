import 'package:flutter/material.dart';

import 'Challenges.dart';
import 'Today.dart';
import 'Year.dart';
import 'discover.dart';
import 'month.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({super.key});

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationbar> {
  int selectedindex = 0;
  final List<Widget> tabs = [
    const MyHomePageToday(),
    const MonthBase(),
    const YearBase(),
    const ChallengesPage(),
    const DiscoverPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedindex,
          elevation: 20,
          onTap: (newselectedindex) {
            setState(() {
              selectedindex = newselectedindex;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Today"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: "month"),
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: "year"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "challenge"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "discover"),
          ]),
      body: tabs[selectedindex],
    ));
  }
}
