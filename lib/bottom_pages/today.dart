// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:habits_track/bottom_pages/bottom_bar.dart';
// import 'package:habits_track/provider/stateofbutton.dart';
// import 'package:provider/provider.dart';
// import '../const.dart';

// import '../edit_habits/edit_habits.dart';
// import '../provider/selectDateprovider.dart';

// class MyHomePageToday extends StatelessWidget {

//   final String? documentId;
//   MyHomePageToday({Key? key, this.documentId});

//   @override
//   Widget build(BuildContext context) {
//     final buttonProvider = Provider.of<MyButtonClickedProvider>(context);
//     if (DateTime.now().hour == 0 && DateTime.now().minute == 0) {
//       buttonProvider.resetHabitSelections();
//     }
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (ctx) => const bottombar()));
//           },
//           icon: const Icon(Icons.arrow_back),
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
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser == null) {
//       // User is not authenticated
//       return const Center(
//         child: Text(
//           'User not authenticated',
//           style: TextStyle(fontSize: 25),
//         ),
//       );
//     }

//     final userId = currentUser.uid;

//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('add_habits')
//           .where('userId', isEqualTo: userId)
//           .snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }
//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return const Center(
//             child: Text(
//               'No habits available',
//               style: TextStyle(fontSize: 25),
//             ),
//           );
//         }
//         final habitItems = snapshot.data!.docs;

//         return ListView.separated(
//           itemBuilder: (BuildContext context, int index) {
//             final habitData = snapshot.data!.docs[index];
//             final habitName = habitData['name'] as String?;
//             final daysPerWeek = habitData['daysPerWeek'] as int?;
//             final startDate = (habitData['startDate'] as Timestamp?)?.toDate();

//             int completedCount = 0; // TODO: Get the actual completed count

//             List<Widget> daySymbols = [];
//             final currentDayIndex = DateTime.now().weekday - 1;

//             for (int i = 0; i < 7; i++) {
//               final textColor =
//                   i <= currentDayIndex ? Colors.pink : Colors.black;

//               daySymbols.add(
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 3),
//                   child: GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(
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
//                             color: textColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }

// return SizedBox(
//   height: 125,
//   child: Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     child: GestureDetector(
//       onTap: () => Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (ctx) => EditHabits(
//             documentId: habitData.id,
//             habitName: habitName,
//             daysPerWeek: daysPerWeek,
//             startDate: startDate,
//             selectedDate: startDate,
//           ),
//         ),
//       ),
//                   child: Card(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           color: const Color.fromARGB(255, 150, 147, 147),
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
//                               style: const TextStyle(
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
//                               style: const TextStyle(
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
//                                     IconButton(
//                                       onPressed: () {
//                                         final buttonProvider = Provider.of<
//                                                 MyButtonClickedProvider>(
//                                             context,
//                                             listen: false);
//                                         buttonProvider
//                                             .toggleHabitSelection(habitData.id);
//                                       },
//                                       icon: Icon(
//                                         Icons.check_circle,
//                                         color: Provider.of<
//                                                         MyButtonClickedProvider>(
//                                                     context)
//                                                 .isHabitSelected(habitData.id)
//                                             ? Colors
//                                                 .pink // Set the color when selected
//                                             : Colors
//                                                 .grey, // Set the default color
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 30,
//                                     vertical: 10,
//                                   ),
//                                   child: Text(
//                                     '0/$daysPerWeek',
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
//             return const SizedBox(height: 10);
//           },
//           itemCount: habitItems.length,
//         );
//       },
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habits_track/bottom_pages/bottom_bar.dart';
import 'package:habits_track/edit_habits/edit_habits.dart';
import 'package:habits_track/provider/stateofbutton.dart';
import 'package:provider/provider.dart';
import '../const.dart';

import '../provider/selectDateprovider.dart';

class MyHomePageToday extends StatelessWidget {
  final String? documentId;
  MyHomePageToday({Key? key, this.documentId});

  @override
  Widget build(BuildContext context) {
    final buttonProvider = Provider.of<MyButtonClickedProvider>(context);
    if (DateTime.now().hour == 0 && DateTime.now().minute == 0) {
      buttonProvider.resetHabitSelections();
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => const bottombar()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text(
          " Today",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          kheight50,
          Expanded(
            child: Consumer<SelectedDayProvider>(
              builder: (context, selectedDayProvider, _) {
                return buildListViewSeparated(selectedDayProvider);
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getDaySymbol(int index) {
    final List<String> symbols = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return symbols[index];
  }

  Widget buildListViewSeparated(SelectedDayProvider selectedDayProvider) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      // User is not authenticated
      return const Center(
        child: Text(
          'User not authenticated',
          style: TextStyle(fontSize: 25),
        ),
      );
    }

    final userId = currentUser.uid;

    return Consumer<MyButtonClickedProvider>(
      builder: (context, buttonProvider, _) {
        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('add_habits')
              .where('userId', isEqualTo: userId)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  'No habits available',
                  style: TextStyle(fontSize: 25),
                ),
              );
            }
            final habitItems = snapshot.data!.docs;

            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final habitData = snapshot.data!.docs[index];
                final habitName = habitData['name'] as String?;
                final daysPerWeek = habitData['daysPerWeek'] as int?;
                final startDate =
                    (habitData['startDate'] as Timestamp?)?.toDate();

                int completedCount = 0; // TODO: Get the actual completed count

                List<Widget> daySymbols = [];
                final currentDayIndex = DateTime.now().weekday - 1;

                for (int i = 0; i < 7; i++) {
                  final backgroundColor =
                      i == selectedDayProvider.selectedDayIndex
                          ? Colors.pink
                          : Colors.white;
                  final textColor =
                      i <= currentDayIndex ? Colors.pink : Colors.black;

                  daySymbols.add(
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Container(
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          border: Border.all(
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 20,
                        height: 22,
                        child: Center(
                          child: Text(
                            _getDaySymbol(i),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return SizedBox(
                  height: 125,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color.fromARGB(255, 150, 147, 147),
                            width: 1,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 20,
                              left: 10,
                              child: Text(
                                '🔥 $completedCount',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            kheight10,
                            Positioned(
                              top: 60,
                              left: 10,
                              child: Text(
                                habitName ?? 'Unknown Habit',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ...daySymbols, // Use the daySymbols list here
                                      KWidth7,
                                      IconButton(
                                        onPressed: () {
                                          buttonProvider.toggleHabitSelection(
                                              habitData.id);
                                          if (buttonProvider
                                              .isHabitSelected(habitData.id)) {
                                            selectedDayProvider
                                                .selectCurrentDay();
                                          } else {
                                            selectedDayProvider.selectDay(
                                                -1); // Reset the selected day index
                                          }
                                        },
                                        icon: Icon(
                                          Icons.check_circle,
                                          color: buttonProvider
                                                  .isHabitSelected(habitData.id)
                                              ? Colors
                                                  .pink // Set the color when selected
                                              : Colors
                                                  .grey, // Set the default color
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 10,
                                    ),
                                    child: Text(
                                      '0/$daysPerWeek',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
              itemCount: habitItems.length,
            );
          },
        );
      },
    );
  }
}
