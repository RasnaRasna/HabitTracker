import 'package:flutter/material.dart';

class Hompagecard extends StatelessWidget {
  const Hompagecard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.9,
        shrinkWrap: true,
        padding: EdgeInsets.all(20.0),
        physics: NeverScrollableScrollPhysics(),
        children: [
          InkWell(
            onTap: () {
              _showBottomSheet(context);
            },
            child: Card(
              elevation: 10,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Image.asset(
                      fit: BoxFit.cover,
                      "images/workout.jpeg",
                      width: 120,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Card(
              elevation: 10,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Image.asset(
                      "images/workout.jpeg",
                      width: 130,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Card(
              elevation: 10,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Image.asset(
                      "images/workout.jpeg",
                      width: 130,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Card(
              elevation: 10,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Image.asset(
                      "images/workout.jpeg",
                      width: 130,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Card(
              elevation: 10,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Image.asset(
                      "images/workout.jpeg",
                      width: 130,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Card(
              elevation: 10,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Image.asset(
                      "images/workout.jpeg",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]);
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 400,
        width: 370,
        child: Center(
          child: Text(
            'This is the bottom sheet!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    },
  );
}
