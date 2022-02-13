import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:stepway/pages/starting_page.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        showNextButton: false,
        pages: [
          PageViewModel(
            title: 'Stepway',
            body: 'Stepway is the new way.',
            image: buildImage(),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Lorem ipsum',
            body:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in.',
            image: buildImage(),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Lorem ipsum',
            body:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in.',
            image: buildImage(),
            decoration: getPageDecoration(),
          ),
        ],
        done: Text(
          'Start',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onDone: () {
          Get.offAll(() => StartingPage());
        },
      ),
    );
  }

  Widget buildImage() {
    return Center(
      child: Image.network('https://picsum.photos/200'),
    );
  }

  PageDecoration getPageDecoration() {
    return PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 20),
    );
  }
}
