import 'package:flutter/material.dart';
import 'package:habits_track/challenges.dart/positivemindset.dart/positivemindset.dart';
import 'package:habits_track/challenges.dart/selflovee.dart/selflove.dart';
import 'package:habits_track/challenges.dart/walking.dart/walking.dart';

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
      Card(
        elevation: 10,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                "lib/aseetimages.dart/social media detox.jpeg",
                width: 130,
                height: 110,
              ),
              Text(
                "Social media detox",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      Card(
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
      Card(
        elevation: 10,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                "lib/aseetimages.dart/productive.png",
                width: 130,
                height: 110,
              ),
              Text(
                "Productive",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      Card(
        elevation: 10,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                "lib/aseetimages.dart/pamper your self.jpeg",
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
      Card(
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
      Card(
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
      Card(
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
      Card(
        elevation: 10,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                "lib/aseetimages.dart/sleep shedule.jpg",
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
      Card(
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
      Card(
        elevation: 10,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                "lib/aseetimages.dart/language.webp",
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
      Card(
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
      Card(
        elevation: 10,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                "lib/aseetimages.dart/happy jump.jpeg",
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
      Card(
        elevation: 10,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                "lib/aseetimages.dart/images.jpeg",
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
      Card(
        elevation: 10,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                "lib/aseetimages.dart/affrmation.webp",
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
      Card(
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
      Card(
        elevation: 10,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                "lib/aseetimages.dart/images (2).jpeg",
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
      Card(
        elevation: 10,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                "lib/aseetimages.dart/images (1).jpeg",
                width: 130,
                height: 110,
              ),
              Text(
                "Positive Mindset",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
