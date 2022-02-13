import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stepway/job_select/job_select_model.dart';

import '../shared/widgets/custom_button.dart';

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
  List<String> options = [
    'a',
    'b',
    'c',
  ];
  List<bool> optionsSelected = [false, false, false, false];
  List<String> answers = [
    'Hoşlanmam',
    'Etkilemez',
    'Seve seve Yaparım',
  ];
  int questionNumber = 0;
  int? lastIndex;
  @override
  void initState() {
    print(widget.selectedJob!.jobId);
    getQuestions();
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
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: Image.network(
                'https://boardinginfo.com/wp-content/uploads/2018/01/cockpit.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    questionList.isEmpty ? '' : questionList[0],
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        title: Text('${answers[index]}'),
                        selectedColor: Colors.white,
                        selectedTileColor: Colors.green,
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
              onPressed: () {},
              title: 'Sonraki',
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}
