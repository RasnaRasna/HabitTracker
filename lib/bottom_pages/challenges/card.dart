import 'package:flutter/material.dart';
import 'package:habits_track/challenges/PositiveAffirmation.dart/positiveaffirmation.dart';
import 'package:habits_track/challenges/confidence.dart/confidence.dart';
import 'package:habits_track/challenges/familytime.dart/familytime.dart';
import 'package:habits_track/challenges/feelgood.dat/feelgood.dart';
import 'package:habits_track/challenges/fixsleep.dart/fixsleep.dart';
import 'package:habits_track/challenges/happines.dart/happines.dart';
import 'package:habits_track/challenges/homeworkout.dart/homeworkout.dart';
import 'package:habits_track/challenges/kindness.dart/kindness.dart';
import 'package:habits_track/challenges/language.dart/language.dart';
import 'package:habits_track/challenges/morningroutine.dart/morngroutine.dart';
import 'package:habits_track/challenges/newyear.dart/newyear.dart';
import 'package:habits_track/challenges/nightroutine.dart/nightroutine.dart';
import 'package:habits_track/challenges/nojunckfood.dart/nojunckfood.dart';
import 'package:habits_track/challenges/pamberyouself.dart/pamberyouself.dart';
import 'package:habits_track/challenges/productive.dart/productivechallenge.dart';
import 'package:habits_track/challenges/socialmedia.dart/socialmedia.dart';
import 'package:habits_track/challenges/study/study.dart';
import 'package:habits_track/challenges/walking.dart/walking.dart';

import '../../challenges/positivemindset.dart/positivemindset.dart';
import '../../challenges/selflovee.dart/selflove.dart';
import '../../const.dart';

Widget buildChallengeCard(
    BuildContext context, String imageAsset, String title, Function() onTap) {
  return InkWell(
    onTap: onTap,
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
              imageAsset,
              width: 130,
              height: 90,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ),
  );
}

GridView challengeitemss(BuildContext context) {
  return GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
    childAspectRatio: 1.2,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(20.0),
    children: [
      buildChallengeCard(context, "images/+mindset.png", "Positive Mindset",
          () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const PositiveMindset()));
      }),
      buildChallengeCard(context, "images/loveeee.jpeg", "Self love", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const SelfLove()));
      }),
      buildChallengeCard(context, "images/walking.png", "Walking", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const Walking()));
      }),
      buildChallengeCard(context, "images/nophone.png", "Digital Detox", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const SocialMedia()));
      }),
      buildChallengeCard(context, "images/slp.jpeg", "Better Sleep", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const FixSleep()));
      }),
      buildChallengeCard(context, "images/productive2.png", "Productivity", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => Productivity()));
      }),
      buildChallengeCard(
          context, "images/pamper your self2.jpeg", "Pamper youself", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const PamberYouself()));
      }),
      buildChallengeCard(context, "images/no jucnk food.png", "No  junck food",
          () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const NojunckFood()));
      }),
      buildChallengeCard(context, "images/night.jpeg", "Night Routine", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const NightRoutine()));
      }),
      buildChallengeCard(context, "images/morning.jpeg", "Morning  Routine",
          () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const MorningRoutine()));
      }),
      buildChallengeCard(context, "images/confident2.jpeg", "Confidence", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const confidence()));
      }),
      buildChallengeCard(context, "images/new day.jpeg", "New day,New you", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const NewDay()));
      }),
      buildChallengeCard(context, "images/language2.jpg", "Language", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const Language()));
      }),
      buildChallengeCard(context, "images/kindness.jpeg", "Kindness", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const Kindness()));
      }),
      buildChallengeCard(context, "images/happy jump2.jpeg", "Happiness", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const Happiness()));
      }),
      buildChallengeCard(context, "images/family.jpeg", "Family Time", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const FamilyTime()));
      }),
      buildChallengeCard(
          context, "images/affrmation2.jpg", "positive affirmation", () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => const PositiveAffirmation()));
      }),
      buildChallengeCard(context, "images/workout.jpeg", "Home Workout", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const HomeWorkout()));
      }),
      buildChallengeCard(context, "images/feel food.jpeg", "Feel good", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const feelgood()));
      }),
      buildChallengeCard(context, "images/study.png", "Study", () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const Study()));
      }),
    ],
  );
}
