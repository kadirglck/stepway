import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepway/job_select/job_select_view.dart';
import 'package:stepway/simulation/simulation_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
    );
  }
}
