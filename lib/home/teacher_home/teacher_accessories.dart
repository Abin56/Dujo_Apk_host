import 'package:dujo_application/home/admin/admin_meeting/admin_meeting_list.dart';
import 'package:dujo_application/home/teacher_home/class_wise_subjects.dart';
import 'package:dujo_application/home/teacher_home/leave_letters/leave_lettersList.dart';
import 'package:dujo_application/home/teacher_home/progress_Report/all_student_list.dart';
import 'package:dujo_application/home/teacher_home/progress_Report/create_examName_screen.dart';
import 'package:dujo_application/teacher_section/attendence_section/attendence-Book/attendence_subject_list.dart';
import 'package:dujo_application/teacher_section/attendence_section/take_attentence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widget/button_container.dart';
import '../../teacher_section/attendence_section/attendence-Book/attendence_Book_status.dart';
import '../../teacher_section/attendence_section/classTeacher_classes.dart';
import '../admin/admin_notice/admin_notice_model_list.dart';

class TeacherAccessories extends StatelessWidget {
  var schoolId;
  var teacherEmail;
  var classID;
  var teacherSubject;
  TeacherAccessories({
    required this.schoolId,
    required this.teacherEmail,
    required this.classID,
    required this.teacherSubject,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenNavigation = [
      ClassTeacherIdentifyScreen(
          classID: classID, schoolID: schoolId, teacheremailID: teacherEmail),
      AttendenceBookScreen(schoolId: schoolId, classID: classID),
      AttendenceBookScreen(schoolId: schoolId, classID: classID),
      AttendenceBookScreen(schoolId: schoolId, classID: classID),
      AttendenceBookScreen(schoolId: schoolId, classID: classID),
      AdminNoticeModelList(schoolId: schoolId, fromPage: 'visibleTeacher'),
      AttendenceBookScreen(schoolId: schoolId, classID: classID),
      CreateExamNameScreen(
          schooilID: schoolId, classID: classID, teacherId: teacherEmail),
      LeaveLettersListviewScreen(schooilID: schoolId, classID: classID),
      AdminMeetingModelList(schoolId: schoolId,fromPage: 'visibleTeacher'),
    ];
    int columnCount = 2;
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Expanded(
        child: AnimationLimiter(
      child: GridView.count(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.all(_w / 60),
        crossAxisCount: columnCount,
        children: List.generate(
          10,
          (int index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 300),
              columnCount: columnCount,
              child: ScaleAnimation(
                duration: const Duration(milliseconds: 900),
                curve: Curves.fastLinearToSlowEaseIn,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(screenNavigation[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 40,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        height: _h / 100,
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            bottom: _w / 10, left: _w / 50, right: _w / 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 75,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(_acc_images[index]),
                                ),
                              ),
                            ),
                            Text(
                              _acc_text[index],
                              style: GoogleFonts.montserrat(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
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
    ));
  }
}

List<String> _acc_text = [
  'Take Attendance',
  'Attendance Book',
  'Exams',
  'TimeTable',
  'HomeWorks',
  'Notices',
  'Events',
  'Progress Report',
  'Application List',
  'Meetings'
];
var _acc_images = [
  'assets/images/attendance.png',
  'assets/images/classroom.png',
  'assets/images/exam.png',
  'assets/images/library.png',
  'assets/images/homework.png',
  'assets/images/school_building.png',
  'assets/images/activity.png',
  'assets/images/splash.png',
  'assets/images/leave_apply.png',
  'assets/images/leave_apply.png',
];
