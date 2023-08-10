import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/discover/method_one.dart';
import 'package:habits_track/bottom_pages/discover/method_three.dart';
import 'package:habits_track/const.dart';

import 'method_two.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "How to Form a Good Habit",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  kheight10,
                  const Text(
                    "Are you ready to break old habits and form positive new ones? Having more good habits can help to achieve better overall health or accomplish a larger goal. Some things that you can do to form a new habit include identifying your motivation, creating a cue, and tracking your progress. If you have a bad habit you want to get rid of, just keep in mind that you may need to take steps before trying to replace it with a new good habit.",
                    style: TextStyle(fontSize: 17),
                  ),
                  kheight10,
                  Container(
                    child: Image.asset(
                      "images/Business Man Writing His Day Schedule.jpeg",
                    ),
                    width: double.infinity,
                    height: 300,
                  ),
                  kheight10,
                  Row(
                    children: [
                      Card(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: korangecolor,
                        ),
                        height: 50,
                        width: 70,
                        child: const Column(
                          children: [
                            Padding(padding: EdgeInsets.all(4)),
                            Text(
                              "Method",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: kwhite),
                            ),
                            Text("1",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: kwhite))
                          ],
                        ),
                      )),
                      Kwidth,
                      Text(
                        "Making a Plan",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              kheight10,
              MethodOneContent(),
              Row(
                children: [
                  Card(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: korangecolor,
                    ),
                    height: 50,
                    width: 70,
                    child: const Column(
                      children: [
                        Padding(padding: EdgeInsets.all(4)),
                        Text(
                          "Method",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kwhite),
                        ),
                        Text("2",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: kwhite))
                      ],
                    ),
                  )),
                  Kwidth,
                  Text(
                    "Achieving Success",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                child: Image.asset(
                  "images/alarm.jpeg",
                ),
                width: double.infinity,
                height: 250,
              ),
              kheight10,
              MethodTwocontent(),
              kheight10,
              Row(
                children: [
                  Card(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: korangecolor,
                    ),
                    height: 50,
                    width: 70,
                    child: const Column(
                      children: [
                        Padding(padding: EdgeInsets.all(4)),
                        Text(
                          "Method",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kwhite),
                        ),
                        Text("3",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: kwhite))
                      ],
                    ),
                  )),
                  Kwidth,
                  Text(
                    "	Overcoming a Bad Habit",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              kheight10,
              SizedBox(
                child: Image.asset(
                  "images/awarness.jpeg",
                ),
                width: double.infinity,
                height: 300,
              ),
              kheight10,
              Method_Three()
            ])));
  }
}
