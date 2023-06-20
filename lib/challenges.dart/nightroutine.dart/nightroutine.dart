import 'package:flutter/material.dart';
import 'package:habits_track/challenges.dart/language.dart/languagechallenges.dart';
import 'package:habits_track/const.dart';

class NightRoutine extends StatelessWidget {
  const NightRoutine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Text(
            "Night Routine",
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
            child: SizedBox(
              width: 500,
              height: 150,
              child: Image.asset(
                "lib/aseetimages.dart/night.jpeg",
                width: 400,
                height: 300,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              " In this  challenge,you'll find some sleep hacks anf tips to have a bette night's sleep and feel less stressed at bedtime  .",
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
                          builder: (ctx) => LanguageChallenge()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded)),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}
