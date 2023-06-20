import 'package:flutter/material.dart';
import 'package:habits_track/challenges.dart/PositiveAffirmation.dart/positiveaffirmation.dart';
import 'package:habits_track/challenges.dart/confidence.dart/confidence.dart';
import 'package:habits_track/challenges.dart/familytime.dart/familytime.dart';
import 'package:habits_track/challenges.dart/feelgood.dat/feelgood.dart';
import 'package:habits_track/challenges.dart/happines.dart/happines.dart';
import 'package:habits_track/challenges.dart/homeworkout.dart/homeworkout.dart';
import 'package:habits_track/challenges.dart/kindness.dart/kindness.dart';
import 'package:habits_track/challenges.dart/language.dart/language.dart';
import 'package:habits_track/challenges.dart/morningroutine.dart/morngroutine.dart';
import 'package:habits_track/challenges.dart/newyear.dart/newyear.dart';
import 'package:habits_track/challenges.dart/nightroutine.dart/nightroutine.dart';
import 'package:habits_track/challenges.dart/nojunckfood.dart/nojunckfood.dart';
import 'package:habits_track/challenges.dart/pamberyouself.dart/pamberyouself.dart';
import 'package:habits_track/challenges.dart/positivemindset.dart/positivemindset.dart';
import 'package:habits_track/challenges.dart/productive.dart/productive.dart';
import 'package:habits_track/challenges.dart/selflovee.dart/selflove.dart';
import 'package:habits_track/challenges.dart/socialmedia.dart/socialmedia.dart';
import 'package:habits_track/challenges.dart/study.dart/study.dart';
import 'package:habits_track/challenges.dart/walking.dart/walking.dart';

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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/+mindset.png",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/loveeee.jpeg",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/walking.png",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/nophone.jpeg",
                  width: 120,
                  height: 105,
                ),
                Text(
                  "Social media detox",
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
              .push(MaterialPageRoute(builder: (ctx) => FixSleep()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/slp.jpeg",
                  width: 130,
                  height: 110,
                ),
                Text(
                  "Fix your sleep shedule",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/productive2.png",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/pamper your self2.jpeg",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/no jucnk food.png",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/night.jpeg",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/morning.jpeg",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/confident2.jpeg",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/new day.jpeg",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/language2.jpg",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/kindness.jpeg",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/happy jump2.jpeg",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/family.jpeg",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/affrmation2.jpg",
                  width: 130,
                  height: 110,
                ),
                Text(
                  "positive affirmation",
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
              .push(MaterialPageRoute(builder: (ctx) => HomeWorkout()));
        },
        child: Card(
          elevation: 10,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/workout.jpeg",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/feel food.jpeg",
                  width: 130,
                  height: 110,
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
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  "lib/aseetimages.dart/study.png",
                  width: 130,
                  height: 110,
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
