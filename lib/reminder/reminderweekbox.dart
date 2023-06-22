import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';

Container Reminderweeks() {
  return Container(
    height: 40,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        const SizedBox(
          width: 20,
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
          width: 40,
          child: const Center(
              child: Text(
            'Mo',
            style: TextStyle(fontSize: 18, color: Colors.black),
          )),
        ),
        const SizedBox(
          width: 12,
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
          width: 40,
          child: const Center(
              child: Text(
            ' Tu',
            style: TextStyle(fontSize: 18, color: Colors.black),
          )),
        ),
        const SizedBox(
          width: 12,
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
          width: 40,
          child: const Center(
              child: Text(
            'We',
            style: TextStyle(fontSize: 18, color: Colors.black),
          )),
        ),
        const SizedBox(
          width: 12,
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
          width: 40,
          child: const Center(
              child: Text(
            'Th',
            style: TextStyle(fontSize: 18, color: Colors.black),
          )),
        ),
        const SizedBox(
          width: 12,
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
          width: 40,
          child: const Center(
              child: Text(
            'Fr',
            style: TextStyle(fontSize: 18, color: Colors.black),
          )),
        ),
        const SizedBox(
          width: 12,
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
          width: 40,
          child: const Center(
              child: Text(
            'Sa',
            style: TextStyle(fontSize: 18, color: Colors.black),
          )),
        ),
        const SizedBox(
          width: 12,
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
          width: 40,
          child: const Center(
              child: Text(
            'Su',
            style: TextStyle(fontSize: 18, color: Colors.black),
          )),
        ),
        const SizedBox(
          width: 12,
          height: 20,
        ),
      ],
    ),
  );
}
