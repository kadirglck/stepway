import 'package:flutter/material.dart';
import 'package:stepway/onboarding/pages/onboarding_page.dart';

void main() => runApp(StepwayApp());

class StepwayApp extends StatelessWidget {
  static final String title = 'Stepway';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: OnboardingPage(),
    );
  }
}
