import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/challenges/card.dart';
import 'package:habits_track/challenges/card_cahllenges.dart';
import 'package:habits_track/const.dart';

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Your habits will \ndetermine your future",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          kheight10,
          Expanded(
              child: SingleChildScrollView(child: challengeitemss(context))),
        ],
      )),
    );
  }
}
