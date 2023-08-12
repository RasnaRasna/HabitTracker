import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';

class Reminderweeks extends StatefulWidget {
  final Set<String> selectedDays;
  final ValueChanged<String> onDaySelected;

  const Reminderweeks({
    required this.selectedDays,
    required this.onDaySelected,
  });

  @override
  _ReminderweeksState createState() => _ReminderweeksState();
}

class _ReminderweeksState extends State<Reminderweeks> {
  final List<String> days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          final day = days[index];
          final isSelected = widget.selectedDays.contains(day);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: GestureDetector(
              onTap: () {
                widget.onDaySelected(day);
              },
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    border: Border.all(
                      color: korangecolor,
                    ),
                    color: isSelected ? kredcolor : Colors.transparent,
                  ),
                  width: 40,
                  child: Center(
                    child: Text(
                      day,
                      style: TextStyle(
                        fontSize: 18,
                        color: isSelected
                            ? Colors.white
                            : Colors.black, // Change text color here
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
