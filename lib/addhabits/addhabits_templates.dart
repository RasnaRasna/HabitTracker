import 'package:flutter/material.dart';

Container habitTemplates(Function(String) onHabitSelected) {
  return Container(
    height: 40,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        const SizedBox(
          width: 20,
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            onHabitSelected('🧘‍♂️Meditate');
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
            width: 130,
            child: const Center(
                child: Text(
              '🧘‍♂️Meditate',
              style: TextStyle(fontSize: 18, color: Colors.black),
            )),
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            onHabitSelected('📚 Read');
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
            width: 130,
            child: const Center(
                child: Text(
              '📚 Read',
              style: TextStyle(fontSize: 18, color: Colors.black),
            )),
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            onHabitSelected('🏃Run');
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
            width: 130,
            child: const Center(
                child: Text(
              '🏃Run',
              style: TextStyle(fontSize: 18, color: Colors.black),
            )),
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            onHabitSelected("😴 Sleep");
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
            width: 130,
            child: const Center(
                child: Text(
              "😴 Sleep",
              style: TextStyle(fontSize: 18, color: Colors.black),
            )),
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            onHabitSelected('🚭No smocking');
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
            width: 140,
            child: const Center(
                child: Text(
              '🚭No smocking',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            onHabitSelected('🌍 Study Language');
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
            width: 170,
            child: const Center(
                child: Text(
              '🌍 Study Language',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            onHabitSelected('😁Laugh');
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
            width: 130,
            child: const Center(
                child: Text(
              '😁Laugh',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            onHabitSelected('💵Save money');
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
            width: 130,
            child: const Center(
                child: Text(
              '💵Save money',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            onHabitSelected('📞 call a friend');
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
            width: 130,
            child: const Center(
                child: Text(
              '📞 call a friend',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            onHabitSelected('🍬Low sugar');
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
            width: 130,
            child: const Center(
                child: Text(
              '🍬Low sugar',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            onHabitSelected('🍸 No alcohol');
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
            width: 130,
            child: const Center(
                child: Text(
              '🍸 No alcohol',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            onHabitSelected('💪Work out');
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
            width: 130,
            child: const Center(
                child: Text(
              '💪Work out',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            )),
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            onHabitSelected('🍎Fruits&veggies');
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color.fromARGB(255, 229, 113, 151))),
            width: 150,
            child: const Center(
                child: Text(
              '🍎Fruits&veggies',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            )),
          ),
        ),
      ],
    ),
  );
}
