import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const.dart';
import '../../edit_habits/edit_habits.dart';
import '../../provider/stateofbutton.dart';

class HabitItemsCard extends StatelessWidget {
  const HabitItemsCard({
    super.key,
    required this.habitData,
    required this.habitName,
    required this.daysPerWeek,
    required this.startDate,
    required this.completedCount,
    required this.daySymbols,
    required this.habitId,
    required this.currentDayIndex,
    required this.habitHistory,
  });

  final QueryDocumentSnapshot<Object?> habitData;
  final String? habitName;
  final int? daysPerWeek;
  final DateTime? startDate;
  final int completedCount;
  final List<Widget> daySymbols;
  final String habitId;
  final int currentDayIndex;
  final List<Map<String, dynamic>> habitHistory; // Add this parameter

  @override
  Widget build(BuildContext context) {
    final buttonProvider = Provider.of<MyButtonClickedProvider>(context);
    return SizedBox(
      height: 125,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => EditHabits(
                  habitId: habitData.id,
                  habitName: habitName,
                  daysPerWeek: daysPerWeek,
                  startDate: startDate,
                  selectedDate: startDate,
                  habitData: habitData,
                  habitHistory: habitHistory,
                ),
              ),
            ),
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
                            ...daySymbols,
                            KWidth7,
                            IconButton(
                              onPressed: () {
                                if (buttonProvider.isHabitSelected(habitId)) {
                                  buttonProvider.toggleHabitSelection(habitId);
                                  buttonProvider.setSelectedDayIndex(habitId,
                                      -1); // Reset the selected day index for the habit
                                } else {
                                  buttonProvider.toggleHabitSelection(habitId);
                                  buttonProvider.setSelectedDayIndex(
                                      habitId, currentDayIndex);
                                }
                              },
                              icon: StreamBuilder<DocumentSnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('add_habits')
                                    .doc(habitId)
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    // Handle any errors that occur while fetching data
                                    return Icon(
                                      Icons.check_circle,
                                      color:
                                          Colors.grey, // Set the default color
                                    );
                                  }

                                  final habitData = snapshot.data?.data()
                                      as Map<String, dynamic>?;

                                  final bool isSelected =
                                      habitData?['selected'] as bool? ?? false;

                                  return Icon(
                                    Icons.check_circle,
                                    color:
                                        isSelected ? Colors.pink : Colors.grey,
                                  );
                                },
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
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:habits_track/provider/habitcomplition.dart';
// import 'package:provider/provider.dart';

// import '../../const.dart';
// import '../../edit_habits/edit_habits.dart';
// import '../../provider/stateofbutton.dart';

// class HabitItemsCard extends StatelessWidget {
//   const HabitItemsCard({
//     super.key,
//     required this.habitData,
//     required this.habitName,
//     required this.daysPerWeek,
//     required this.startDate,
//     required this.completedCount,
//     required this.daySymbols,
//     required this.habitId,
//     required this.currentDayIndex,
//     required this.habitHistory,
//   });
//   final List<Map<String, dynamic>> habitHistory;

//   final QueryDocumentSnapshot<Object?> habitData;
//   final String? habitName;
//   final int? daysPerWeek;
//   final DateTime? startDate;
//   final int completedCount;
//   final List<Widget> daySymbols;
//   final String habitId;
//   final int currentDayIndex;

//   @override
//   Widget build(BuildContext context) {
//     final buttonProvider = Provider.of<MyButtonClickedProvider>(context);
//     print("habitcard:${habitData}");
//     return SizedBox(
//       height: 125,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Card(
//           child: GestureDetector(
//             onTap: () => Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (ctx) => EditHabits(
//                   habitId: habitData.id,
//                   habitName: habitName!,
//                   daysPerWeek: daysPerWeek,
//                   startDate: startDate!,
//                   selectedDate: startDate,
//                   habitData: habitData,
//                   habitHistory: habitHistory,
//                 ),
//               ),
//             ),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                   color: const Color.fromARGB(255, 150, 147, 147),
//                   width: 1,
//                 ),
//               ),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     top: 20,
//                     left: 10,
//                     child: Text(
//                       '🔥 $completedCount',
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   kheight10,
//                   Positioned(
//                     top: 60,
//                     left: 10,
//                     child: Text(
//                       habitName ?? 'Unknown Habit',
//                       style: const TextStyle(
//                         fontSize: 20,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 5,
//                       horizontal: 10,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             ...daySymbols,
//                             KWidth7,
//                             Consumer<MyButtonClickedProvider>(
//                               builder: (context, buttonProvider, _) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     final isSelected =
//                                         buttonProvider.isHabitSelected(habitId);
//                                     buttonProvider
//                                         .toggleHabitSelection(habitId);
//                                     if (isSelected) {
//                                       buttonProvider.setSelectedDayIndex(
//                                           habitId, -1);
//                                     } else {
//                                       buttonProvider.setSelectedDayIndex(
//                                           habitId, currentDayIndex);
//                                     }
//                                   },
//                                   child: Builder(
//                                     builder: (context) {
//                                       final isSelected = buttonProvider
//                                           .isHabitSelected(habitId);
//                                       final int? selectedDayIndex =
//                                           buttonProvider
//                                               .getSelectedDayIndex(habitId);

//                                       final Color iconColor =
//                                           selectedDayIndex != null &&
//                                                   selectedDayIndex ==
//                                                       currentDayIndex
//                                               ? Colors.pink
//                                               : Colors.grey;

//                                       return Icon(
//                                         Icons.check_circle,
//                                         color: iconColor,
//                                       );
//                                     },
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 30,
//                             vertical: 10,
//                           ),
//                           child: Text(
//                             '0/$daysPerWeek',
//                             style: TextStyle(fontSize: 15),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
