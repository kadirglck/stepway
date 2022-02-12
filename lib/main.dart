import 'package:flutter/material.dart';
import 'package:stepway/character_test/character_test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEneme',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: CharacterTestPage(),
    );
  }
}
