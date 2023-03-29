import 'package:dujo_application/teacher_section/attendence_section/attendence-Book/attendence_Book_status.dart';
import 'package:dujo_application/teacher_section/attendence_section/classTeacher_classes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../guardian_home/guardian_home_screen.dart';
import '../../parent_home/parent_home_screen.dart';
import '../../student_home/Students_sections/constants.dart';
import 'commonsubject.dart';
import 'dart:developer';

class TeacherMenuClassScreen extends StatelessWidget {
  var classID;
  var teacherId;
  var schoolID;

  TeacherMenuClassScreen(
      {required this.classID,
      required this.teacherId,
      required this.schoolID,
      super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  top: screenSize.width * 1 / 6,
                  bottom: screenSize.width * 1 / 18),
              child: Container(
                width: 100.w,
                decoration: BoxDecoration(
                  color: kOtherColor,
                  borderRadius: kTopBorderRadius,
                ),
                child: SingleChildScrollView(
                  //for padding
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubjectsCommon()),
                              );
                            },
                            icon: 'assets/icons/teacher.svg',
                            title: 'Subjects',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            onPress: () {},
                            icon: 'assets/icons/live.svg',
                            title: 'Live Classes',
                          ),
                          HomeCard(
                            onPress: () {},
                            icon: 'assets/icons/record.svg',
                            title: 'Recorded \n Classes',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            onPress: () {
                              print("object");
                              Get.to(ClassTeacherIdentifyScreen(
                                  teacheremailID: teacherId,
                                  classID: classID,
                                  schoolID: schoolID));
                            },
                            icon: 'assets/icons/takeattendence.svg',
                            title: 'Take\nAttendence',
                          ),
                          HomeCard(
                            onPress: () {
                              Get.to(AttendenceBookScreen(
                                classID: classID,
                                schoolId: schoolID,
                              ));
                            },
                            icon: 'assets/icons/attendencebook.svg',
                            title: 'Attendence Book',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            onPress: () {
                              // Get.to(AttendenceDetailsScreen(schoolId: schoolID,classID: classID,));
                            },
                            icon: 'assets/icons/attendence.svg',
                            title: 'Attendence',
                          ),
                          HomeCard(
                            onPress: () {},
                            icon: 'assets/icons/progressreport.svg',
                            title: 'Progress\n Report',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
