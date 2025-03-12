import 'package:flutter/material.dart';
import 'package:null_company/screens/MyHomePage.dart';
import 'package:null_company/screens/erad.dart';
import 'package:null_company/screens/linkat.dart';

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
        '/': (context) => MyHomePage(),
        '/LinKat': (context) => linkat(),
        '/Erad': (context) => Erad(),
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
      ),
      // home: MyHomePage(),
    );
  }
}


//  flutter run -d chrome