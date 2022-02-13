import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepway/character_test/character_test_page.dart';
import 'package:stepway/job_select/job_select_view.dart';
import 'package:stepway/shared/widgets/custom_button.dart';
import 'package:stepway/shared/widgets/pallette.dart';

class StartingPage extends StatelessWidget {
  final buttonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
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
            CustomButtonWidget(
              onPressed: () {
                Get.to(JobSelectPage());
              },
              title: 'Ne istediğimi biliyorum',
              color: pinkcolor,
            ),
            CustomButtonWidget(
              onPressed: () {
                Get.to(CharacterTestPage());
              },
              title: 'Ne istediğimi bilmiyorum',
              color: pinkcolor,
            ),
          ],
        ),
      ),
    );
  }
}
