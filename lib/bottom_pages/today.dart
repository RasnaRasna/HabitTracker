// Widget buildListViewSeparated(SelectedDayProvider selectedDayProvider) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('add_habits').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }
//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Center(
//               child: Text(
//             'No data available',
//             style: TextStyle(fontSize: 25),
//           ));
//         }
//         final habitItems = snapshot.data!.docs.reversed.toList();

//         return ListView.separated(
//           itemBuilder: (BuildContext context, int index) {
//             final habitData = snapshot.data!.docs[index];
//             final habitName = habitData['name'] as String?;
//             final daysPerWeek = habitData['daysPerWeek'] as int?;
//             final startDate = (habitData['startDate'] as Timestamp?)?.toDate();

//             int completedCount = 0; // TODO: Get the actual completed count

//             return Container(
//               height: 125,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: GestureDetector(
//                   onTap: () => Navigator.of(context).push(
//                     MaterialPageRoute(
//                         builder: (ctx) => EditHabits(
//                             documentId: habitData.id,
//                             habitName: habitName,
//                             daysPerWeek: daysPerWeek,
//                             startDate: startDate)),
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
//                                     for (int i = 0; i < 7; i++)
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 3,
//                                         ),
//                                         child: GestureDetector(
//                                           onTap: () {},
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               border: Border.all(
//                                                 color: Color.fromARGB(
//                                                   255,
//                                                   151,
//                                                   151,
//                                                   151,
//                                                 ),
//                                                 width: 1,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(5),
//                                             ),
//                                             width: 20,
//                                             height: 22,
//                                             child: Center(
//                                               child: Text(
//                                                 _getDaySymbol(i),
//                                                 style: TextStyle(
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
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

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habits_track/bottom_pages/bottom_bar.dart';
import 'package:habits_track/provider/stateofbutton.dart';
import 'package:provider/provider.dart';
import '../const.dart';

import '../edit_habits/edit_habits.dart';
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
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => bottombar()));
          },
          icon: Icon(Icons.arrow_back),
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
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('add_habits').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              'No data available',
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
            final startDate = (habitData['startDate'] as Timestamp?)?.toDate();

            int completedCount = 0; // TODO: Get the actual completed count

            List<Widget> daySymbols = [];

            for (int i = 0; i < 7; i++) {
              final borderColor = i < (daysPerWeek ?? 0)
                  ? Colors.pink // Set the border color for selected days
                  : Color.fromARGB(
                      255, 151, 151, 151); // Set the default border color

              daySymbols.add(
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: borderColor,
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
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }

            return Container(
              height: 125,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => EditHabits(
                        documentId: habitData.id,
                        habitName: habitName,
                        daysPerWeek: daysPerWeek,
                        startDate: startDate,
                        selectedDate: startDate,
                      ),
                    ),
                  ),
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(255, 150, 147, 147),
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
                              style: TextStyle(
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
                              style: TextStyle(
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
                                          final buttonProvider = Provider.of<
                                                  MyButtonClickedProvider>(
                                              context,
                                              listen: false);
                                          buttonProvider.toggleHabitSelection(
                                              habitData.id);
                                        },
                                        icon: Icon(Icons.check_circle,
                                            color: Provider.of<
                                                            MyButtonClickedProvider>(
                                                        context)
                                                    .isHabitSelected(
                                                        habitData.id)
                                                ? Colors
                                                    .pink // Set the color when selected
                                                : Colors.grey // S
                                            )),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 10,
                                  ),
                                  child: Text(
                                    '0/7',
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
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10);
          },
          itemCount: habitItems.length,
        );
      },
    );
  }
}
