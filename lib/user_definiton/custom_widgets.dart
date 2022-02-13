import 'package:flutter/material.dart';
import 'constants.dart';

class Gender extends StatelessWidget {
  final String genders;
  final String genderName;
  Gender(
      {this.genders =
          'https://firebasestorage.googleapis.com/v0/b/stepway-11275.appspot.com/o/assets%2Fman.png?alt=media&token=1f25d87a-c207-41b6-9faf-1d1277d5c52e',
      this.genderName = 'Female'});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          maxRadius: 100,
          backgroundImage: NetworkImage(genders),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$genderName',
          style: kQuestionStyle,
        ),
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  final renk;
  MyContainer({this.renk = Colors.white, this.child, this.onPressed});
  final Widget? child;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: child,
        margin: EdgeInsets.all(20),
        decoration:
            BoxDecoration(color: renk, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
