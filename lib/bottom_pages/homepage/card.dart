import 'package:flutter/material.dart';

class Hompagecard extends StatelessWidget {
  const Hompagecard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1.0,
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            InkWell(
              onTap: () {
                _showBottomSheet(context);
              },
              child: Card(
                elevation: 10,
                child: Container(
                  color: Colors.white,
                  child: const Column(
                    children: [
                      // Image.asset(
                      //   fit: BoxFit.cover,
                      //   "images/workout.jpeg",
                      //   width: 120,
                      // ),
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
                  child: const Column(
                    children: [
                      // Image.asset(
                      //   "images/workout.jpeg",
                      //   width: 130,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 400,
        width: 370,
        child: const Center(
          child: Text(
            'This is the bottom sheet!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    },
  );
}
