import 'package:flutter/material.dart';

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
              onPressed: () {},
              child: Text('Ne istediğimi bilmiyorum'),
              style: buttonStyle,
            ),
          ],
        ),
      ),
    );
  }
}
