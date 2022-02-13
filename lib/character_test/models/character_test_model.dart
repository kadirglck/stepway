import 'package:cloud_firestore/cloud_firestore.dart';

class CharacterTestModel {
  late String id;
  late String about;
  late List<String> questions;

  CharacterTestModel({
    required this.about,
    required this.id,
    required this.questions,
  });

  CharacterTestModel.fromDoc(DocumentSnapshot doc) {
    id = doc.id;
    about = doc.get('about');
    questions = List<String>.from(doc.get('questions'));
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'about': about,
        'questions': questions,
      };
}
