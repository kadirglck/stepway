import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepway/pages/education_page.dart';

import '../pages/login_page.dart';
import '../shared/widgets/custom_button.dart';
import '../shared/widgets/pallette.dart';
import '../simulation/simulation_view.dart';
import 'job_select_model.dart';

class JobSelectPage extends StatefulWidget {
  const JobSelectPage({Key? key}) : super(key: key);

  @override
  State<JobSelectPage> createState() => _JobSelectPageState();
}

class _JobSelectPageState extends State<JobSelectPage> {
  List<String> items = [];
  int? lastIndex;
  List<JobSelectModel> jobSelectList = [];
  List<JobSelectModel> searchJobList = [];
  JobSelectModel? selectedJob;
  @override
  void initState() {
    getJobs();
    super.initState();
  }

  getJobs() async {
    await FirebaseFirestore.instance.collection('jobs').get().then((value) {
      value.docs.forEach((element) {
        jobSelectList.add(JobSelectModel.fromDoc(element));
      });
    });
    setState(() {});
  }

  TextEditingController textfield1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('Meslek Seçin'),
        backgroundColor: appbarcolor,
      ),
      body: Column(
        children: [
          // searchStack(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text('MESLEKLER', style: TextStyle(fontSize: 20)),
          ),
          jobsListView(),

          CustomButtonWidget(
            onPressed: () {
              if (selectedJob != null) {
                Get.to(() => SimulationPage(
                      selectedJob: selectedJob,
                    ));
              } else {
                Get.snackbar(
                  'Hata',
                  'Lütfen Meslek Seçiniz!',
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
            title: 'Simülasyon',
            color: pinkcolor,
          ),

          CustomButtonWidget(
            onPressed: () {
              Get.to(() => EducationPage());
            },
            title: 'Eğitim ve Fırsatlar',
            color: pinkcolor,
          ),
        ],
      ),
    );
  }

  Widget searchStack() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        autocorrect: true,
        onChanged: (value) {},
        controller: textfield1,
        decoration: InputDecoration(
          suffix: Icon(
            Icons.search,
            color: Colors.black,
          ),
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(width: 5),
          ),
          hintText: 'Search',
        ),
      ),
    );
  }

  JobSelectModel? jobmodel;
  Widget jobsListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: jobSelectList.length,
        itemBuilder: (context, index) {
          jobmodel = jobSelectList[index];
          return Card(
            child: ListTile(
              title: Text(jobSelectList[index].jobName),
              leading: Icon(Icons.add),
              selectedTileColor: bluecolor,
              textColor: Colors.black,
              tileColor: Colors.white,
              selected: jobSelectList[index].isSelect ?? false,
              onTap: () {
                setState(() {
                  if (lastIndex == null) {
                    lastIndex = index;
                    jobSelectList[index].isSelect =
                        !jobSelectList[index].isSelect!;
                    selectedJob = jobSelectList[index];
                  } else {
                    jobSelectList[lastIndex!].isSelect = false;
                    lastIndex = index;
                    jobSelectList[index].isSelect =
                        !jobSelectList[index].isSelect!;
                    selectedJob = jobSelectList[index];
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}
