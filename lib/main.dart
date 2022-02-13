import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======

>>>>>>> b92223d2e549a124874a5aed687b3c02b6c9d252
import 'package:stepway/character_test/character_test_page.dart';
import 'package:stepway/job_select/job_select_view.dart';
import 'package:stepway/onboarding/pages/onboarding_page.dart';
import 'package:stepway/pages/starting_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StepwayApp());
<<<<<<< HEAD
=======

>>>>>>> b92223d2e549a124874a5aed687b3c02b6c9d252
}

class StepwayApp extends StatelessWidget {
  static final String title = 'Stepway';

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      debugShowCheckedModeBanner: false,
=======
return GetMaterialApp(
   debugShowCheckedModeBanner: false,
>>>>>>> b92223d2e549a124874a5aed687b3c02b6c9d252
      title: title,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Colors.purple,
      ),

      // home: OnboardingPage(),

      //home: StartingPage(),
      //home: OnboardingPage(),

<<<<<<< HEAD
      home: OnboardingPage(),
    );
=======
      home: CharacterTestPage(),
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
            child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(JobSelectPage());
              },
              child: Text('Job Select Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(SimulationPage());
              },
              child: Text('Simulation'),
            ),
          ],
        )),
      ),
   
>>>>>>> b92223d2e549a124874a5aed687b3c02b6c9d252
  }
}
