import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/home/admin/admin_meeting/admin_meeting_list.dart';
import 'package:dujo_application/home/leave_application/apply_leave_application.dart';
import 'package:dujo_application/home/parent_home/progress_report/progress_report.dart';
import 'package:dujo_application/home/sample/under_maintance.dart';
import 'package:dujo_application/home/student_home/events/school_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widget/button_container.dart';
import '../../teacher_section/attendence_section/attendence-Book/attendence_Book_status.dart';
import '../admin/admin_notice/admin_notice_model_list.dart';
import '../student_home/Students_sections/homescreen/students_accessories.dart';
import '../student_home/time_table/time_table_screen.dart';

class ParentsAccessories extends StatefulWidget {
  var schoolId;
  var classID;
  var studentID;
  var studentName;
  var parentName;
  ParentsAccessories({
    required this.schoolId,
    required this.classID,
    required this.studentID,
    required this.studentName,
    required this.parentName,
    super.key,
  });

  @override
  State<ParentsAccessories> createState() => _ParentsAccessoriesState();
}

class _ParentsAccessoriesState extends State<ParentsAccessories> {
  void retrieveTimeTableData() async {
    mon = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolId)
        .collection('Classes')
        .doc(widget.classID)
        .collection('TimeTables')
        .doc('Monday')
        .get();
    tue = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolId)
        .collection('Classes')
        .doc(widget.classID)
        .collection('TimeTables')
        .doc('Tuesday')
        .get();
    wed = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolId)
        .collection('Classes')
        .doc(widget.classID)
        .collection('TimeTables')
        .doc('Wednesday')
        .get();
    thu = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolId)
        .collection('Classes')
        .doc(widget.classID)
        .collection('TimeTables')
        .doc('Thursday')
        .get();
    fri = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolId)
        .collection('Classes')
        .doc(widget.classID)
        .collection('TimeTables')
        .doc('Friday')
        .get();
  }

  @override
  void initState() {
    retrieveTimeTableData();
    super.initState();
  }

  Widget build(BuildContext context) {
    final navScreens = [
      AttendenceBookScreen(schoolId: widget.schoolId, classID: widget.classID),
      UnderMaintanceScreen(),
      TimeTablePage(
        schoolID: widget.schoolId,
        classID: widget.classID,
        mon: mon,
        tues: tue,
        wed: wed,
        thurs: thu,
        fri: fri,
      ),
      UnderMaintanceScreen(),
      AdminNoticeModelList(
          schoolId: widget.schoolId, fromPage: 'visibleGuardian'),
      UnderMaintanceScreen(),
      ProgressReportListViewScreen(
          schoolId: widget.schoolId,
          classID: widget.classID,
          studentId: widget.studentID),
      LeaveApplicationScreen(
          studentName: widget.studentName,
          parentName: widget.parentName,
          classID: widget.classID,
          schoolId: widget.schoolId,
          studentID: widget.studentID),
      UnderMaintanceScreen(),
      UnderMaintanceScreen(),
      AdminMeetingModelList(
        schoolId: widget.schoolId,
        fromPage: 'visibleGuardian',
      )
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
          11,
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
                        Get.to(navScreens[index]);
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
  'Attendance Book',
  'Exams',
  'TimeTable',
  'HomeWorks',
  'Notices',
  'Events',
  'Progress Report',
  'Apply Leave',
  'Sujects',
  'Teachers',
  'Meetings'
];
var _acc_images = [
  'assets/images/classroom.png',
  'assets/images/exam.png',
  'assets/images/library.png',
  'assets/images/homework.png',
  'assets/images/school_building.png',
  'assets/images/activity.png',
  'assets/images/splash.png',
  'assets/images/leave_apply.png',
  'assets/images/subjects.png',
  'assets/images/teachers.png',
  'assets/images/teachers.png',
];
