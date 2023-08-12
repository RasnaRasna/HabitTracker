import 'package:flutter/material.dart';

import '../bottom_pages/bottom_bar.dart';
import 'add_habits.dart';

class LeadingCancelButton extends StatelessWidget {
  const LeadingCancelButton({
    super.key,
    required this.widget,
  });

  final Addhabits widget;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Center(child: Text(' Warning')),
                content: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('if you made changes they will\n be discarded'),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => bottombar(
                                  habitHistory: widget.habitHistory,
                                  habitId: '',
                                  startDate: DateTime.now(),
                                  habitName: '',
                                ))),
                    child: const Text(
                      'Discard changes',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
        icon: const Icon(
          Icons.cancel_sharp,
          color: Colors.black,
        ));
  }
}
