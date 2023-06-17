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
        body: ListView(
          children: [
            Column(
              children: [
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
                child: TableCalendar(
                  rowHeight: 50,
                  headerStyle: HeaderStyle(
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  focusedDay: today,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: false,
                    weekendDecoration: BoxDecoration(
                      backgroundBlendMode: BlendMode.colorBurn,
                      color: Color.fromARGB(255, 241, 123, 123),
                    ),
                    todayDecoration: BoxDecoration(
                      color: Color.fromARGB(255, 241, 123, 123),
                    ),
                    defaultDecoration: BoxDecoration(
                      backgroundBlendMode: BlendMode.colorBurn,
                      color: Color.fromARGB(255, 241, 123, 123),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 4,
                left: 3,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '🧘‍♂️Meditate',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
