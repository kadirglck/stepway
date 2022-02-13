import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../job_select/job_select_view.dart';
import '../shared/widgets/custom_button.dart';
import '../shared/widgets/pallette.dart';

class CharacterResultPage extends StatelessWidget {
  final String? jobName;
  const CharacterResultPage({Key? key, this.jobName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> texts = [
      'Karakter analizini tamamladınız!',
      'Size uygun olduğunu düşündüğümüz meslek',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(50),
          color: appbarcolor,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  texts[0],
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  texts[1],
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                CircleAvatar(
                  minRadius: Get.width * 0.30,
                  backgroundImage: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/stepway-11275.appspot.com/o/assets%2Fcourtrooms-1.jpeg?alt=media&token=067a529d-5653-45b9-9498-6abba721c6a5'),
                ),
                Text(
                  jobName == null ? '-' : jobName.toString(),
                  style: TextStyle(fontSize: 40),
                ),
                CustomButtonWidget(
                  onPressed: () {
                    Get.to(JobSelectPage());
                  },
                  title: 'Meslek Seçim',
                  color: pinkcolor,
                )
              ]),
        ),
      ),
    );
  }
}
