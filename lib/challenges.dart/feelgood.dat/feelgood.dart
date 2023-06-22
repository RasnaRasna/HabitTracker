import 'package:flutter/material.dart';
import 'package:habits_track/challenges.dart/selflovee.dart/challengesof_selflove.dart';
import 'package:habits_track/const.dart';

class feelgood extends StatelessWidget {
  const feelgood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(
            "Feel good",
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
                "images/feel food.jpeg",
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
              "These new habits are going to make you feel happier,more appreciative ,excited for each day and make you feel good instantly.",
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
                          builder: (ctx) => SelfLoveChallenges()));
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
