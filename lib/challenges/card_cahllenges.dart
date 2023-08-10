import 'package:flutter/material.dart';
import 'package:habits_track/challenges/PositiveAffirmation.dart/positiveaffirmation.dart';
import 'package:habits_track/challenges/confidence.dart/confidence.dart';
import 'package:habits_track/challenges/familytime.dart/familytime.dart';
import 'package:habits_track/challenges/feelgood.dat/feelgood.dart';
import 'package:habits_track/challenges/happines.dart/happines.dart';
import 'package:habits_track/challenges/homeworkout.dart/homeworkout.dart';
import 'package:habits_track/challenges/kindness.dart/kindness.dart';
import 'package:habits_track/challenges/language.dart/language.dart';
import 'package:habits_track/challenges/morningroutine.dart/morngroutine.dart';
import 'package:habits_track/challenges/newyear.dart/newyear.dart';
import 'package:habits_track/challenges/nightroutine.dart/nightroutine.dart';
import 'package:habits_track/challenges/nojunckfood.dart/nojunckfood.dart';
import 'package:habits_track/challenges/pamberyouself.dart/pamberyouself.dart';
import 'package:habits_track/challenges/positivemindset.dart/positivemindset.dart';
import 'package:habits_track/challenges/productive.dart/productive.dart';
import 'package:habits_track/challenges/selflovee.dart/selflove.dart';
import 'package:habits_track/challenges/socialmedia.dart/socialmedia.dart';
import 'package:habits_track/challenges/study/study.dart';
import 'package:habits_track/challenges/walking.dart/walking.dart';
import 'package:habits_track/const.dart';
import 'fixsleep.dart/fixsleep.dart';

GridView challengeitems(BuildContext context) {
  return GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
    childAspectRatio: 1.2,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.all(20.0),
    children: [
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => PositiveMindset()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/+mindset.png",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Positive Mindset",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => SelfLove()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/loveeee.jpeg",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Self love",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Walking()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/walking.png",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Walking",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => SocialMedia()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/nophone.png",
                  width: 150,
                  height: 100,
                ),
                Text(
                  "Social media detox",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => FixSleep()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/slp.jpeg",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Fix your sleep shedule",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Productive()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/productive2.png",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Productivity",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => PamberYouself()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/pamper your self2.jpeg",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Pamper youself",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => NojunckFood()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/no jucnk food.png",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "No  junck food",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => NightRoutine()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/night.jpeg",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Night Routine",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => MorningRoutine()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/morning.jpeg",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Morning  Routine",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => confidence()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/confident2.jpeg",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Confidence",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => NewDay()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/new day.jpeg",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "New day,New you",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Language()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/language2.jpg",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Language",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Kindness()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/kindness.jpeg",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Kindness",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Happiness()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/happy jump2.jpeg",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Happiness",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => FamilyTime()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/family.jpeg",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Family Time",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => PositiveAffirmation()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/affrmation2.jpg",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "positive affirmation",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => HomeWorkout()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/workout.jpeg",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Home Workout",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => feelgood()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/feel food.jpeg",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Feel good",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => Study()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: korangecolor),
                color: kwhite),
            child: Column(
              children: [
                Image.asset(
                  "images/study.png",
                  width: 130,
                  height: 90,
                ),
                Text(
                  "Study",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
