import 'package:flutter/material.dart';

import '../../const.dart';

class MethodTwocontent extends StatelessWidget {
  const MethodTwocontent({
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
            text: ("Create a cue\n"),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                "Having a cue can help remind you to perform the new behavior every day. Your best bet is to make your cue something that is already a part of your daily routine, such as taking your morning shower or making coffee. For example, if you want to develop the habit of flossing your teeth every time you brush, make brushing your teeth your cue to floss. Follow up brushing with flossing and over time this behavior should become automatic\n",
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
                " If you can’t think of a cue that will work with your desired new habit, try setting a daily alarm on your phone to remind you that it is time to perform the behavior.\n",
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
            "images/cicle. (1).gif",
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
            text: ("Change your environment.\n "),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                " You can increase your chances of achieving your goals by making changes to your environment. Try to think of ways that you can alter your environment so that you will find it easier to perform your new habit. What environmental changes would help you to perform your good habit each day?\n",
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
                " For example, if you want to form the habit of going to the gym every morning before work, you can set yourself up for success by laying out your gym clothes the night before and putting your gym bag by the door..\n",
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
            "images/+mindset.png",
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
            text: ("Become more mindful\n  "),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                " Part of the reason why some people have trouble forming new good habits is because they are on autopilot and not thinking about the things they are doing. But by becoming more aware of your behavior, you may find it easier to form a new good habit. Ask yourself questions about the mindless behavior that prevents you from performing your good habit.\n",
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
                " For example, if you want to form the habit of going to the gym every morning, think about what stops you. What is your usual morning routine? How do you spend your time when you do not go to the gym? Why do you spend your time this way? How does it make you feel?\n",
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
                "The next time you catch yourself going into autopilot and falling back into bad habits, question your behavior and feelings to help yourself break out of the mindless cycle.\n",
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
            "images/tell.png",
          ),
          width: double.infinity,
          height: 300,
        ),
        kheight10,
        RichText(
            text: const TextSpan(style: TextStyle(fontSize: 15), children: [
          TextSpan(
            text: ("4 ."),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text: ("Tell people\n "),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                "  You can help to hold yourself accountable to performing your new habit by sharing your goal with others. Consider getting a friend to help keep you on track with sticking to your new habit. Maybe one of your friends is hoping to form a good habit of their own and you can return the favor\n",
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
                " Make sure that the friend(s) you enlist to help you with your new habit will have some way of holding you accountable. For example, you could give your friend some money and tell them not to give it back to you until you have performed your good habit X number of times\n",
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
            "images/tack.gif",
          ),
          width: double.infinity,
          height: 300,
        ),
        kheight10,
        RichText(
            text: const TextSpan(style: TextStyle(fontSize: 15), children: [
          TextSpan(
            text: ("5 ."),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text: ("Track your progress\n "),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                "  Keeping track of your progress towards developing your habit can help you to stay motivated and strategize when things don’t go as planned. Use a journal or an app on your phone to help you keep track of how often you perform your good habit. You might even consider sharing your progress on your social media outlets (Facebook, Twitter, etc.). Making your progress public can help you to stay motivated to continue working on your good habit\n",
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
            "images/reward.webp",
          ),
          width: double.infinity,
          height: 250,
        ),
        kheight10,
        RichText(
            text: const TextSpan(style: TextStyle(fontSize: 15), children: [
          TextSpan(
            text: ("6 ."),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text: ("Reward yourself for engaging in your good habit\n"),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
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
                "Make sure that you choose rewards that are healthy and that you can afford to provide yourself. When you accomplish a goal, make sure that you give yourself the reward soon after.\n",
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
