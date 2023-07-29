// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:habits_track/bottom_pages/today.dart';
// import 'package:habits_track/const.dart';
// import 'package:intl/intl.dart';

// import '../bottom_pages/bottom_bar.dart';
// import '../reminder/reminder.dart';
// import 'weekbox.dart';

// class Addhabits extends StatefulWidget {
//   const Addhabits({super.key});

//   @override
//   State<Addhabits> createState() => _AddhabitsState();
// }

// class _AddhabitsState extends State<Addhabits> {
//   DateTime? selectedDate;
//   String? selectedHabit = '';
//   int selectedDaysPerWeek = -1;
//   TextEditingController Habitname = TextEditingController();

//   final CollectionReference HabitsTemplates =
//       FirebaseFirestore.instance.collection("HabitsTemplates");
//   final CollectionReference Addhabits =
//       FirebaseFirestore.instance.collection("add_habits");

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//             onPressed: () => showDialog<String>(
//                   context: context,
//                   builder: (BuildContext context) => AlertDialog(
//                     title: const Center(child: Text(' Warning')),
//                     content: const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child:
//                           Text('if you made changes they will\n be discarded'),
//                     ),
//                     actions: <Widget>[
//                       TextButton(
//                         onPressed: () => Navigator.pop(context, 'Cancel'),
//                         child: const Text('Cancel'),
//                       ),
//                       TextButton(
//                         onPressed: () => Navigator.of(context).push(
//                             MaterialPageRoute(
//                                 builder: (ctx) => const bottombar())),
//                         child: const Text(
//                           'Discard changes',
//                           style: TextStyle(color: Colors.red),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//             icon: const Icon(
//               Icons.cancel_sharp,
//               color: Colors.black,
//             )),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 AddHabitData();
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (ctx) => MyHomePageToday()));
//               },
//               child: const Text(
//                 "Save",
//                 style: TextStyle(fontSize: 16.0, color: Colors.black),
//               ))
//         ],
//         title: const Text(
//           "New habit",
//           style: TextStyle(fontSize: 18.0, color: Colors.black),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             kheight10,
//             const Align(
//                 alignment: Alignment.topLeft,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 25),
//                       child: Text(
//                         "Habbit Name",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 )),
//             kheight10,
//             Center(
//               child: SizedBox(
//                 // width: 350,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadiusDirectional.circular(10.0),
//                       border: Border.all(
//                           color: const Color.fromARGB(255, 236, 137, 170))),
//                   child: TextField(
//                     controller: Habitname,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedHabit = value;
//                       });
//                     },
//                     decoration: InputDecoration(
//                         contentPadding:
//                             const EdgeInsets.symmetric(horizontal: 20),
//                         border: InputBorder.none,
//                         hintText: selectedHabit,
//                         hintStyle: const TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 20)),
//                   ),
//                 ),
//               ),
//             ),
//             kheight10,
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Text(
//                 "Templates",
//                 style: TextStyle(fontSize: 20, color: Colors.black),
//               ),
//             ),
//             kheight10,
//             habitTemplateItems(),
//             kheight10,
//             const Text(
//               "How many days per Week should you complete that habit? ",
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//             kheight10,
//             SelectableContainer(
//               selectedIndex: selectedDaysPerWeek,
//               onSelected: (Index) {
//                 setState(() {
//                   selectedDaysPerWeek = Index;
//                 });
//               },
//             ),
//             kheight10,
//             const Text(
//               "Start Date ",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 17,
//                   color: Colors.black),
//             ),
//             kheight10,
//             GestureDetector(
//               onTap: () {
//                 _showDatePicker(context);
//               },
//               child: Row(
//                 children: [
//                   // const SizedBox(
//                   //   width: 25,
//                   // ),
//                   Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                         border: Border.all(
//                             color: kredcolor)),
//                     width: 350,
//                     height: 50,
//                     child: Center(
//                       child: Text(
//                         selectedDate != null
//                             ? getFormattedDate(selectedDate!)
//                             : 'Select Date',
//                         style:
//                             const TextStyle(fontSize: 18, color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             kheight10,
//             const Text(
//               "Reminders  ",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 17,
//                   color: Colors.black),
//             ),
//             kheight10,
//             GestureDetector(
//               onTap: () {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (ctx) => const Reminderpage()));
//               },
//               child: Row(children: [
//                 // const SizedBox(
//                 //   width: 25,
//                 // ),
//                 Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.0),
//                       border: Border.all(
//                           color: kredcolor)),
//                   width: 350,
//                   height: 50,
//                   child: const Center(
//                     child: Text(
//                       'Remindes ',
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   StreamBuilder<QuerySnapshot<Object?>> habitTemplateItems() {
//     return StreamBuilder(
//       stream: HabitsTemplates.snapshots(),
//       builder: (context, AsyncSnapshot snapshot) {
//         if (snapshot.hasData) {
//           return SizedBox(
//             height: 50, // Specify a fixed height for the ListView
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 final DocumentSnapshot templates = snapshot.data!.docs[index];
//                 return Row(
//                   children: [
//                     const SizedBox(
//                         // width: 10,
//                         // height: 10,
//                         ),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedHabit = templates["habit Name"];
//                         });
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//                           border: Border.all(
//                             color: kredcolor,
//                           ),
//                         ),
//                         width: 130,
//                         child: Center(
//                           child: Text(
//                             templates['habit Name'],
//                             style: const TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 15,
//                       height: 10,
//                     ),
//                   ],
//                 );
//               },
//             ),
//           );
//         }
//         return const Text("No templates");
//         // Return a widget when snapshot does not have data
//       },
//     );
//   }

//   Future<void> _showDatePicker(BuildContext context) async {
//     DateTime? newDate;
//     await showModalBottomSheet(
//       context: context,
//       builder: (BuildContext builder) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(
//               height: 216,
//               child: CupertinoDatePicker(
//                 mode: CupertinoDatePickerMode.date,
//                 initialDateTime: selectedDate ?? DateTime.now(),
//                 minimumDate: selectedDate != null &&
//                         selectedDate!.isAfter(DateTime.now())
//                     ? DateTime.now()
//                     : null,
//                 onDateTimeChanged: (DateTime newDateTime) {
//                   // Check if selected date is before or equal to current date
//                   if (newDateTime.isBefore(DateTime.now()) ||
//                       newDateTime.isAtSameMomentAs(DateTime.now())) {
//                     newDate = newDateTime;
//                   }
//                 },
//               ),
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: TextButton(
//                 onPressed: () {
//                   if (newDate != null) {
//                     setState(() {
//                       selectedDate = newDate;
//                     });
//                   }
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text(
//                   'Done',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // Future<void> AddHabitData() async {
//   //   try {
//   //     // Retrieve the current user ID
//   //     final user = FirebaseAuth.instance.currentUser;
//   //     final userId = user?.uid;

//   //     final QuerySnapshot snapshot = await FirebaseFirestore.instance
//   //         .collection('add_habits')
//   //         .where('name', isEqualTo: selectedHabit)
//   //         .where('userId', isEqualTo: userId)
//   //         .get();

//   //     if (snapshot.docs.isNotEmpty) {
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         const SnackBar(
//   //           backgroundColor: Colors.red,
//   //           content: Text('Habit already exists'),
//   //         ),
//   //       );
//   //     } else {
//   //       await FirebaseFirestore.instance.collection('add_habits').add({
//   //         'name': selectedHabit,
//   //         'daysPerWeek': selectedDaysPerWeek + 1,
//   //         'startDate': Timestamp.fromDate(selectedDate!),
//   //         'userId': userId,
//   //         'selectedDayIndex': -1, // Set initial value for selectedDayIndex
//   //         'isHabitSelected': false, // Set initial value for isHabitSelected
//   //       });

//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         const SnackBar(
//   //           backgroundColor: Colors.green,
//   //           content: Text('Habit added successfully'),
//   //         ),
//   //       );
//   //     }
//   //   } catch (e) {
//   //     print('Error saving habit data: $e');
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(
//   //         backgroundColor: Colors.red,
//   //         content: Text('Failed to save habit'),
//   //       ),
//   //     );
//   //   }
//   // }

//   Future<void> AddHabitData() async {
//     try {
//       // Retrieve the current user ID
//       final user = FirebaseAuth.instance.currentUser;
//       final userId = user?.uid;

//       final QuerySnapshot snapshot = await FirebaseFirestore.instance
//           .collection('add_habits')
//           .where('name', isEqualTo: selectedHabit)
//           .where('userId',
//               isEqualTo: userId) // Add the query to check the user ID
//           .get();

//       if (snapshot.docs.isNotEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             backgroundColor: Colors.red,
//             content: Text('Habit already exists'),
//           ),
//         );
//       } else {
//         await FirebaseFirestore.instance.collection('add_habits').add({
//           'name': selectedHabit,
//           'daysPerWeek': selectedDaysPerWeek + 1,
//           'startDate': Timestamp.fromDate(selectedDate!),
//           'userId': userId, // Store the user ID with the habit data
//         });

//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             backgroundColor: Colors.green,
//             content: Text('Habit added successfully'),
//           ),
//         );
//       }
//     } catch (e) {
//       print('Error saving habit data: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           backgroundColor: Colors.red,
//           content: Text('Failed to save habit'),
//         ),
//       );
//     }
//   }
// }

// String getFormattedDate(DateTime date) {
//   final formatter = DateFormat('d-MMMM-yyyy');
//   return formatter.format(date);
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/Today/today.dart';
import 'package:habits_track/const.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../bottom_pages/bottom_bar.dart';
import '../provider/notesand_iconcolors.dart';
import '../reminder/reminder.dart';
import 'weekbox.dart';

class Addhabits extends StatefulWidget {
  final List<Map<String, dynamic>> habitHistory;
  const Addhabits({super.key, required this.habitHistory});

  @override
  State<Addhabits> createState() => _AddhabitsState();
}

class _AddhabitsState extends State<Addhabits> {
  DateTime? selectedDate;
  String? selectedHabit = '';
  int selectedDaysPerWeek = -1;
  TextEditingController Habitname = TextEditingController();

  final CollectionReference HabitsTemplates =
      FirebaseFirestore.instance.collection("HabitsTemplates");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Center(child: Text(' Warning')),
                    content: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Text('if you made changes they will\n be discarded'),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => bottombar(
                                      habitHistory: widget.habitHistory,
                                      habitId: '',
                                      startDate: DateTime.now(),
                                      habitName: '',
                                    ))),
                        child: const Text(
                          'Discard changes',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
            icon: const Icon(
              Icons.cancel_sharp,
              color: Colors.black,
            )),
        actions: [
          TextButton(
              onPressed: () {
                AddHabitData();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => MyHomePageToday(
                              habitHistory: [],
                            )));
              },
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ))
        ],
        title: const Text(
          "New habit",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            kheight10,
            const Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Habbit Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                  ],
                )),
            kheight10,
            Center(
              child: SizedBox(
                // width: 350,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10.0),
                      border: Border.all(color: kredcolor)),
                  child: TextField(
                    controller: Habitname,
                    onChanged: (value) {
                      setState(() {
                        selectedHabit = value;
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        border: InputBorder.none,
                        hintText: selectedHabit,
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ),
              ),
            ),
            kheight10,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Templates",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            kheight10,
            habitTemplateItems(),
            kheight10,
            const Text(
              "How many days per Week should you complete that habit? ",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            kheight10,
            SelectableContainer(
              selectedIndex: selectedDaysPerWeek,
              onSelected: (Index) {
                setState(() {
                  selectedDaysPerWeek = Index;
                });
              },
            ),
            kheight10,
            const Text(
              "Start Date ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            ),
            kheight10,
            GestureDetector(
              onTap: () {
                _showDatePicker(context);
              },
              child: Row(
                children: [
                  // const SizedBox(
                  //   width: 25,
                  // ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: kredcolor)),
                    width: 350,
                    height: 50,
                    child: Center(
                      child: Text(
                        selectedDate != null
                            ? getFormattedDate(selectedDate!)
                            : 'Select Date',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            kheight10,
            const Text(
              "Reminders  ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            ),
            kheight10,
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const Reminderpage()));
              },
              child: Row(children: [
                // const SizedBox(
                //   width: 25,
                // ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: kredcolor)),
                  width: 350,
                  height: 50,
                  child: const Center(
                    child: Text(
                      'Remindes ',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  StreamBuilder<QuerySnapshot<Object?>> habitTemplateItems() {
    return StreamBuilder(
      stream: HabitsTemplates.snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 50, // Specify a fixed height for the ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot templates = snapshot.data!.docs[index];
                return Row(
                  children: [
                    const SizedBox(
                        // width: 10,
                        // height: 10,
                        ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedHabit = templates["habit Name"];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: kredcolor,
                          ),
                        ),
                        width: 130,
                        child: Center(
                          child: Text(
                            templates['habit Name'],
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                      height: 10,
                    ),
                  ],
                );
              },
            ),
          );
        }
        return const Text("No templates");
        // Return a widget when snapshot does not have data
      },
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    DateTime? newDate;
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 216,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: selectedDate ?? DateTime.now(),
                minimumDate: selectedDate != null &&
                        selectedDate!.isAfter(DateTime.now())
                    ? DateTime.now()
                    : null,
                onDateTimeChanged: (DateTime newDateTime) {
                  // Check if selected date is before or equal to current date
                  if (newDateTime.isBefore(DateTime.now()) ||
                      newDateTime.isAtSameMomentAs(DateTime.now())) {
                    newDate = newDateTime;
                  }
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  if (newDate != null) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  }
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Done',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> AddHabitData() async {
    try {
      // Retrieve the current user ID
      final user = FirebaseAuth.instance.currentUser;
      final userId = user?.uid;

      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('add_habits')
          .where('name', isEqualTo: selectedHabit)
          .where('userId',
              isEqualTo: userId) // Add the query to check the user ID
          .get();

      if (snapshot.docs.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Habit already exists'),
          ),
        );
      } else {
        await FirebaseFirestore.instance.collection('add_habits').add({
          'name': selectedHabit,
          'daysPerWeek': selectedDaysPerWeek + 1,
          'startDate': Timestamp.fromDate(selectedDate!),
          'userId': userId, // Store the user ID with the habit data
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Habit added successfully'),
          ),
        );
      }
    } catch (e) {
      print('Error saving habit data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Failed to save habit'),
        ),
      );
    }
  }
}

String getFormattedDate(DateTime date) {
  final formatter = DateFormat('d-MMMM-yyyy');
  return formatter.format(date);
}
