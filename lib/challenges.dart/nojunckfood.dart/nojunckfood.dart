import 'package:flutter/material.dart';
import 'package:habits_track/challenges.dart/language.dart/languagechallenges.dart';
import 'package:habits_track/const.dart';

class NojunckFood extends StatelessWidget {
  const NojunckFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(
            "No  junk food",
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
                "images/no jucnk food.png",
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
              "Start with baby steps for healthy lifestyle and get rid of all the junk food  during these  days.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          kheight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 193, 192, 192),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => LanguageChallenge()));
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
