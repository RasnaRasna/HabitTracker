import 'package:flutter/material.dart';

class YearBase extends StatelessWidget {
  const YearBase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Center(child: Text("year"))],
      ),
    );
  }
}
