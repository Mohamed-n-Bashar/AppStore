import 'package:flutter/material.dart';
import 'package:null_company/screens/MyHomePage.dart';
import 'package:null_company/screens/page_four.dart';
import 'package:null_company/screens/page_three.dart';
import 'package:null_company/screens/page_two.dart';
import 'package:null_company/screens/page_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/page_one': (context) => const PageOnePro(),
        '/page_two': (context) => const PageTwoPro(),
        '/page_fitTrack': (context) => const PageFitTrack(),
        '/page_rental': (context) => const PageFourPro(),
      },

      debugShowCheckedModeBanner: false,
      title: 'null',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.grey,
          selectionHandleColor: Colors.black,
        ),
      ),
      // home: MyHomePage(),
    );
  }
}


//  flutter run -d chrome