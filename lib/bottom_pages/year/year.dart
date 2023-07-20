import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';

import '../../edit_habits/yearheatmap.dart';

class YearBase extends StatelessWidget {
  const YearBase({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("2023"),
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [kheight20, Flexible(child: buildHeatMapYear())],
              );
            },
            separatorBuilder: (BuildContext, int index) => kheight20,
            itemCount: 4),
      ),
    );
  }
}
