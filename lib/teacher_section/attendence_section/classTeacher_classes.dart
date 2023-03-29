import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/teacher_section/attendence_section/take_attentence.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/get_teacher_subject.dart';

class ClassTeacherIdentifyScreen extends StatelessWidget {
  var schoolID;
  var classID;
  var teacheremailID;
  ClassTeacherIdentifyScreen(
      {required this.classID,
      required this.schoolID,
      required this.teacheremailID,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Subject'),
      ),
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(schoolID)
            .collection("Teachers")
            .doc(teacheremailID)
            .collection('teacherClasses')
            .doc(classID)
            .collection("subjects")
            .orderBy('SubjectName', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final data = GetTeacherTeachSubjectModel.fromJson(
                      snapshot.data!.docs[index].data());
                  return GestureDetector(
                    onTap: () {
                      Get.to(TakeAttenenceScreen(
                        subject:data.SubjectName,
                          classID: classID,
                          schoolID: schoolID,
                          teacheremailID: teacheremailID));
                    },
                    child: Container(
                      color: Colors.transparent,
                      height: 60,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          data.SubjectName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: snapshot.data!.docs.length);
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      )),
    );
  }
}
