// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../const.dart';
// import '../../edit_habits/edit_habits.dart';
// import '../../provider/stateofbutton.dart';

// class HabitItemsCard extends StatefulWidget {
//   const HabitItemsCard({
//     super.key,
//      this.habitData,
//      this.habitName,
//      this.daysPerWeek,
//      this.startDate,
//      this.completedCount,
//      this.daySymbols,
//      this.habitId,
//      this.currentDayIndex,
//      this.habitHistory,
//   });

//   final QueryDocumentSnapshot<Object?> habitData;
//   final String? habitName;
//   final int? daysPerWeek;
//   final DateTime? startDate;
//   final int completedCount;
//   final List<Widget> daySymbols;
//   final String habitId;
//   final int currentDayIndex;
//   final List<Map<String, dynamic>> habitHistory;
//   @override
//   State<HabitItemsCard> createState() => _HabitItemsCardState();
// }

// class _HabitItemsCardState extends State<HabitItemsCard> {
//   int _completionCount = 1;

//   @override
//   void initState() {
//     super.initState();
//     _completionCount = widget.completedCount;
//   }

//   // Add this parameter
//   @override
//   Widget build(BuildContext context) {
//     final buttonProvider = Provider.of<MyButtonClickedProvider>(context);

//     return SizedBox(
//       height: 125,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Card(
//           child: GestureDetector(
//             onTap: () {
//               print("habitHistory in MyHomePageToday: ${widget.habitHistory}");
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (ctx) => EditHabits(
//                     habitId: widget.habitData.id,
//                     habitName: widget.habitName,
//                     daysPerWeek: widget.daysPerWeek,
//                     startDate: widget.startDate,
//                     selectedDate: widget.startDate,
//                     habitData: widget.habitData,
//                     habitHistory: widget.habitHistory,
//                   ),
//                 ),
//               );
//             },
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
//                     top: 15,
//                     left: 10,
//                     child: Text(
//                       '🔥 $_completionCount',
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
//                       widget.habitName ?? 'Unknown Habit',
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
//                             ...widget.daySymbols,
//                             KWidth7,
//                             IconButton(
//                               onPressed: () {
//                                 // Check if the habit with habitId is already selected
//                                 if (buttonProvider
//                                     .isHabitSelected(widget.habitId)) {
//                                   // If it is selected, deselect the habit and reset the selected day index for the habit
//                                   buttonProvider
//                                       .toggleHabitSelection(widget.habitId);
//                                   buttonProvider.setSelectedDayIndex(
//                                       widget.habitId, -1);
//                                   setState(() {
//                                     _completionCount--; // Decrease the completion count
//                                   });
//                                 } else {
//                                   // If it is not selected, select the habit and set the selected day index to the currentDayIndex
//                                   buttonProvider
//                                       .toggleHabitSelection(widget.habitId);
//                                   buttonProvider.setSelectedDayIndex(
//                                       widget.habitId, widget.currentDayIndex);
//                                   setState(() {
//                                     _completionCount++; // Increase the completion count
//                                   });
//                                 }
//                               },
//                               icon: StreamBuilder<DocumentSnapshot>(
//                                 stream: FirebaseFirestore.instance
//                                     .collection('add_habits')
//                                     .doc(widget.habitId)
//                                     .snapshots(),
//                                 builder: (BuildContext context,
//                                     AsyncSnapshot<DocumentSnapshot> snapshot) {
//                                   if (snapshot.hasError) {
//                                     // Handle any errors that occur while fetching data
//                                     return const Icon(
//                                       Icons.check_circle,
//                                       color: Colors
//                                           .grey, // Set the default color to grey
//                                     );
//                                   }

//                                   final habitData = snapshot.data?.data()
//                                       as Map<String, dynamic>?;

//                                   // Check if the habit is currently selected (defaults to false if data is null)
//                                   final bool isSelected =
//                                       habitData?['selected'] as bool? ?? false;

//                                   // Return the Icon with the appropriate color based on isSelected
//                                   return Icon(
//                                     Icons.check_circle,
//                                     color: isSelected ? kredcolor : Colors.grey,
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 20,
//                             vertical: 15,
//                           ),
//                           child: Text(
//                             '$_completionCount/${widget.daysPerWeek}',
//                             style: const TextStyle(fontSize: 15),
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const.dart';
import '../../edit_habits/edit_habits.dart';
import '../../provider/stateofbutton.dart';

class HabitItemsCard extends StatefulWidget {
  const HabitItemsCard({
    super.key,
    this.habitData,
    this.habitName,
    this.daysPerWeek,
    this.startDate,
    this.completedCount,
    this.daySymbols,
    this.habitId,
    this.currentDayIndex,
    this.habitHistory,
  });

  final QueryDocumentSnapshot<Object?>? habitData;
  final String? habitName;
  final int? daysPerWeek;
  final DateTime? startDate;
  final int? completedCount;
  final List<Widget>? daySymbols;
  final String? habitId;
  final int? currentDayIndex;
  final List<Map<String, dynamic>>? habitHistory;
  @override
  State<HabitItemsCard> createState() => _HabitItemsCardState();
}

class _HabitItemsCardState extends State<HabitItemsCard> {
  int _completionCount = 1;

  @override
  void initState() {
    super.initState();
    _completionCount = widget.completedCount!;
  }

  // Add this parameter
  @override
  Widget build(BuildContext context) {
    final buttonProvider = Provider.of<MyButtonClickedProvider>(context);

    return SizedBox(
      height: 125,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          child: GestureDetector(
            onTap: () {
              print("habitHistory in MyHomePageToday: ${widget.habitHistory}");
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => EditHabits(
                    habitId: widget.habitData!.id,
                    habitName: widget.habitName!,
                    daysPerWeek: widget.daysPerWeek,
                    startDate: widget.startDate!,
                    // selectedDate: widget.startDate,
                    habitData: widget.habitData!,
                    habitHistory: widget.habitHistory!,
                  ),
                ),
              );
            },
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
                    top: 15,
                    left: 10,
                    child: Text(
                      '🔥 $_completionCount',
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
                      widget.habitName ?? 'Unknown Habit',
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
                            ...widget.daySymbols!,
                            KWidth7,
                            IconButton(
                              onPressed: () {
                                // Check if the habit with habitId is already selected
                                if (buttonProvider
                                    .isHabitSelected(widget.habitId!)) {
                                  // If it is selected, deselect the habit and reset the selected day index for the habit
                                  buttonProvider
                                      .toggleHabitSelection(widget.habitId!);
                                  buttonProvider.setSelectedDayIndex(
                                      widget.habitId!, -1);
                                  setState(() {
                                    _completionCount--; // Decrease the completion count
                                  });
                                } else {
                                  // If it is not selected, select the habit and set the selected day index to the currentDayIndex
                                  buttonProvider
                                      .toggleHabitSelection(widget.habitId!);
                                  buttonProvider.setSelectedDayIndex(
                                      widget.habitId!, widget.currentDayIndex!);
                                  setState(() {
                                    _completionCount++; // Increase the completion count
                                  });
                                }
                              },
                              icon: StreamBuilder<DocumentSnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('add_habits')
                                    .doc(widget.habitId)
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    // Handle any errors that occur while fetching data
                                    return const Icon(
                                      Icons.check_circle,
                                      color: Colors
                                          .grey, // Set the default color to grey
                                    );
                                  }

                                  final habitData = snapshot.data?.data()
                                      as Map<String, dynamic>?;

                                  // Check if the habit is currently selected (defaults to false if data is null)
                                  final bool isSelected =
                                      habitData?['selected'] as bool? ?? false;

                                  // Return the Icon with the appropriate color based on isSelected
                                  return Icon(
                                    Icons.check_circle,
                                    color: isSelected ? kredcolor : Colors.grey,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          child: Text(
                            '$_completionCount/${widget.daysPerWeek}',
                            style: const TextStyle(fontSize: 15),
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
