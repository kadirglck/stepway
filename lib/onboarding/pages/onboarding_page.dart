import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:stepway/pages/starting_page.dart';
import 'package:stepway/user_definiton/definiton_pageview.dart';
import 'package:stepway/user_definiton/input_page.dart';

class OnboardingPage extends StatelessWidget {
  List<String> images = [
    'https://firebasestorage.googleapis.com/v0/b/stepway-11275.appspot.com/o/assets%2Flogo%20yuvarlak.png?alt=media&token=5f728b2f-663b-4f46-bc37-67f06e411e3b',
    'https://firebasestorage.googleapis.com/v0/b/stepway-11275.appspot.com/o/assets%2Feducation.png?alt=media&token=6f9abb4a-1417-4ff5-8c51-ba00d761841e',
    'https://firebasestorage.googleapis.com/v0/b/stepway-11275.appspot.com/o/assets%2Fyoungillustration.jpg?alt=media&token=13826623-4cf8-42f2-bdd5-903d9247369a'
  ];
  List<String> descriptions = [
    'Stepway is the new way.',
    'Mesleklerin olumsuz ve zorlu yanlarını görüp birkaç sorudan oluşan testle sana en uygun mesleği beraber seçeceğiz.',
    'Burada meslekleri tanıyıp inceleyeceğiz ve sana uygun mu kontrol edeceğiz.'
  ];
  List<String> titles = [
    'Stepway',
    'Ne olmak istediğini bilmiyor musun ?',
    'İstediğin mesleğin sana uygun olup olmadığının bilincinde misin?'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        showNextButton: false,
        pages: [
          PageViewModel(
            title: titles[0],
            body: descriptions[0],
            image: Padding(
              padding: const EdgeInsets.all(25.0),
              child: buildImage(images[0]),
            ),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: titles[1],
            body: descriptions[1],
            image: buildImage(images[1]),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: titles[2],
            body: descriptions[2],
            image: buildImage(images[2]),
            decoration: getPageDecoration(),
          ),
        ],
        done: Text(
          'Başlayalım',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onDone: () {
          Get.offAll(() => InputPage());
        },
      ),
    );
  }

  Widget buildImage(String image) {
    return Center(
      child: Image.network('${image}'),
    );
  }

  PageDecoration getPageDecoration() {
    return PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 20),
    );
  }
}
