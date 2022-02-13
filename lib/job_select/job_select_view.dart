import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepway/job_select/job_select_model.dart';
import 'package:stepway/simulation/simulation_view.dart';

class JobSelectPage extends StatefulWidget {
  const JobSelectPage({Key? key}) : super(key: key);

  @override
  State<JobSelectPage> createState() => _JobSelectPageState();
}

class _JobSelectPageState extends State<JobSelectPage> {
  bool isSelected = false;
  List<String> jobDummy = ['doctor', 'nurse', 'pilot'];
  List<bool> jobSelected = [false, false, false];
  List<IconData> icons = [Icons.abc_rounded, Icons.ac_unit, Icons.access_alarm];
  List<String> items = [];
  int? lastIndex;
  List<JobSelectModel> jobSelectList = [];
  List<JobSelectModel> searchJobList = [];

  @override
  void initState() {
    getJobs();
    super.initState();
    items = jobDummy;
  }

  getJobs() async {
    await FirebaseFirestore.instance.collection('jobs').get().then((value) {
      value.docs.forEach((element) {
        jobSelectList.add(JobSelectModel.fromDoc(element));
      });
    });
    setState(() {});
  }

  onSearch(String search) {
    setState(
      () {
        searchJobList = jobSelectList
            .where((element) =>
                element.jobName.toLowerCase().contains(search.toLowerCase()))
            .toList();
        // items = jobDummy
        //     .where((jobDummy) => jobDummy.toLowerCase().contains(search))
        //     .toList();
      },
    );
    print(search);
  }

  TextEditingController textfield1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meslek Seçin')),
      body: Column(
        children: [
          // searchStack(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text('MESLEKLER', style: TextStyle(fontSize: 20)),
          ),
          jobsListView(),
          ElevatedButton(
              onPressed: () {
                Get.to(() => SimulationPage());
              },
              child: Text('Simülasyon')),
          ElevatedButton(
              onPressed: () {}, child: Text('Eğitimler ve fırsatlar'))
        ],
      ),
    );
  }

  Widget searchStack() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        autocorrect: true,
        onChanged: (value) {
          onSearch(value);
        },
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
              selectedTileColor: Colors.green,
              textColor: Colors.black,
              tileColor: Colors.white,
              selected: jobSelectList[index].isSelect ?? false,
              onTap: () {
                setState(() {
                  if (lastIndex == null) {
                    lastIndex = index;
                    jobSelectList[index].isSelect =
                        !jobSelectList[index].isSelect!;
                  } else {
                    jobSelectList[lastIndex!].isSelect = false;
                    lastIndex = index;
                    jobSelectList[index].isSelect =
                        !jobSelectList[index].isSelect!;
                  }
                });
                // setState(() {
                //   if (lastIndex != null) {
                //     jobSelected[lastIndex!] = false;
                //     jobSelected[index] = true;
                //     lastIndex = index;
                //   } else {
                //     lastIndex = index;
                //     jobSelected[index] = !jobSelected[index];
                //   }
                // });
              },
            ),
          );
        },
      ),
    );
  }
}
