import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/home/student_home/Students_sections/constants.dart';
import 'package:dujo_application/teacher_section/attendence_section/attendence-Book/students_attendence_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../model/attendence_model.dart';
import '../../../model/get_teacher_subject.dart';

class AttendenceSubjectListScreen extends StatelessWidget {
  var schoolId;
  var classID;
  var date;
  AttendenceSubjectListScreen(
      {required this.schoolId,
      required this.classID,
      required this.date,
      super.key});

  @override
  Widget build(BuildContext context) {
    int columnCount = 3;
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    log(classID);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Subject'),
      ),
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(schoolId)
            .collection("Classes")
            .doc(classID)
            .collection("Attendence")
            .doc(date)
            .collection("Subjects")
            .orderBy("date", descending: false)
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
                    final data = GetTeacherTeachSubjectModel.fromJson(
                        snapshot.data!.docs[index].data());

                    DateTime parseDate = DateTime.parse(data.date.toString());
                    final DateFormat formatter = DateFormat('hh : mm  a');
                    String formatted = formatter.format(parseDate);

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
                              Get.to(StudentsAttendenceListViewScreen(
                                  subject: data.id,
                                  schoolId: schoolId,
                                  classID: classID,
                                  date: date));
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // SizedBox(
                                    //   height: 20,
                                    // ),
                                    Text(
                                      '${index + 1}.  ${data.id}',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    sizedBox,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'T:  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          "${formatted}",
                                          style: TextStyle(
                                              fontSize: 12),
                                        )
                                      ],
                                    )
                                  ],
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
