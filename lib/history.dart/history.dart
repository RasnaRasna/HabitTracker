// import 'package:flutter/material.dart';
// import 'package:habits_track/const.dart';
// import 'package:habits_track/provider.dart/colors.dart';
// import 'package:provider/provider.dart';

// class History extends StatefulWidget {
//   const History({Key? key}) : super(key: key);

//   @override
//   _HistoryState createState() => _HistoryState();
// }

// class _HistoryState extends State<History> {
//   late IconColorchangeprovider iconColorProvider;

//   @override
//   void initState() {
//     super.initState();
//     iconColorProvider =
//         Provider.of<IconColorchangeprovider>(context, listen: false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("History & Notes"),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(20),
//         children: [
//           Text(
//             "Select days on which you completed your habit goal. To add more dates in the past, change the habit's 'start date' by tapping 'Edit' on the previous page. You can attach a note to each day completed.",
//           ),
//           kheight20,
//           ListView.separated(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: 5,
//             separatorBuilder: (context, index) => const SizedBox(height: 8),
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 7),
//                 child: Consumer<IconColorchangeprovider>(
//                   builder: (context, _, __) {
//                     return ListTile(
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(
//                           color: const Color.fromARGB(255, 221, 221, 221),
//                           width: 1,
//                         ),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       title: const Text("04-Jun-2023 (Sunday)"),
//                       trailing: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: IconButton(
//                           onPressed: () {
//                             iconColorProvider.updateColor(index);
//                           },
//                           icon: Icon(
//                             Icons.check_circle,
//                             color: iconColorProvider.getIconColor(index),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/provider.dart/colors.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late IconColorchangeprovider iconColorProvider;
  late List<bool> showAdditionalButtonList;

  @override
  void initState() {
    super.initState();
    iconColorProvider =
        Provider.of<IconColorchangeprovider>(context, listen: false);
    showAdditionalButtonList = List<bool>.generate(5, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("History & Notes"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Select days on which you completed your habit goal. To add more dates in the past, change the habit's 'start date' by tapping 'Edit' on the previous page. You can attach a note to each day completed.",
            ),
          ),
          kheight20,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: const Color.fromARGB(255, 221, 221, 221),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: const Text("04-Jun-2023 (Sunday)"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (showAdditionalButtonList[index])
                        IconButton(
                          onPressed: () {
                            _showMyDialog();
                          },
                          icon: const Icon(Icons.message),
                        ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showAdditionalButtonList[index] =
                                !showAdditionalButtonList[index];
                          });
                        },
                        child: Icon(
                          Icons.check_circle,
                          color: showAdditionalButtonList[index]
                              ? Colors.green
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter your notes'),
          content: SingleChildScrollView(
            child: ListBody(children: <Widget>[
              Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10.0),
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              )
            ]),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Save'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
