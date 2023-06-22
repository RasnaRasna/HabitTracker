import 'package:flutter/material.dart';

class Moodchecking extends StatelessWidget {
  const Moodchecking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Text(
                "Hello Rasna \n How are you doing ?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
