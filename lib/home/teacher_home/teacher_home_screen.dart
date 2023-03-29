import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/home/teacher_home/get_teacher_subject.dart';
import 'package:dujo_application/home/teacher_home/progress_Report/create_examName_screen.dart';
import 'package:dujo_application/home/teacher_home/teacher_accessories.dart';
import 'package:dujo_application/home/teacher_home/teacher_addlist_of_class.dart';
import 'package:dujo_application/teacher_section/attendence_section/attendence-Book/attendence_Book_status.dart';
import 'package:dujo_application/teacher_section/attendence_section/classTeacher_classes.dart';
import 'package:dujo_application/teacher_section/attendence_section/take_attentence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../teacher_section/attendence_section/attendence-Book/attendence_subject_list.dart';
import '../student_home/Students_sections/constants.dart';
import 'leave_letters/leave_lettersList.dart';
import 'widgets/card_container.dart';

class TeacherHomeScreen extends StatefulWidget {
  var schoolId;
  var teacherEmail;
  var classID;
  TeacherHomeScreen(
      {required this.schoolId,
      required this.teacherEmail,
      required this.classID,
      super.key});
  static String routeName = 'TeacherHome';

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  String teacherImage = '';
  String teacherName = "";
  String teacherClass = "";
  String teacherClassID = "";
  String teacherSubject = "";
  String timeText = "";
  String dateText = "";
  String formatCurrentLiveTime(DateTime time) {
    return DateFormat("hh : mm : ss a").format(time);
  }

  String formatCurrentDate(DateTime date) {
    return DateFormat("dd MMMM, yyyy").format(date);
  }

  getCurrentLiveTime() {
    final DateTime timeNow = DateTime.now();
    final String liveTime = formatCurrentLiveTime(timeNow);
    final String liveDate = formatCurrentDate(timeNow);

    if (this.mounted) {
      setState(() {
        timeText = liveTime;
        dateText = liveDate;
      });
    }
  }

  @override
  void initState() {
    getTeacherDetails().then((value) => getTeacherClass());
    dateText = formatCurrentDate(DateTime.now());

    //time
    timeText = formatCurrentLiveTime(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer) {
      getCurrentLiveTime();
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 6, 71, 157),
                  Color.fromARGB(255, 6, 71, 157)
                ],
              ),
            ),
            width: 100.w,
            height: 30.h,
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          teacherName,
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        sizedBox,
                        Text(
                          'ID : $teacherClassID\nClass : $teacherClass',
                          style: GoogleFonts.poppins(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                     CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(teacherImage),

                      radius: 50,
                    ),
                  ],
                ),
                sizedBox,
                const Divider(
                  color: Colors.white,
                  height: 10,
                ),
                sizedBox,
                sizedBox,
                Text(
                  timeText,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                sizedBox,
                Text(
                  dateText,
                  style: GoogleFonts.montserrat(
                      color: const Color.fromARGB(255, 26, 26, 26),
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),

          //other will use all the remaining height of screen
          TeacherAccessories(
            teacherSubject: teacherSubject,
            classID:widget.classID ,
            schoolId: widget.schoolId,
            teacherEmail: widget.teacherEmail,
          ),
        ],
      ),
    );
  }

  Future<void> getTeacherDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolId)
        .collection("Teachers")
        .doc(widget.teacherEmail)
        .get();
    setState(() {
      teacherName = vari.data()!['teacherName'];
      teacherImage = vari.data()!['teacherImage'];
      teacherClassID = vari.data()!['classIncharge'];
    });
    log(teacherImage.toString());
  }

  Future<void> getTeacherClass() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolId)
        .collection("Classes")
        .doc(teacherClassID)
        .get();
    setState(() {
      teacherClass = vari.data()!['className'];
    });
    log(vari.toString());
  }


}

