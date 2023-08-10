import 'package:flutter/material.dart';

import '../../const.dart';

class Method_Three extends StatelessWidget {
  const Method_Three({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
            text: const TextSpan(style: TextStyle(fontSize: 15), children: [
          TextSpan(
            text: ("1 ."),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text: ("Raise your awareness \n"),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                "Bad habits can be hard to break because they have become ingrained and automatic. To overcome a bad habit, the first thing that you need to do is become more aware of the habit. You can raise your awareness of the bad habit by keeping a log of every time that you indulge in the bad habit.\n",
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
                color: Colors.black
                // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text: ". ",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                "For example, if your bad habit is snacking between meals, write a check mark on an index card every time that you notice yourself snacking between meals. Do this for a week to see how often you engage in this habit.\n",
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
                color: Colors.black
                // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text: ". ",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                "Being aware means just to 'watch' your actions and patterns that come out of a bad habit and not beating yourself over it. It is researched fact that you are more likely to make the same mistake or follow the same pattern again if you beat yourself over it. These patterns and bad habits will dissolve if you just become aware of them.\n",
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
                color: Colors.black
                // Set normal font weight for the first part
                ),
          ),
        ])),
        kheight10,
        Container(
          child: Image.asset(
            "images/takesteps.png",
          ),
          width: double.infinity,
          height: 300,
        ),
        kheight10,
        RichText(
            text: const TextSpan(style: TextStyle(fontSize: 15), children: [
          TextSpan(
            text: ("2 ."),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text: ("Take steps to counteract the bad habit\n "),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                "Once you have become more aware of the habit, begin taking steps to counteract it. Try to distract yourself so that you do not engage in the bad habit. Make sure that you continue to record the instances of your desire to engage in the bad habit as well as the times that you resist the bad habit.\n",
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
                color: Colors.black
                // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text: ". ",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                "For example, if you catch yourself reaching for a snack between meals, pour yourself a cup of water or go for a short walk instead.\n",
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
                color: Colors.black
                // Set normal font weight for the first part
                ),
          ),
        ])),
        kheight10,
        Container(
          child: Image.asset(
            "images/reward.png",
          ),
          width: double.infinity,
          height: 300,
        ),
        kheight10,
        RichText(
            text: const TextSpan(style: TextStyle(fontSize: 15), children: [
          TextSpan(
            text: ("3 ."),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text: ("Reward yourself for resisting your bad habit\n"),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                " It is crucial to reward yourself for resisting the urge to engage in bad habits. The reward helps to motivate you to continue to resist the bad habit. Make sure that your reward is not to engage in the bad habit, but to do something else that is pleasurable.\n",
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
                color: Colors.black
                // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text: ". ",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                "For example, if you manage to resist your urge to snack between meals for a full week, reward yourself with a new book or a trip to the salon.\n",
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
                color: Colors.black
                // Set normal font weight for the first part
                ),
          ),
        ])),
      ],
    );
  }
}
