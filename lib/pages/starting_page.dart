import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepway/character_test/character_test_page.dart';

class StartingPage extends StatelessWidget {
  final buttonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stepway')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Ne istediğimi biliyorum'),
              onPressed: () {},
              style: buttonStyle,
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => CharacterTestPage()),
              child: Text('Ne istediğimi bilmiyorum'),
              style: buttonStyle,
            ),
          ],
        ),
      ),
    );
  }
}
