import 'package:flutter/material.dart';
import 'package:habits_track/challenges/selflovee.dart/challengesof_selflove.dart';
import 'package:habits_track/const.dart';

class FixSleep extends StatelessWidget {
  const FixSleep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(
            "Fix your Sleep Shedule",
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
                "images/slp.jpeg",
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
              "Are you Looking for Ways to improve your sleep quality? you,d like to wake up and go to bed early  here we suggest you strategies for that?",
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
