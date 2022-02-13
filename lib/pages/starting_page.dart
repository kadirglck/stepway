import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepway/character_test/character_test_page.dart';
import 'package:stepway/job_select/job_select_view.dart';

class StartingPage extends StatelessWidget {
  final buttonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    Color background = Color.fromRGBO(205, 240, 234, 1);
    Color appbarcolor = Color.fromRGBO(196, 144, 228, 1);
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepway'),
        backgroundColor: appbarcolor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/stepway-11275.appspot.com/o/assets%2Flogo%20yuvarlak.png?alt=media&token=5f728b2f-663b-4f46-bc37-67f06e411e3b',
              fit: BoxFit.cover,
              width: Get.width * 0.7,
            ),
            ElevatedButton(
              child: Text('Ne istediğimi biliyorum'),
              onPressed: () {
                Get.to(JobSelectPage());
              },
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
