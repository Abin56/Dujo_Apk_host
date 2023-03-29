import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/getClassesList_model.dart';
import 'class_wise_subjects.dart';

class AllClassesListViewForTeacher extends StatefulWidget {
  var schoolID;
  var classID;
  var teacherID;
  AllClassesListViewForTeacher(
      {required this.schoolID,
      required this.classID,
      required this.teacherID,
      super.key});

  @override
  State<AllClassesListViewForTeacher> createState() =>
      _AllClassesListViewForTeacherState();
}

class _AllClassesListViewForTeacherState
    extends State<AllClassesListViewForTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("select the class you are teaching"),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("SchoolListCollection")
              .doc(widget.schoolID)
              .collection("Classes")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.maxFinite,
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = AddClassesModel.fromJson(
                              snapshot.data!.docs[index].data());
                
                          return GestureDetector(
                            onTap: () {
                              log(data.classID);
                              Get.to(ClassWiseSubject(
                                  schoolID: widget.schoolID,
                                  classID: data.classID,
                                  teacherID: widget.teacherID));
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              color: Colors.amber,
                              child: Center(
                                child: Text(data.className),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: snapshot.data!.docs.length),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
