import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/starting_page.dart';

class DefinitonPage extends StatefulWidget {
  const DefinitonPage({Key? key}) : super(key: key);

  @override
  State<DefinitonPage> createState() => _DefinitonPageState();
}

class _DefinitonPageState extends State<DefinitonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          's',
          style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Önce seni biraz tanıyalım.",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Ad soyad',
                  hintText: 'Ad soyad'),
            ),
            Text("Cinsiyet"),
            Row(
              children: [
                Text("K"),
                Radio(
                  value: 0,
                  groupValue: "cinsiyet",
                  onChanged: (_) {},
                ),
                Text("E"),
                Radio(
                  value: 0,
                  groupValue: "cinsiyet",
                  onChanged: (_) {},
                ),
                Text("N.B."),
                Radio(
                  value: 0,
                  groupValue: "cinsiyet",
                  onChanged: (_) {},
                ),
              ],
            ),
            Text("Doğum Tarihi"),

            //DATE PİCKER

            Text("Avatar Seçiniz"),
            Image.network("src"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                  ),
                  onPressed: () {
                    Get.to(StartingPage());
                  },
                  child: Row(mainAxisSize: MainAxisSize.min, children: const [
                    Text(
                      "Tamamla",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox.square(dimension: 4),
                    Icon(Icons.arrow_forward_ios_sharp),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
