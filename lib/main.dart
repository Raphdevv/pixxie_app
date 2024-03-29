import 'package:flutter/material.dart';
import 'package:pixxie/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pixxie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'MN MOCHI.ttf',
        primarySwatch: Colors.pink,
      ),
      home: const MainPage(),
    );
  }
}
