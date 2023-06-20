// import 'package:flutter/material.dart';
// import 'package:habits_track/bottom_pages/Today.dart';

// import '../bottom_pages/Challenges.dart';
// import '../bottom_pages/Year.dart';
// import '../bottom_pages/discover.dart';
// import '../bottom_pages/month.dart';

// class Newbottomnavigation extends StatefulWidget {
//   const Newbottomnavigation({super.key});

//   @override
//   State<Newbottomnavigation> createState() => _NewbottomnavigationState();
// }

// class _NewbottomnavigationState extends State<Newbottomnavigation> {
//   int currentTab = 0;
//   final List<Widget> tabs = [
//     MyHomePageToday(),
//     MonthBase(),
//     const YearBase(),
//     const ChallengesPage(),
//   ];
//   final PageStorageBucket bucket = PageStorageBucket();
//   Widget currentscreen = MyHomePageToday();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageStorage(bucket: bucket, child: currentscreen),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(Icons.add),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         notchMargin: 30,
//         child: Container(
//           height: 60,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: () {
//                       setState(() {
//                         currentscreen = MyHomePageToday();
//                         currentTab = 0;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.abc_outlined,
//                           color: Colors.amber,
//                         )
//                       ],
//                     ),
//                   ),
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: () {
//                       setState(() {
//                         currentscreen = MonthBase();
//                         currentTab = 1;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.abc_outlined,
//                           color: Colors.amber,
//                         )
//                       ],
//                     ),
//                   ),
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: () {
//                       setState(() {
//                         currentscreen = YearBase();
//                         currentTab = 2;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.abc_outlined,
//                           color: Colors.amber,
//                         )
//                       ],
//                     ),
//                   ),
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: () {
//                       setState(() {
//                         currentscreen = ChallengesPage();
//                         currentTab = 3;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.abc_outlined,
//                           color: Colors.red,
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: () {
//                       setState(() {
//                         currentscreen = MyHomePageToday();
//                         currentTab = 0;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.abc_outlined,
//                           color: Colors.amber,
//                         )
//                       ],
//                     ),
//                   ),
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: () {
//                       setState(() {
//                         currentscreen = MonthBase();
//                         currentTab = 1;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.abc_outlined,
//                           color: Colors.amber,
//                         )
//                       ],
//                     ),
//                   ),
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: () {
//                       setState(() {
//                         currentscreen = YearBase();
//                         currentTab = 2;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.abc_outlined,
//                           color: Colors.amber,
//                         )
//                       ],
//                     ),
//                   ),
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: () {
//                       setState(() {
//                         currentscreen = ChallengesPage();
//                         currentTab = 3;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.abc_outlined,
//                           color: Colors.red,
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
