import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../character_result/character_result_view.dart';
import 'models/character_test_model.dart';
import 'widgets/question_card.dart';
import '../shared/widgets/pallette.dart';

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

  var rng = Random();

  List<String> jobNames = [];
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
          Get.to(() => CharacterResultPage(
                jobName: jobNames[rng.nextInt(2)],
              ));
        },
      ),
      appBar: AppBar(
        title: Text('Kişilik Testi'),
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
                jobNames.add(snapshot.data!.docs[index].get('about'));
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
