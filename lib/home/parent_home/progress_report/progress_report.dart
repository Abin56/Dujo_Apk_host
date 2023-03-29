import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/home/parent_home/progress_report/view_progress_card.dart';
import 'package:dujo_application/teacher_section/attendence_section/attendence-Book/attendence_subject_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/attendence_model.dart';
import '../../../model/progress_report/progress_report_model.dart';
import '../../../widget/progress_report_page.dart';

class ProgressReportListViewScreen extends StatelessWidget {
  var schoolId;
  var classID;
  var studentId;
  ProgressReportListViewScreen(
      {required this.schoolId,
      required this.classID,
      required this.studentId,
      super.key});

  @override
  Widget build(BuildContext context) {
    int columnCount = 3;
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    log(classID);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExamReport List'),
      ),
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(schoolId)
            .collection("Classes")
            .doc(classID)
            .collection("Students")
            .doc(studentId)
            .collection("StudentProgressReport")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AnimationLimiter(
              child: GridView.count(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                padding: EdgeInsets.all(_w / 60),
                crossAxisCount: columnCount,
                children: List.generate(
                  snapshot.data!.docs.length,
                  (int index) {
                    UploadProgressReportModel data =
                        UploadProgressReportModel.fromMap(
                            snapshot.data!.docs[index].data());

                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 200),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () {
                              log(studentId);
                              Get.to(ViewProgressReportScreen(
                                wexam:data.id,
                                  schooilID: schoolId,
                                  classID: classID,
                                  studentId: studentId));
                            },
                            child: Container(
                              height: _h / 100,
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                  bottom: _w / 10,
                                  left: _w / 50,
                                  right: _w / 50),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(212, 67, 30, 203)
                                    .withOpacity(0.1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 40,
                                    spreadRadius: 10,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  data.whichExam,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
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
