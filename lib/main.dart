import 'package:flutter/material.dart';
import 'package:habits_track/login/sign.dart';
import 'package:habits_track/onboarding/onboardingpage.dart';
import 'package:habits_track/provider/colors.dart';
import 'package:habits_track/bottom_pages/bottom_bar.dart';
import 'package:provider/provider.dart';

import 'onboarding/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

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
        home: SignPage(),
      ),
    );
  }
}
