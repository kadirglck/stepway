import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepway/character_result/character_result_view.dart';
import 'package:stepway/character_test/global_key.dart';
import 'package:stepway/character_test/models/character_test_model.dart';
import 'package:stepway/character_test/widgets/question_card.dart';
import 'package:stepway/shared/widgets/pallette.dart';

import '../job_select/job_select_view.dart';

class CharacterTestPage extends StatefulWidget {
  CharacterTestPage({Key? key}) : super(key: key);

  @override
  State<CharacterTestPage> createState() => _CharacterTestPageState();
}

class _CharacterTestPageState extends State<CharacterTestPage> {
  List<int>? scores;
  @override
  void initState() {
    super.initState();
  }

  Future<QuerySnapshot<Object?>>? future() {
    return FirebaseFirestore.instance.collection('characterTest').get();
  }

  String? temp;
  int intTemp = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: appbarcolor,
        child: Icon(
          Icons.check,
        ),
        onPressed: () {
          Get.to(() => CharacterResultPage());
          // cevapList.cevaplar?.forEach((element) {
          //   print(element.id! + ' - ' + element.count.toString());
          // });
          //butona basıldığında cevaplarının toplamını hesapla
          // temp = null;
          // cevapList.cevaplar!.forEach((element) {
          //   if (temp == null) {
          //     temp = element.id;
          //   } else {
          //     if (temp != element.id) {
          //       print(temp! + ' - ' + intTemp.toString());
          //       intTemp = 0;
          //       temp = element.id;
          //     }
          //   }
          //   intTemp += element.count!;
          // });
        },
      ),
      appBar: AppBar(
        title: Text('Character Test'),
        backgroundColor: appbarcolor,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: future(),
        builder: (context, snapshot) {
          print('sa');
          count = 0;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                return questionCard(snapshot.data!.docs[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
  // 5 + 4 toplayan fonksiyon

  int count = 0;

  CharacterTestModel? data;

  Widget questionCard(DocumentSnapshot document) {
    data = CharacterTestModel.fromDoc(document);
    return ListView.builder(
      //iç içe iki listview builder yapısı kullandığımız için
      //shrinkWrap: true ve pysics:ClampinhScrollPhysics propertylerini kullandık
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: data!.questions.length,
      itemBuilder: (context, index) {
        count++;
        return QuestionCard(
          id: count,
          soru: data!.questions[index],
          data: data,
        );
      },
    );
  }
}
