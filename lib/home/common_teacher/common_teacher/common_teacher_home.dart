import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../student_home/Students_sections/constants.dart';
import 'c_teacher_accessories.dart';

class CommonTeacherHome extends StatefulWidget {
  var schoolId;
  var teacherEmail;

  CommonTeacherHome(
      {required this.schoolId, required this.teacherEmail, super.key});

  @override
  State<CommonTeacherHome> createState() => _CommonTeacherHomeState();
}

class _CommonTeacherHomeState extends State<CommonTeacherHome> {
  String teacherImage = '';
  String teacherName = "";
  String teacherClass = "";
  String timeText = "";
  String dateText = "";
  String teacherID='';
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
    getTeacherDetails();
    dateText = formatCurrentDate(DateTime.now());

    //time
    timeText = formatCurrentLiveTime(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer) {
      getCurrentLiveTime();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    log("Fecting schooil id ..............${widget.schoolId}");
    int columnCount = 2;
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
                          'ID : ${teacherID}',
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
        
          CommonTeacherAccessories(
            schoolId: widget.schoolId,
            teacherEmail: widget.teacherEmail,
          )
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
       teacherID = vari.data()!['employeeID'];
      
    });
    log(teacherImage.toString());
  }
}


//CommonTeacherHomeMain


//
