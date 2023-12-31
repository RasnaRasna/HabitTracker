import 'package:flutter/material.dart';

import '../../const.dart';

class MethodOneContent extends StatelessWidget {
  const MethodOneContent({
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text: ("Set your goal\n"),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                " Before you can begin to work on your new habit, it is worthwhile to consider your goal. Figure out exactly what you hope to accomplish. Make sure that your goal is specific, measurable, action oriented, realistic, and time bound (SMART) to increase your chances of success. Consider what you want to achieve and get as detailed as you can. Here are some questions to help..",
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
                color: Colors.black // Set normal font weight for the first part
                ),
          )
        ])),
        RichText(
            text: const TextSpan(style: TextStyle(fontSize: 15), children: [
          TextSpan(
            text: (".  "),
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                ("Specific means that the goal is targeted rather than broad and/or vague. What exactly do you want to achieve and why?\n"),
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
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
                ("Measurable means that the goal can be quantified (measured with numbers). What numbers are associated with your goal? How can it be measured using numbers?\n"),
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
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
                ("Action Oriented means that the goal is something that you can actively work towards and control. What specific activities are required for you to meet your goal? How often must you perform these activities?\n"),
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
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
                ("Realistic means that the goal is something you can actually achieve with the resources available to you. Is your goal something that you have the power and resources to achieve? Why or why not?\n"),
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
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
                ("Time Bound means that the goal has a beginning and ending or a deadline that you will hold yourself to. When will you start working towards the goal? When do you need to accomplish the goal by? What will happen if you succeed? What will happen if you fail?\n"),
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
        ])),
        Container(
          child: Image.asset(
            "images/identifyyy.gif",
          ),
          width: double.infinity,
          height: 400,
        ),
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
            text: ("dentify the habit you want to form\n"),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                "  Having good habits that are in line with the goals you want to achieve can improve your chances of attaining your goals. After you have set your goal and worked out all of the specifics of achieving that goal, identify a habit that is part of achieving that goal. Consider your goal and ask yourself, what good habit would help me accomplish this goal?\n",
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
                ("For example, if your goal is to lose 10 pounds in 6 weeks, you might decide that you want to get into the habit of taking a walk every night at 7:00pm."),
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
        ])),
        kheight10,
        Container(
          child: Image.asset(
            "images/que (1).gif",
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
            text: ("Consider your motivation\n "),
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                "Once you have identified your goal and the new habit you need to form to accomplish this goal, take some time to consider your motivation. Your motivation is the reason you want to form this new habit. Good motivation can be the difference between succeeding and failing at forming a new habit, so take your time to consider your motivation\n",
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
                ("Ask yourself: What are the potential benefits of forming this new habit? How will the new habit improve my life?\n"),
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
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
                ("Write your motivation so that you can return to it whenever you need a boost."),
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
        ])),
        kheight10,
        Container(
          child: Image.asset(
            "images/plantgrowth (1).gif",
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
            text: ("Start small\n "),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                " Even if the new habit that you want to form is something big, start by making a small change to increase your chances of success.If you make changes that are too drastic, you may not be able to keep up with them\n",
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
                " For example, if you want to stop eating fried, fatty, and sugary foods, you might struggle to give them up all at once. Instead, you might find it easier to start by eliminating one category at a time.\n",
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
                color: Colors.black
                // Set normal font weight for the first part
                ),
          ),
        ])),
        Container(
          child: Image.asset(
            "images/loveeee.jpeg",
          ),
          width: double.infinity,
          height: 300,
        ),
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
            text: ("Give yourself time\n "),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                "Forming a new habit can take a long time. Some people can form a new habit in as little as a few weeks, while other people will take several months. As you work to form your new habit, just keep in mind that it may be a while before it is automatic. Try to be patient with yourself as you form your new habit.\n",
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
            "images/obstacle.png",
          ),
          width: double.infinity,
          height: 300,
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
            text: ("Expect obstacles\n "),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black // Set normal font weight for the first part
                ),
          ),
          TextSpan(
            text:
                "the process of forming a new habit, you are bound to face some obstacles along the way. Understanding that you will face obstacles may help you to overcome them and keep working towards your new habit. It is also good to remember that even if you stumble along the way, that does not mean that you will fail.\n",
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
                " For example, if you fail to take your daily walk one day, don’t get discouraged. Just acknowledge that you had a bad day and take your walk the following day.\n",
            style: TextStyle(
                wordSpacing: 2,
                height: 1.4,
                letterSpacing: 1,
                color: Colors.black
                // Set normal font weight for the first part
                ),
          ),
        ])),
        kheight10
      ],
    );
  }
}
