import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  void initState() {
    super.initState();
    items = jobDummy;
  }

  onSearch(String search) {
    setState(() {
      items = jobDummy
          .where((jobDummy) => jobDummy.toLowerCase().contains(search))
          .toList();
    });
    print(search);
  }

  TextEditingController textfield1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              'FIND JOOB YOU LOOKING FOR',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            searchStack(),
            SizedBox(
              height: 30,
            ),
            Text('JOBS', style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 30,
            ),
            jobsListView(),
            ElevatedButton(onPressed: () {}, child: Text('Simülasyon')),
            ElevatedButton(
                onPressed: () {}, child: Text('Eğitimler ve fırsatlar'))
          ],
        ),
      ),
    );
  }

  Stack searchStack() {
    return Stack(
      children: [
        TextField(
            autocorrect: true,
            onChanged: (value) {
              onSearch(value);
            },
            controller: textfield1,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blueGrey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(width: 5),
              ),
              hintText: 'Search',
            )),
        Positioned(
          top: 8,
          right: 10,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.search),
            label: Text(
              'Search',
            ),
          ),
        ),
      ],
    );
  }

  ListView jobsListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (_, index) {
        IconData tileIcon = icons[index];
        return ListTile(
          title: Text(items.isEmpty ? '${jobDummy[index]}' : '${items[index]}'),
          leading: Icon(tileIcon),
          selectedTileColor: Colors.blueGrey,
          textColor: Colors.black,
          tileColor: Colors.blue,
          selected: jobSelected[index],
          onTap: () {
            setState(() {
              if (lastIndex != null) {
                jobSelected[lastIndex!] = false;
                jobSelected[index] = true;
                lastIndex = index;
              } else {
                lastIndex = index;
                jobSelected[index] = !jobSelected[index];
              }
            });
          },
        );
      },
      itemCount: items.length,
    );
  }
}
