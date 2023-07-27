// import 'package:flutter/material.dart';

// class ImageCarousel extends StatefulWidget {
//   @override
//   _ImageCarouselState createState() => _ImageCarouselState();
// }

// class _ImageCarouselState extends State<ImageCarousel> {
//   PageController _pageController = PageController();
// List<String> images = [
//   "images/lo.png",
//   "images/workout.jpeg",
//   "images/image3.png"
// ];

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//       child: SizedBox(
//         width: 360,
//         height: 200,
//         child: PageView.builder(
//           controller: _pageController,
//           itemCount: images.length,
//           itemBuilder: (context, index) {
//             return AnimatedBuilder(
//               animation: _pageController,
//               builder: (context, child) {
//                 double value = 1.0;
//                 if (_pageController.position.haveDimensions) {
//                   value = _pageController.page! - index;
//                   value = (1 - (value.abs() * 0.3)).clamp(0.0,
//                       1.0); // Adjust the factor for the desired scaling effect
//                 }
//                 return Center(
//                   child: Transform.scale(
//                     scale: Curves.easeOut.transform(value) * 0.8 +
//                         0.2, // Adjust scaling factor here
//                     child: Opacity(
//                       opacity: Curves.easeOut.transform(value),
//                       child: child,
//                     ),
//                   ),
//                 );
//               },
//               child: Image.asset(
//                 images[index],
//                 fit: BoxFit.cover,
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

