import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthBase extends StatefulWidget {
  const MonthBase({super.key});

  @override
  State<MonthBase> createState() => _MonthBaseState();
}

class _MonthBaseState extends State<MonthBase> {
  final DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Column(
              children: [
                monthCalendar(),
                monthCalendar(),
                monthCalendar(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget monthCalendar() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Stack(
            children: [
              Card(
                color: Colors.white,
                child: TableCalendar(
                  rowHeight: 50,
                  headerStyle: const HeaderStyle(
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  focusedDay: today,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  calendarStyle: const CalendarStyle(
                    outsideDaysVisible: false,
                    weekendDecoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 203, 203),
                    ),
                    todayDecoration: BoxDecoration(
                      color: Color.fromARGB(255, 239, 83, 83),
                    ),
                    defaultDecoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 203, 203),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 4,
                left: 3,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    '🧘‍♂️  Meditate',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          // Add spacing between the calendar and additional text
        ],
      ),
    );
  }
}
