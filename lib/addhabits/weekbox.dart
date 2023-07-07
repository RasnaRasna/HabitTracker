// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

// class SelectableContainer extends StatefulWidget {
//   @override
//   _SelectableContainerState createState() => _SelectableContainerState();
// }

// class _SelectableContainerState extends State<SelectableContainer> {
//   int selectedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: <Widget>[
//           const SizedBox(
//               // width: 10,
//               // height: 20,
//               ),
//           buildSelectableContainer(0),
//           const SizedBox(
//             width: 12,
//             height: 20,
//           ),
//           buildSelectableContainer(1),
//           const SizedBox(
//             width: 12,
//             height: 20,
//           ),
//           buildSelectableContainer(2),
//           const SizedBox(
//             width: 12,
//             height: 20,
//           ),
//           buildSelectableContainer(3),
//           const SizedBox(
//             width: 12,
//             height: 20,
//           ),
//           buildSelectableContainer(4),
//           const SizedBox(
//             width: 12,
//             height: 20,
//           ),
//           buildSelectableContainer(5),
//           const SizedBox(
//             width: 12,
//             height: 20,
//           ),
//           buildSelectableContainer(6),
//           const SizedBox(
//             width: 12,
//             height: 20,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildSelectableContainer(int index) {
//     final isSelected = index == selectedIndex;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedIndex = index;
//         });
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           border: Border.all(color: Color.fromARGB(255, 229, 113, 151)),
//           color: isSelected ? Colors.pink.shade100 : Colors.transparent,
//         ),
//         width: 40,
//         child: Center(
//           child: Text(
//             (index + 1).toString(),
//             style: TextStyle(fontSize: 18, color: Colors.black),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SelectableContainer extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const SelectableContainer({
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  _SelectableContainerState createState() => _SelectableContainerState();
}

class _SelectableContainerState extends State<SelectableContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          const SizedBox(),
          buildSelectableContainer(0),
          const SizedBox(
            width: 12,
            height: 20,
          ),
          buildSelectableContainer(1),
          const SizedBox(
            width: 12,
            height: 20,
          ),
          buildSelectableContainer(2),
          const SizedBox(
            width: 12,
            height: 20,
          ),
          buildSelectableContainer(3),
          const SizedBox(
            width: 12,
            height: 20,
          ),
          buildSelectableContainer(4),
          const SizedBox(
            width: 12,
            height: 20,
          ),
          buildSelectableContainer(5),
          const SizedBox(
            width: 12,
            height: 20,
          ),
          buildSelectableContainer(6),
          const SizedBox(
            width: 12,
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget buildSelectableContainer(int index) {
    final isSelected = index == widget.selectedIndex;
    return GestureDetector(
      onTap: () {
        widget.onSelected(index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Color.fromARGB(255, 229, 113, 151)),
          color: isSelected ? Colors.pink.shade100 : Colors.transparent,
        ),
        width: 40,
        child: Center(
          child: Text(
            (index + 1).toString(),
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
