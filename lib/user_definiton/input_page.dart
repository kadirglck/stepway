import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/starting_page.dart';

import 'custom_widgets.dart';
import '../shared/widgets/pallette.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? pickedGender;

  double gym = 3.5;

  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pinkcolor,
      appBar: AppBar(
        backgroundColor: appbarcolor,
        title: Text('StepWay',
            style: TextStyle(
              color: Colors.black,
            )),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Kaç Yaşındasınız?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${gym.round()}',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Slider(
                    value: gym,
                    onChanged: (double newValue) {
                      setState(() {
                        gym = newValue;
                      });
                    },
                    min: 0,
                    max: 80,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPressed: () {
                      setState(() {
                        pickedGender = 'Male';
                      });
                    },
                    renk: pickedGender == 'Male'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: Gender(
                      genders:
                          'https://firebasestorage.googleapis.com/v0/b/stepway-11275.appspot.com/o/assets%2Fman.png?alt=media&token=1f25d87a-c207-41b6-9faf-1d1277d5c52e',
                      genderName: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPressed: () {
                      setState(() {
                        pickedGender = 'Female';
                      });
                    },
                    renk: pickedGender == 'Female'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: Gender(
                        genders:
                            'https://firebasestorage.googleapis.com/v0/b/stepway-11275.appspot.com/o/assets%2Fwoman.png?alt=media&token=302a8309-8c70-4326-aa3e-1b8bf36069fe',
                        genderName: 'Female'),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: TextButton(
              child: Text(
                'Başlayalım',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Get.to(StartingPage());
              },
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
