import 'package:flutter/material.dart';

class SimulationPage extends StatefulWidget {
  const SimulationPage({Key? key}) : super(key: key);

  @override
  State<SimulationPage> createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage> {
  late MediaQueryData queryData;
  List<String> options = ['a', 'b', 'c', 'd'];
  List<bool> optionsSelected = [false, false, false, false];
  List<String> answers = ['ans1', 'ans2', 'ans3', 'ans4'];
  List<String> questions = ['aaa?', 'xasxasx', 'dasdas', 'dasdsad'];
  int questionNumber = 0;
  int? lastIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Card(
            child: Column(
              children: [
                Container(
                  child: Text('${questions[questionNumber]}'),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: Text('${options[index]}'),
                      title: Text('${answers[index]}'),
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
                    );
                  },
                  itemCount: questions.length,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
