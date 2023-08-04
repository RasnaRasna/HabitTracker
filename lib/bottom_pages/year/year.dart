import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import 'package:intl/intl.dart';

class YearBase extends StatefulWidget {
  const YearBase({Key? key}) : super(key: key);

  @override
  State<YearBase> createState() => _YearBaseState();
}

class _YearBaseState extends State<YearBase> {
  final DateTime today = DateTime.now();
  Map<String, Map<DateTime, bool>> habitsData =
      {}; // Store the completion status for each habit

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
    print(habitsData);

    // Initialize the habitsData map with an empty map for each habit
    for (var habitName in habitNames) {
      habitsData[habitName] = {}; // Store completion status in a nested map
    }

    // Fetch habit data (completion dates) for each habit
    // Loop through each habitName in the habitNames list
    for (var habitName in habitNames) {
      // Find the habitId that matches the current habitName
      final habitId =
          habitSnapshot.docs.firstWhere((doc) => doc['name'] == habitName).id;

      // Fetch data from the "history" collection where the habitId matches the current habit
      final habitDataSnapshot = await FirebaseFirestore.instance
          .collection('history')
          .where('habitId', isEqualTo: habitId)
          .get();

      // Print the habitId to the console
      print(habitId);

      // Loop through the documents in the habitDataSnapshot
      for (var doc in habitDataSnapshot.docs) {
        // Extract the data (fields and values) from the current document
        final data = doc.data();

        // Extract the completionDate from the data (if it exists)
        final completionDate = data['completionDate'] as Timestamp?;

        // Check if completionDate is not null (habit has been completed)
        if (completionDate != null) {
          // Convert the completionDate to a DateTime object
          final date = completionDate.toDate();

          // Update the habitsData map to indicate that the habit with habitName has been completed on the date
          habitsData[habitName]![date] = true;
        }
      }
    }

    setState(() {}); // Trigger a rebuild to display the heatmap
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("${today.year}"), // Display the current year dynamically
        ),
        body: buildHeatMapYeartototalheatmap(),
      ),
    );
  }

  Widget buildHeatMapYeartototalheatmap() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: habitsData.entries.map((entry) {
          final habitName = entry.key;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(20),
                border: Border.all(
                  color: const Color.fromARGB(255, 196, 195, 195),
                ), // Border color
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 15),
                    child: Text(
                      habitName, // Replace 0 with the index of the habit name you want to display
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Text(
                      ("${today.year}"), // Display the current year dynamically
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  for (int i = 0; i < 12; i += 3)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int monthIndex = i + 1;
                            monthIndex <= i + 3;
                            monthIndex++)
                          if (monthIndex <= 12)
                            Expanded(
                              child: _buildMonthHeatMap(monthIndex, habitName),
                            ),
                      ],
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMonthHeatMap(int month, String habitName) {
// Calculate the startDate for the given month
    final startDate = DateTime(DateTime.now().year, month, 1);

// Calculate the endDate for the given month by getting the last day of the current month
    final endDate = DateTime(DateTime.now().year, month + 1, 0);

// Retrieve the completionStatus for the habit with the current habitName from the habitsData map
    final completionStatus = habitsData[habitName];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(DateFormat('MMMM').format(startDate), // Display month name
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color.fromARGB(255, 64, 64, 64),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(endDate.day, (dayIndex) {
                final date = startDate.add(Duration(days: dayIndex));
                final color = completionStatus![date] == true
                    ? kredcolor
                    : Color.fromARGB(255, 226, 217, 188);
                return Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    width: 10,
                    height: 10,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  // Color _getColorForValue(int value) {
  //   // Define your color mapping logic here
  //   if (value == 1) {
  //     return Colors.green;
  //   }
  //   return Colors.grey;
  // }
}
