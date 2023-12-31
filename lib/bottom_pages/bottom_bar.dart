import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/homepage/Home_page.dart';
import 'package:habits_track/bottom_pages/year/year.dart';
import 'package:habits_track/const.dart';
import 'package:provider/provider.dart';

import '../provider/genderprovider.dart';
import 'challenges/Challenges.dart';
import 'discover/discover.dart';
import 'month/month.dart';

// class bottombar extends StatefulWidget {
//   final String? selectedGender;
//   final String? name;

//   const bottombar({
//     Key? key,
//     this.selectedGender,
//     this.name,
//   }) : super(key: key);

//   @override
//   State<bottombar> createState() => _BottomNavigationBarState();
// }

// class _BottomNavigationBarState extends State<bottombar> {
//   int selectedindex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final String? selectedGender =
//         widget.selectedGender; // Store the value in a local variable
//     final String? name = widget.name;
//     final List<Widget> tabs = [
//       Homapage(
//         selectedGender: selectedGender,
//         name: name,
//       ),
//       MonthBase(),
//       const YearBase(),
//       const ChallengesPage(),
//       const DiscoverPage(),
//     ];

//     return SafeArea(
//         child: Scaffold(
//       extendBody: true,
//       bottomNavigationBar: BottomNavigationBar(
//           selectedItemColor: Color.fromARGB(255, 229, 113, 151),
//           unselectedItemColor: Colors.grey,
//           currentIndex: selectedindex,
//           elevation: 20,
//           onTap: (newselectedindex) {
//             setState(() {
//               selectedindex = newselectedindex;
//             });
//           },
//           type: BottomNavigationBarType.fixed,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Today"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.calendar_month), label: "month"),
//             BottomNavigationBarItem(icon: Icon(Icons.apps), label: "year"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.back_hand), label: "challenge"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.search), label: "discover"),
//           ]),
//       body: tabs[selectedindex],
//     ));
//   }
// }

// class bottombar extends StatefulWidget {
//   final String? selectedGender;
//   final String? name;
//   final String? habitId;
//   final String? habitName;
//   final DateTime? startDate;
//   final List<Map<String, dynamic>> habitHistory;

//   bottombar({
//     Key? key,
//     this.selectedGender,
//     this.name,
//     this.habitId,
//     this.habitName,
//     required this.startDate,
//     required this.habitHistory,
//   }) : super(key: key) {

//   }
//   @override
//   State<bottombar> createState() => _bottombarState();
// }

// class _bottombarState extends State<bottombar> {
//   int selectedIndex = 0;
//   late GenderProvider genderProvider;

//   @override
//   void initState() {
//     super.initState();
//     genderProvider = GenderProvider();
//     genderProvider.setGender(widget.selectedGender);
//     genderProvider.setName(
//       widget.name ?? '',
//     );

//     print('initState executed');
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> tabs = [
//       Consumer<GenderProvider>(
//         builder: (context, genderProvider, _) => Homapage(
//           selectedGender: genderProvider.selectedGender,
//           name: genderProvider.name,
//           habitHistory: widget.habitHistory,
//         ),
//       ),
//       MonthBase(),
//       YearBase(),

//       const ChallengesPage(),
//       const DiscoverPage(),
//     ];

//     return SafeArea(
//       child: Scaffold(
//         extendBody: true,
//         bottomNavigationBar: BottomNavigationBar(
//           selectedItemColor: Color.fromARGB(255, 229, 113, 151),
//           unselectedItemColor: Colors.grey,
//           currentIndex: selectedIndex,
//           elevation: 20,
//           onTap: (newSelectedIndex) {
//             setState(() {
//               selectedIndex = newSelectedIndex;
//             });
//           },
//           type: BottomNavigationBarType.fixed,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Today"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.calendar_month), label: "Month"),
//             BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Year"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.back_hand), label: "Challenge"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.search), label: "Discover"),
//           ],
//         ),
//         body: tabs[selectedIndex],
//       ),
//     );
//   }
// }

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';

class bottombar extends StatefulWidget {
  final String? selectedGender;
  final String? name;
  final String? habitId;
  final String? habitName;
  final DateTime? startDate;
  final List<Map<String, dynamic>> habitHistory;

  bottombar({
    Key? key,
    this.selectedGender,
    this.name,
    this.habitId,
    this.habitName,
    required this.startDate,
    required this.habitHistory,
  }) : super(key: key);

  @override
  State<bottombar> createState() => _bottombarState();
}

class _bottombarState extends State<bottombar> {
  int selectedIndex = 0;
  late GenderProvider genderProvider;
  final DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    genderProvider = GenderProvider();
    genderProvider.setGender(widget.selectedGender);
    genderProvider.setName(widget.name ?? '');

    print('initState executed');
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      Consumer<GenderProvider>(
        builder: (context, genderProvider, _) => Homapage(
          selectedGender: genderProvider.selectedGender,
          name: genderProvider.name,
          habitHistory: widget.habitHistory,
        ),
      ),
      const MonthBase(),
      const YearBase(),
      const ChallengesPage(),
      const Discover(),
    ];

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: korangecolor,
              boxShadow: [
                BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: GNav(
                tabBorderRadius: 20,
                gap: 2,
                activeColor: kredcolor,
                curve: Curves.fastLinearToSlowEaseIn,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                duration: const Duration(milliseconds: 800),
                tabBackgroundColor: Colors.white,
                tabs: [
                  const GButton(
                    icon: Icons.home,
                    text: 'Today',
                    iconColor: kwhite,
                  ),
                  GButton(
                    icon: Icons.calendar_month,
                    text: DateFormat('MMMM').format(today),
                    iconColor: kwhite,
                  ),
                  GButton(
                    icon: Icons.apps,
                    text: '${today.year}',
                    iconColor: kwhite,
                  ),
                  const GButton(
                    icon: Icons.back_hand,
                    text: 'Challenge',
                    iconColor: kwhite,
                  ),
                  const GButton(
                    icon: Icons.message_sharp,
                    text: 'Entries',
                    iconColor: kwhite,
                  ),
                ],
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }
}
