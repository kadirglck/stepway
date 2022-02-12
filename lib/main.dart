import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stepway/character_test/character_test_page.dart';
import 'package:stepway/onboarding/pages/onboarding_page.dart';
import 'package:stepway/pages/login_page.dart';
import 'package:stepway/pages/sign_up.dart';
import 'package:stepway/pages/starting_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StepwayApp());
}

class StepwayApp extends StatelessWidget {
  static final String title = 'Stepway';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple,
      ),

      // home: OnboardingPage(),

      //home: StartingPage(),
      //home: OnboardingPage(),

      home: CharacterTestPage(),

      //home: SignUp(),
      //home: CharacterTestPage(),
    );
  }
}
