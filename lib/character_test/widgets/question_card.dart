import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class QuestionCard extends StatefulWidget {
  final int id;
  final String soru;
  QuestionCard({
    Key? key,
    required this.id,
    required this.soru,
  }) : super(key: key);

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
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
                    (widget.id + 1).toString() + " ) " + widget.soru,
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
                        // cevapList.cevaplar[widget.id] = _value.toInt();
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
