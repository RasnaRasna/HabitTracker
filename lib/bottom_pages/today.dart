import 'package:flutter/material.dart';
import 'package:habits_track/Add_habits.dart';

import '../side_drawer.dart';

class MyHomePageToday extends StatelessWidget {
  const MyHomePageToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Do the best You can.."),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Center(
        child: Card(
          child: SizedBox(
            width: 300,
            height: 150,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "\n    If you want to change your   \n    world you need to start\n   cultivating good habits",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
