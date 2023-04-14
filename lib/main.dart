import 'package:flutter/material.dart';
import 'package:health_market/pages/main/main_page.dart';
import 'package:health_market/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Market',
      theme: themeData,
      home: const MainScreen(),
    );
  }
}
