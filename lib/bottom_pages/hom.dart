// Column(
//             children: [
//               Card(
//                 child: Container(
//                   color: Colors.amber,
//                   height: 100,
//                   child: Row(
//                     children: [
//                       for (var day in ['M', 'T', 'W', 'T', 'F', 'S', 'S'])
//                         Card(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(3.0),
//                                 border: Border.all(color: Colors.grey),
//                               ),
//                               width: 20,
//                               height: 20,
//                               child: Center(
//                                 child: Text(
//                                   ' $day',
//                                   style: TextStyle(
//                                       fontSize: 12, color: Colors.black),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       SizedBox(
//                         width: 12,
//                         height: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           )