import 'package:flutter/material.dart';
import 'package:stepway/character_test/widgets/question_card.dart';

class CharacterTestPage extends StatefulWidget {
  CharacterTestPage({Key? key}) : super(key: key);

  @override
  State<CharacterTestPage> createState() => _CharacterTestPageState();
}

class _CharacterTestPageState extends State<CharacterTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character Test'),
      ),
      body: Column(
        children: [
          QuestionCard(id: 1, soru: 'Soru 1'),
        ],
      ),
    );
  }
}
