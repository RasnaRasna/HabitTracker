import 'package:flutter/material.dart';
import 'package:habits_track/provider.dart/colors.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({Key? key});

  @override
  Widget build(BuildContext context) {
    final iconColorProvider =
        Provider.of<IconColorchangeprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("History & Notes"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Text(
              "Select days on which you completed your habit goal. To add more dates in the past, change the habit's 'start date' by tapping 'Edit' on the previous page. You can attach a note to each day completed.",
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            separatorBuilder: (context, index) =>
                SizedBox(height: 8), // Adjust the vertical spacing as needed
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: const Color.fromARGB(255, 221, 221, 221),
                        width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: Text("04-Jun-2023 (Sunday)"),
                  trailing: IconButton(
                    onPressed: () {
                      iconColorProvider.updatecolor();
                    },
                    icon: Icon(
                      Icons.check_circle,
                      color: iconColorProvider.iconcolor,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
