import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/home/common_teacher/common_teacher/teacher_selectclassMenu_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/getClassesList_model.dart';
import '../../student_home/Students_sections/constants.dart';

class CommonTeacherAccessories extends StatelessWidget {
  var schoolId;
  var teacherEmail;
  CommonTeacherAccessories({
    required this.schoolId,
    required this.teacherEmail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenNavigation = [];
    int columnCount = 2;
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Expanded(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("SchoolListCollection")
              .doc(schoolId)
              .collection("Teachers")
              .doc(teacherEmail)
              .collection("teacherClasses")
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
                      final data = AddClassesModel.fromJson(
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
                                Get.to(TeacherMenuClassScreen(
                                  schoolID: schoolId,
                                  teacherId: teacherEmail,
                                  classID: data.id,
                                ));
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: _w / 10,
                                    left: _w / 20,
                                    right: _w / 20),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(213, 161, 34, 34),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
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
                                    data.className,
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 18,
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
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }
          }),
    );
  }
}

// List<String> _acc_text = [
//   'Attendance',
//   'Exams',
//   'TimeTable',
//   'HomeWorks',
//   'Notices',
//   'Events',
//   'Progress Report',
//   'Apply Leave'
// ];
// var _acc_images = [
//   'assets/images/attendance.png',
//   'assets/images/exam.png',
//   'assets/images/library.png',
//   'assets/images/homework.png',
//   'assets/images/school_building.png',
//   'assets/images/activity.png',
//   'assets/images/splash.png',
//   'assets/images/leave_apply.png',
// ];
