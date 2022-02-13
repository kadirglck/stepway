import 'package:flutter/material.dart';
import 'package:stepway/shared/widgets/pallette.dart';

class EducationPage extends StatefulWidget {
  EducationPage({Key? key}) : super(key: key);

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
        title: Text('Eğitim ve Fırsatlar'),
      ),
      body: SafeArea(
        child: Card(
          child: Column(
            children: [
              Expanded(
                child: Container(
                    child: ListView(
                  children: [
                    Text(
                      'Eğitimler',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                    card(
                        'https://bulakhukukakademisi.com/wp-content/uploads/2021/05/asfldpi.png',
                        'Çatpat hukuk akademisi başlangıç eğitimlerine göz atın'),
                    card(
                        'https://www.iienstitu.com/uploads/online-egitim/temel-programlama-kursu_w380_h300_op.jpg',
                        '36 Pixel Studio gelişmiş python eğitimlerine göz atın')
                  ],
                )),
              ),
              Divider(
                thickness: 5,
              ),
              Expanded(
                child: Container(
                    child: ListView(
                  children: [
                    Text(
                      'Fırsatlar',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                    card(
                        'https://upload.wikimedia.org/wikipedia/commons/7/74/Avea_logo_%282004-2016%29.png',
                        'Avea bir tane mobil geliştirici arıyor.'),
                    card(
                        'https://img1.pngindir.com/20171221/oqe/shenzhen-guangming-hospital-logo-5a3bce7faa50f6.1633484915138689276976.jpg',
                        'Özel Şanghay Hastanesi genel cerrah arıyor.')
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget card(String image, String title) {
    return SizedBox(
      height: 100,
      child: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(image),
              title: Text(title),
            ),
          ),
        ),
      ),
    );
  }
}
