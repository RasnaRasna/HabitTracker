import 'dart:math';
import 'package:habits_track/const.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

Widget buildHeatMapYear() {
  final startDate = DateTime(DateTime.now().year, 1, 1);
  final endDate = DateTime(DateTime.now().year, 12, 31);

  final Map<DateTime, int> dataset = {};

  // Fill the dataset with values for each day
  for (DateTime date = startDate;
      date.isBefore(endDate);
      date = date.add(const Duration(days: 1))) {
    final randomValue =
        Random().nextInt(10) + 1; // Generate a random value between 1 and 10
    dataset[date] = randomValue;
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(20),
        border: Border.all(
            color: const Color.fromARGB(255, 196, 195, 195)), // Border color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            child: Text(
              "🧘‍♂️ Meditate",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              "2023",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          for (int i = 0; i < 12; i += 3) // Display 4 rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int monthIndex = i + 1; monthIndex <= i + 3; monthIndex++)
                  if (monthIndex <= 12)
                    Expanded(
                      child: _buildMonthHeatMap(monthIndex, dataset),
                    ),
              ],
            ),
        ],
      ),
    ),
  );
}

Widget _buildMonthHeatMap(int month, Map<DateTime, int> dataset) {
  final monthDates = dataset.keys.where((date) => date.month == month).toList();

  return Container(
    margin: EdgeInsets.all(4),
    child: Column(
      children: [
        kheight10,
        Text(
          DateFormat('MMMM').format(DateTime(DateTime.now().year, month)),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color.fromARGB(255, 64, 64, 64)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: monthDates.map((date) {
              final value = dataset[date];
              final color = _getColorForValue(value!);

              return Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  width: 10,
                  height: 10,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ),
  );
}

Color _getColorForValue(int value) {
  // Define your color mapping logic here
  if (value == 1) {
    return Color.fromARGB(255, 224, 170, 166);
  }
  return Color.fromARGB(255, 181, 180, 180);
}
