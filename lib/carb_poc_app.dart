import 'package:carb_poc/pages/home_page.dart';
import 'package:flutter/material.dart';

class CarbPocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carb POC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
