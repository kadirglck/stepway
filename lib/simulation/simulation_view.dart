import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../job_select/job_select_model.dart';
import '../pages/education_page.dart';

import '../shared/widgets/custom_button.dart';
import '../shared/widgets/pallette.dart';

class SimulationPage extends StatefulWidget {
  final JobSelectModel? selectedJob;
  const SimulationPage({
    Key? key,
    this.selectedJob,
  }) : super(key: key);

  @override
  State<SimulationPage> createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage> {
  late MediaQueryData queryData;
  List<String> options = ['A', 'B', 'C'];
  List<bool> optionsSelected = [false, false, false];
  List<String> answers = [
    'Hoşlanmam',
    'Etkilemez',
    'Seve seve Yaparım',
  ];
  int questionNumber = 0;
  int? lastIndex;
  int questionCount = 0;
  String? image;
  @override
  void initState() {
    print(widget.selectedJob!.jobId);
    getQuestions();
    questionCount = 0;
    super.initState();
  }

  List<String> questionList = [];
  getQuestions() async {
    await FirebaseFirestore.instance
        .collection('jobs')
        .doc(widget.selectedJob!.jobId)
        .collection('simulation')
        .get()
        .then((value) {
      print(value.docs.first.get('questions'));
      questionList = List<String>.from(value.docs.first.get('questions'));
      image = value.docs.first.get('image');
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: appbarcolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: image == null
                  ? Container()
                  : Image.network(
                      image!,
                      fit: BoxFit.cover,
                    ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    questionList.isEmpty ? '' : questionList[questionCount],
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return Card(
                      child: ListTile(
                        leading: Text(
                          '${options[index]}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        title: Text('${answers[index]}'),
                        selectedColor: Colors.white,
                        selectedTileColor: bluecolor,
                        selected: optionsSelected[index],
                        onTap: () {
                          setState(() {
                            if (lastIndex != null) {
                              optionsSelected[lastIndex!] = false;
                              optionsSelected[index] = true;
                              lastIndex = index;
                            } else {
                              lastIndex = index;
                              optionsSelected[index] = !optionsSelected[index];
                            }
                          });
                        },
                      ),
                    );
                  },
                  itemCount: answers.length,
                )
              ],
            ),
            CustomButtonWidget(
              onPressed: () {
                if (optionsSelected.contains(true)) {
                  if (questionCount != questionList.length - 1) {
                    questionCount++;
                  } else {
                    Get.to(() => EducationPage());
                  }
                  optionsSelected = [false, false, false];
                } else {
                  Get.snackbar('Hata', 'Sorular boş geçilemez',
                      snackPosition: SnackPosition.TOP);
                }
                setState(() {});
              },
              title: questionCount != questionList.length - 1
                  ? 'Sonraki'
                  : 'Tamamla',
              color: pinkcolor,
            )
          ],
        ),
      ),
    );
  }
}
