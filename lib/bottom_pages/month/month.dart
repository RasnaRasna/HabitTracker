import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthBase extends StatefulWidget {
  const MonthBase({Key? key}) : super(key: key);

  @override
  State<MonthBase> createState() => _MonthBaseState();
}

class _MonthBaseState extends State<MonthBase> {
  final DateTime today = DateTime.now();
  Map<String, Map<DateTime, bool>> habitsData = {};
  bool isLoading = true; // Add the isLoading variable

  @override
  void initState() {
    super.initState();
    fetchHabitsData();
  }

  Future<void> fetchHabitsData() async {
    final habitSnapshot =
        await FirebaseFirestore.instance.collection('add_habits').get();
    final habitNames =
        habitSnapshot.docs.map((doc) => doc['name'] as String).toList();

    // Initialize the habitsData map with an empty map for each habit
    for (var habitName in habitNames) {
      habitsData[habitName] = {}; // Store completion status in a nested map
    }
    print("Habits Data:");
    print(habitsData);
    // Fetch habit data (completion dates) for each habit
    for (var habitName in habitNames) {
      final habitId =
          habitSnapshot.docs.firstWhere((doc) => doc['name'] == habitName).id;
      final habitDataSnapshot = await FirebaseFirestore.instance
          .collection('history')
          .where('habitId', isEqualTo: habitId)
          .get();

      for (var doc in habitDataSnapshot.docs) {
        final data = doc.data();
        final completionDate = data['completionDate'] as Timestamp?;
        if (completionDate != null) {
          final date = DateTime(
            completionDate.toDate().year,
            completionDate.toDate().month,
            completionDate.toDate().day,
          );
          habitsData[habitName]![date] = true;
        }
      }
    }

    setState(() {
      isLoading = false; // Set isLoading to false after fetching the data
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "${today.year}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        body: isLoading // Check the isLoading value
            ? Center(
                child: CircularProgressIndicator(), // Show progress indicator
              )
            : ListView.builder(
                itemCount: habitsData.length,
                itemBuilder: (context, index) {
                  final habitName = habitsData.keys.toList()[index];
                  return monthCalendar(habitName);
                },
              ),
      ),
    );
  }

  Widget monthCalendar(String habitName) {
    final completionStatus = habitsData[habitName];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: kredcolor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCalendar(
                      rowHeight: 45,
                      headerStyle: const HeaderStyle(
                        leftChevronVisible: false,
                        rightChevronVisible: false,
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      //calculate the first day of the current month by using DateTime(today.year, today.month, 1)
                      firstDay: DateTime(today.year, today.month, 1),
                      lastDay: DateTime(today.year, today.month + 1, 0),
                      focusedDay: today,
                      calendarStyle: const CalendarStyle(
                        outsideDaysVisible: false,
                      ),
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, date, _) {
                          if (date.month != today.month) {
                            // Check if the date is either the completion date or one of the selected dates.
                            return SizedBox.shrink();
                          }

                          final isSelected =
                              completionStatus?.containsKey(date) ?? false;
                          final isCompleted = completionStatus?[
                                  DateTime(date.year, date.month, date.day)] ??
                              false;

                          print(
                              "Date: $date, isSelected: $isSelected, isCompleted: $isCompleted");

                          return Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? kredcolor
                                  : (isCompleted
                                      ? kredcolor
                                      : calanderbacground),
                            ),
                            child: Center(
                              child: Text(
                                date.day.toString(),
                                style: TextStyle(
                                  fontSize: 13,
                                  color: isSelected
                                      ? kwhite
                                      : (isCompleted ? kwhite : kblack),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 3,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      habitName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
