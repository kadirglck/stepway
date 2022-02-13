import 'package:cloud_firestore/cloud_firestore.dart';

class JobSelectModel {
  late bool? isSelect;
  late String jobName;
  late String jobId;

  JobSelectModel({
    required this.isSelect,
    required this.jobName,
    required this.jobId,
  });

  JobSelectModel.fromDoc(DocumentSnapshot doc) {
    jobId = doc.id;
    jobName = doc.get('name');
    isSelect = false;
  }
}
