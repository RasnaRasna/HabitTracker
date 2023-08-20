import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habits_track/bottom_pages/bottom_bar.dart';
import 'package:habits_track/provider/stateofbutton.dart';
import 'package:provider/provider.dart';

import '../../const.dart';
import '../../provider/selectDateprovider.dart';
import 'habititemcard.dart';

class MyHomePageToday extends StatelessWidget {
  final List<Map<String, dynamic>> habitHistory;
  final String? documentId;

  const MyHomePageToday({Key? key, this.documentId, required this.habitHistory})
      : super(key: key);

  // Function to reset the check_circle icon after 12 am
  void resetCompletionStatusIfNeeded(BuildContext context) {
    final now = DateTime.now();
    if (now.hour >= 0 && now.minute == 0) {
      final buttonProvider =
          Provider.of<MyButtonClickedProvider>(context, listen: false);
      final selectedDayProvider =
          Provider.of<SelectedDayProvider>(context, listen: false);

      // Reset the selected habits and day indices
      buttonProvider.resetHabitSelections();

      // Select the current day
      selectedDayProvider.selectCurrentDay();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Call the resetCompletionStatusIfNeeded function to check and reset the completion status after 12 am
    resetCompletionStatusIfNeeded(context);
    final buttonProvider =
        Provider.of<MyButtonClickedProvider>(context, listen: false);
    // final selectedDayProvider =
    //     Provider.of<SelectedDayProvider>(context, listen: false);

    print("intodaypage${habitHistory}");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => bottombar(
                        habitHistory: habitHistory,
                        habitId: documentId,
                        startDate: DateTime.now(),
                        habitName: '',
                      )),
            );
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
                return buildListViewSeparated(
                  selectedDayProvider,
                  buttonProvider,
                );
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

  Widget buildListViewSeparated(
    SelectedDayProvider selectedDayProvider,
    MyButtonClickedProvider buttonProvider,
  ) {
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
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   // If data is still loading, show the CircularProgressIndicator
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
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
                final habitId = habitData.id;
                final habitName = habitData['name'] as String?;
                final daysPerWeek = habitData['daysPerWeek'] as int?;
                final startDate =
                    (habitData['startDate'] as Timestamp?)?.toDate();

                int completedCount = 0; // TODO: Get the actual completed count

                List<Widget> daySymbols = [];
                final currentDayIndex = DateTime.now().weekday - 1;
                // final selectedDayIndex =
                //     buttonProvider.getSelectedDayIndex(habitId) ?? -1;

                for (int i = 0; i < 7; i++) {
                  daySymbols.add(
                    DayrepresentConatiner(habitId, i, currentDayIndex),
                  );
                }

                return HabitItemsCard(
                  habitData: habitData,
                  habitName: habitName,
                  daysPerWeek: daysPerWeek,
                  startDate: startDate,
                  completedCount: completedCount,
                  daySymbols: daySymbols,
                  habitId: habitId,
                  currentDayIndex: currentDayIndex,
                  habitHistory: habitHistory,
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

  Widget DayrepresentConatiner(String habitId, int i, int currentDayIndex) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('add_habits')
          .doc(habitId)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          // Handle any errors that occur while fetching data
          return Text('Error: ${snapshot.error}');
        }

        final habitData = snapshot.data?.data() as Map<String, dynamic>?;
        final bool isSelected = habitData?['selected'] as bool? ?? false;
        final int? storedDayIndex = habitData?['selectedDayIndex'] as int?;

        final backgroundColor =
            i == storedDayIndex && isSelected ? kredcolor : Colors.white;
        final textColor = (i == storedDayIndex && isSelected)
            ? Colors.white
            : (i <= currentDayIndex ? korangecolor : Colors.black);

        return GestureDetector(
          onTap: () {
            if (isSelected) {
              // Unselect the day
              FirebaseFirestore.instance
                  .collection('add_habits')
                  .doc(habitId)
                  .update({'selectedDayIndex': -1});
            } else {
              // Select the day
              FirebaseFirestore.instance
                  .collection('add_habits')
                  .doc(habitId)
                  .update({'selectedDayIndex': i});
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(width: 1),
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
      },
    );
  }
}
