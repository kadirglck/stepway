import 'package:flutter/material.dart';
import 'package:stepway/character_test/models/question_model.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../global_key.dart';
import '../models/character_test_model.dart';

class QuestionCard extends StatefulWidget {
  final int id;
  final String soru;
  final CharacterTestModel? data;
  QuestionCard({
    Key? key,
    required this.id,
    required this.soru,
    required this.data,
  }) : super(key: key);

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  void initState() {
    cevapList.cevaplar = List<QuestionModel>.filled(
        widget.id, QuestionModel(id: widget.data!.id, count: 0));
    super.initState();
  }

  List<int?>? cevaplar = [];
  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.id.toString() + " ) " + widget.soru,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                SfSliderTheme(
                  data: SfSliderThemeData(
                    overlayColor: Colors.transparent,
                    // activeDivisorColor: Colors.green,
                    thumbColor: _value == 0 ? Colors.red : Colors.white,
                    activeTrackColor: _value <= 3
                        ? Colors.orange
                        : _value <= 6 && _value > 3
                            ? Colors.yellow
                            : Colors.greenAccent,
                  ),
                  child: SfSlider(
                    showLabels: true,
                    interval: 1,
                    showTicks: true,
                    min: 0.0,
                    max: 9.0,
                    stepSize: 1,
                    value: _value,
                    onChanged: (dynamic values) {
                      setState(() {
                        _value = values;
                        cevapList.cevaplar![widget.id - 1] = QuestionModel(
                          id: widget.data!.id,
                          count: _value.toInt(),
                        );
                        // print(_value);
                      });
                    },
                    enableTooltip: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
