import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/edit_habits.dart/yearheatmap.dart';

class YearBase extends StatelessWidget {
  const YearBase({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                kheight50,
                Flexible(
                  child: buildHeatMapYear(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
