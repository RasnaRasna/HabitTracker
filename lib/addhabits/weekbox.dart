import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';

class SelectableContainer extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const SelectableContainer({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(7, (index) {
        final isSelected = index == selectedIndex;
        final color = isSelected
            ? kredcolor
            : const Color.fromARGB(255, 218, 215, 215).withOpacity(0.5);
        final text = (index + 1).toString();

        return GestureDetector(
          onTap: () => onSelected(index),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
