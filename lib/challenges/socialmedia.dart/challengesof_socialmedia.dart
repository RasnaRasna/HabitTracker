import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bottom_pages/challenges/savebuttonstate.dart';

class Socailmedia extends StatefulWidget {
  Socailmedia({Key? key}) : super(key: key);

  @override
  _SocailmediaState createState() => _SocailmediaState();
}

class _SocailmediaState extends State<Socailmedia> {
  final List<String> challenges = [
    "Write down 10 things you love about yourself.",
    "Look in the mirror and repeat these things to yourself.",
    "Spend time with someone who makes you feel loved and supported. Notice how their presence makes you feel.",
    "Do something that makes you feel good, such as taking a bath, reading a book, or listening to music. Focus on the positive feelings you experience during this activity.",
    "Do something else that makes you feel good."
  ];

  List<bool> challengeValues = List<bool>.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Text(
            "Social Media Detox",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Mark the completed challenges",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: kredcolor),
            ),
          ),
          kheight20,
          Expanded(
            child: ListView.builder(
              itemCount: challenges.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: korangecolor,
                      border:
                          Border.all(color: Color.fromARGB(255, 218, 213, 213)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: kwhite,
                          checkColor: kredcolor,
                          side: BorderSide(color: kwhite, width: 2),
                          value: challengeValues[index],
                          onChanged: (newValue) {
                            setState(() {});
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              challenges[index],
                              style: TextStyle(fontSize: 16, color: kwhite),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
