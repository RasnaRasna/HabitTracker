import 'package:flutter/material.dart';
import 'package:habits_track/provider.dart/checkbox.dart';
import 'package:habits_track/provider.dart/colors.dart';
import 'package:provider/provider.dart';
import 'bottom_pages/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IconColorchangeprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const bottombar(),
      ),
    );
  }
}
