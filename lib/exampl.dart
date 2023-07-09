
// class MyHomePageToday extends StatelessWidget {
//   MyHomePageToday({Key? key});
//   int selectedDayIndex = -1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (ctx) => bottombar()));
//           },
//           icon: Icon(Icons.arrow_back),
//         ),
//         centerTitle: true,
//         title: const Text(
//           " Today",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: Column(
//         children: [
//           kheight50,
//           Expanded(child: buildListViewSeparated()),
//         ],
//       ),
//     );
//   }

//   Widget buildListViewSeparated() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('add_habits').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator(); // Show a loading indicator while data is being fetched
//         }
//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Text(
//               'No data available'); // Show a message if no data is found
//         }

//         return ListView.separated(
//           itemBuilder: (BuildContext context, int index) {
//             final habitData = snapshot.data!.docs[index];
//             final habitName = habitData['name']
//                 as String?; // Use null-aware operator to handle null value
//             final daysPerWeek = habitData['daysPerWeek'] as int?;
//             final startDate = (habitData['startDate'] as Timestamp?)?.toDate();

//             int completedCount = 0; // TODO: Get the actual completed count

//             return Container(
//               height: 125,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: GestureDetector(
//                   onTap: () => Navigator.of(context).push(
//                       MaterialPageRoute(builder: (ctx) => const EditHabits())),
//                   child: Card(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           color: Color.fromARGB(255, 150, 147, 147),
//                           width: 1,
//                         ),
//                       ),
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             top: 20,
//                             left: 10,
//                             child: Text(
//                               '🔥 $completedCount',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           kheight10,
//                           Positioned(
//                             top: 60,
//                             left: 10,
//                             child: Text(
//                               habitName ??
//                                   'Unknown Habit', // Use null-aware operator to provide a default value
//                               style:
//                                   TextStyle(fontSize: 20, color: Colors.black),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 15),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     for (int i = 0; i < 7; i++)
//                                       InkWell(
//                                         onTap: () {
//                                           // Handle the selection logic here
//                                         },
//                                         child: Container(
//                                           color: i < daysPerWeek!
//                                               ? Color.fromARGB(
//                                                   255, 229, 113, 151)
//                                               : Color.fromARGB(
//                                                   255, 246, 211, 223),
//                                           width: 18,
//                                           height: 18,
//                                           child: Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 3.5),
//                                             child: Text(
//                                               i < daysPerWeek ? '✓' : '',
//                                               style: TextStyle(
//                                                   color: Colors.white),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     KWidth7,
//                                     IconButton(
//                                       onPressed: () {},
//                                       icon: Icon(
//                                         Icons.check_circle,
//                                         color:
//                                             Color.fromARGB(255, 229, 113, 151),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 SizedBox(height: 5),
//                                 Padding(
//                                   padding: EdgeInsets.only(right: 20),
//                                   child: Text(
//                                     '${daysPerWeek ?? 0}/7',
//                                     style: TextStyle(fontSize: 15),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//           separatorBuilder: (BuildContext context, int index) {
//             return SizedBox(height: 10);
//           },
//           itemCount: snapshot.data!.docs.length,
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:habits_track/bottom_pages/bottom_bar.dart';
// import 'package:provider/provider.dart';
// import '../const.dart';

// import '../edit_habits/edit_habits.dart';
// import '../provider/selectDateprovider.dart';
// import '../provider/stateofbutton.dart';

// class MyHomePageToday extends StatelessWidget {
//   final String? documentId;
//   MyHomePageToday({Key? key, this.documentId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (ctx) => bottombar()));
//           },
//           icon: Icon(Icons.arrow_back),
//         ),
//         centerTitle: true,
//         title: const Text(
//           " Today",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: Column(
//         children: [
//           kheight50,
//           Expanded(
//             child: Consumer<SelectedDayProvider>(
//               builder: (context, selectedDayProvider, _) {
//                 return buildListViewSeparated(selectedDayProvider);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String _getDaySymbol(int index) {
//     final List<String> symbols = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
//     return symbols[index];
//   }

//   Widget buildListViewSeparated(SelectedDayProvider selectedDayProvider) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('add_habits').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }
//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Center(
//             child: Text(
//               'No data available',
//               style: TextStyle(fontSize: 25),
//             ),
//           );
//         }
//         final habitItems = snapshot.data!.docs.reversed.toList();

//         return ListView.separated(
//           itemBuilder: (BuildContext context, int index) {
//             final habitData = snapshot.data!.docs[index];
//             final habitName = habitData['name'] as String?;
//             final daysPerWeek = habitData['daysPerWeek'] as int?;
//             final startDate = (habitData['startDate'] as Timestamp?)?.toDate();

//             int completedCount = 0; // TODO: Get the actual completed count

//             List<Widget> daySymbols = [];

//             for (int i = 0; i < 7; i++) {
//               final borderColor = i < (daysPerWeek ?? 0)
//                   ? Colors.pink // Set the border color for selected days
//                   : Color.fromARGB(
//                       255, 151, 151, 151); // Set the default border color

//               daySymbols.add(
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 3),
//                   child: GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(
//                           color: borderColor,
//                           width: 1,
//                         ),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       width: 20,
//                       height: 22,
//                       child: Center(
//                         child: Text(
//                           _getDaySymbol(i),
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }

//             return Container(
//               height: 125,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: GestureDetector(
//                   onTap: () => Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (ctx) => EditHabits(
//                         documentId: habitData.id,
//                         habitName: habitName,
//                         daysPerWeek: daysPerWeek,
//                         startDate: startDate,
//                       ),
//                     ),
//                   ),
//                   child: Card(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           color: Color.fromARGB(255, 150, 147, 147),
//                           width: 1,
//                         ),
//                       ),
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             top: 20,
//                             left: 10,
//                             child: Text(
//                               '🔥 $completedCount',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           kheight10,
//                           Positioned(
//                             top: 60,
//                             left: 10,
//                             child: Text(
//                               habitName ?? 'Unknown Habit',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                               vertical: 5,
//                               horizontal: 10,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     ...daySymbols, // Use the daySymbols list here
//                                     KWidth7,
//                                     Consumer<MyButtonClickedProvider>(
//                                       builder: (context, buttonClickedProvider,
//                                           child) {
//                                         return IconButton(
//                                           onPressed: () {
//                                             buttonClickedProvider
//                                                 .toggleButtonClicked(index);
//                                           },
//                                           icon: Icon(
//                                             Icons.check_circle,
//                                             color: buttonClickedProvider
//                                                     .isButtonClicked(index)
//                                                 ? Colors.pink
//                                                 : Colors.blue,
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 30,
//                                     vertical: 10,
//                                   ),
//                                   child: Text(
//                                     '${daysPerWeek ?? 0}/7',
//                                     style: TextStyle(fontSize: 15),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//           separatorBuilder: (BuildContext context, int index) {
//             return SizedBox(height: 10);
//           },
//           itemCount: habitItems.length,
//         );
//       },
//     );
//   }

