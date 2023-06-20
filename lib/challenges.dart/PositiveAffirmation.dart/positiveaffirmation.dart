import 'package:flutter/material.dart';
import 'package:habits_track/challenges.dart/morningroutine.dart/morngchallenges.dart';
import 'package:habits_track/const.dart';

class PositiveAffirmation extends StatelessWidget {
  const PositiveAffirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(
            "Positive Affirmation",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
            child: Container(
              child: Image.asset(
                "lib/aseetimages.dart/affrmation2.jpg",
                width: 400,
                height: 300,
              ),
              width: 500,
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              " Practicing Positive affirmation can help you feel more confident and boost positive vibes .it,s a wonderful way to start the day !",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          kheight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 225, 222, 222),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => MorningChallenges()));
                    },
                    icon: Icon(Icons.arrow_forward_ios_rounded)),
              ),
              SizedBox(
                width: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}