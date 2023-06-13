import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/Today.dart';

class Addhabits extends StatelessWidget {
  const Addhabits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      centerTitle: true,
      leading: IconButton(
          onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Center(child: const Text(' Warning')),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                        'if you made changes they will\n be discarded'),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (ctx) => MyHomePageToday())),
                      child: const Text(
                        'Discard changes',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
          icon: Icon(Icons.cancel_sharp)),
      actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              "Save",
              style: TextStyle(fontSize: 16.0),
            ))
      ],
      title: Text(
        "New habit",
        style: TextStyle(fontSize: 18.0),
      ),
    ));
  }
}
