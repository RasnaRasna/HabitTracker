import 'dart:math';

import 'package:flutter/material.dart';

class HeatMapCell extends StatelessWidget {
  final String value;
  final Color color;
  final Function() onTap;

  const HeatMapCell({
    required this.value,
    required this.color,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(0.3),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildHeatMap() {
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
      height: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: Color.fromARGB(255, 193, 192, 192)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              "Last 365 Days",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.count(
                crossAxisCount: 21, // 7 days in a week
                physics:
                    const NeverScrollableScrollPhysics(), // Disable scrolling
                children: dataset.entries.map((entry) {
                  final date = entry.key;
                  final value = entry.value;

                  final color =
                      _getColorForValue(value); // Get color based on value

                  return Padding(
                    padding: const EdgeInsets.all(1),
                    child: HeatMapCell(
                      value: "", // Show day as text
                      color: color,
                      onTap: () {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text(date.toString())),
                        // );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Color _getColorForValue(int value) {
  // Define your color mapping logic here
  if (value == 1) {
    return const Color.fromARGB(255, 229, 157, 152);
  }
  return const Color.fromARGB(255, 201, 197, 197);
}
