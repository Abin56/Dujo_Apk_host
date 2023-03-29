import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../parent_home/parent_accessories.dart';
import '../student_home/Students_sections/constants.dart';

class GuardianHomeScreen extends StatefulWidget {
  var schoolId;
  var classId;
  var guardianmailId;

  GuardianHomeScreen(
      {required this.schoolId,
      required this.classId,
      required this.guardianmailId,
      super.key});
  static String routeName = 'GuardianHome';

  @override
  State<GuardianHomeScreen> createState() => _GuardianHomeScreenState();
}

class _GuardianHomeScreenState extends State<GuardianHomeScreen> {
  String gurdianName = '';
  String studentName = '';
  String gurdianImage = "";
  String studentID = "";
  String studentAdNo ='';

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
    getParentDetails().then((value) => getstudentDetails());
    dateText = formatCurrentDate(DateTime.now());

    //time
    timeText = formatCurrentLiveTime(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer) {
      getCurrentLiveTime();
    });

    super.initState();
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
                          gurdianName,
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        sizedBox,
                        Text(
                          'Student : $studentName\n ID : $studentAdNo',
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
                      backgroundImage: NetworkImage(gurdianImage),
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
          ParentsAccessories(
            parentName: gurdianName,
            studentID: studentID,
            classID: widget.classId,
            schoolId: widget.schoolId,
            studentName: studentName,
          ),
        ],
      ),
    );
  }

  Future<void> getParentDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolId)
        .collection("Student_Guardian")
        .doc(widget.guardianmailId)
        .get();
    setState(() {
      gurdianName = vari.data()!['guardianName'];
      gurdianImage = vari.data()!['guardianImage'];
      studentID = vari.data()!['wStudent'];
    });
  }

  getstudentDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolId)
        .collection("Classes")
        .doc(widget.classId)
        .collection("Students")
        .doc(studentID)
        .get();
    setState(() {
      studentName = vari.data()!['studentName'];
      studentAdNo = vari.data()!['admissionNumber'];
    });
  }
}
