import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String? title;
  final Color? color;
  const CustomButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: Get.height * 0.06,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title!,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
          //witdh değerini sildim onun yerine horizontal padding değeri verdim
          //bu sayede yazının boyutuna göre butonun genişliğini ayarlamamız gerekmicek
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 30)),
          backgroundColor: MaterialStateProperty.all<Color>(
            color == null ? Color(0xff66b538) : color!,
          ),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
