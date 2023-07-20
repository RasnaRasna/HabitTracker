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
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "2023",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
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
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color.fromARGB(255, 205, 205, 205)),
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
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
                        )),
                    focusedDay: today,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    calendarStyle: const CalendarStyle(
                      outsideDaysVisible: false,
                      weekendDecoration: BoxDecoration(
                        color: Color.fromARGB(255, 246, 211, 223),
                      ),
                      todayDecoration: BoxDecoration(
                        color: Color.fromARGB(255, 229, 113, 151),
                      ),
                      defaultDecoration: BoxDecoration(
                        color: Color.fromARGB(255, 246, 211, 223),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
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
