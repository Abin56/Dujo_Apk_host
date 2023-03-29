import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../constants.dart';
import '../students_accessories.dart';

class StudentsHomeHomeScreen extends StatefulWidget {
  var schoolID;
  var classID;
  var studentEmailid;
  StudentsHomeHomeScreen(
      {required this.schoolID,
      required this.classID,
      required this.studentEmailid,
      Key? key})
      : super(key: key);

  @override
  State<StudentsHomeHomeScreen> createState() => _StudentsHomeHomeScreenState();
}

class _StudentsHomeHomeScreenState extends State<StudentsHomeHomeScreen>
    with TickerProviderStateMixin {
  String studentName = '';
  String studentclass = '';
  String rollNumber = '';
  String studentimage = '';
  String studentAdID = '';

  late DocumentSnapshot<Map<String, dynamic>> mon;
  late DocumentSnapshot<Map<String, dynamic>> tues;
  late DocumentSnapshot<Map<String, dynamic>> wed;
  late DocumentSnapshot<Map<String, dynamic>> thur;
  late DocumentSnapshot<Map<String, dynamic>> fri;
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

  void retrieveData() async {
    mon = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolID)
        .collection('Classes')
        .doc(widget.classID)
        .collection('TimeTables')
        .doc('Monday')
        .get();
    tues = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolID)
        .collection('Classes')
        .doc(widget.classID)
        .collection('TimeTables')
        .doc('Tuesday')
        .get();
    wed = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolID)
        .collection('Classes')
        .doc(widget.classID)
        .collection('TimeTables')
        .doc('Wednesday')
        .get();
    thur = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolID)
        .collection('Classes')
        .doc(widget.classID)
        .collection('TimeTables')
        .doc('Thursday')
        .get();
    fri = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolID)
        .collection('Classes')
        .doc(widget.classID)
        .collection('TimeTables')
        .doc('Friday')
        .get();
  }

  @override
  void initState() {
    getStudentClass();
    getStudentDetails();
    retrieveData();

    //date
    dateText = formatCurrentDate(DateTime.now());

    //time
    timeText = formatCurrentLiveTime(DateTime.now());

    // Timer.periodic(const Duration(seconds: 1), (timer) {
    //   getCurrentLiveTime();
    // });

    super.initState();
  }

  Widget build(BuildContext context) {
    log('message');
    TabController tabController = TabController(length: 3, vsync: this);
    var screenSize = MediaQuery.of(context).size;
    // log(studentName);
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
                  Color.fromARGB(255, 5, 85, 222)
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
                          studentName,
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        sizedBox,
                        Text(
                          'ID : $studentAdID | Roll No : $rollNumber',
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
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(studentimage),
                      radius: 40,
                    ),
                  ],
                ),
                sizedBox,
                const Divider(
                  color: Colors.white,
                  height: 10,
                ),
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
          StudentsAccessories(
            classID: widget.classID,
            schoolId: widget.schoolID,
          ),
        ],
      ),
    );
  }

  void getStudentDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection("Classes")
        .doc(widget.classID)
        .collection("Students")
        .doc(widget.studentEmailid)
        .get();
    setState(() {
      studentName = vari.data()!['studentName'];
      rollNumber = vari.data()!['rollNo'];
      studentimage = vari.data()!['studentImage'];
      studentAdID = vari.data()!['admissionNumber'];
    });
    // log(vari.toString());
  }

  getStudentClass() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection("Classes")
        .doc(widget.classID)
        .get();
    setState(() {
      studentclass = vari.data()!['className'];
    });
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
      required this.onPress,
      required this.icon,
      required this.title})
      : super(key: key);
  final VoidCallback onPress;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        width: 40.w,
        height: 20.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: containerColor[1],
              begin: Alignment.bottomCenter,
              end: Alignment.centerRight),
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              width: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              color: kOtherColor,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}

final containerColor = [
  [const Color(0xff6448fe), const Color(0xff5fc6ff)],
  [const Color(0xFF26A69A), const Color.fromARGB(255, 40, 167, 154)],
  [const Color(0xfffe6197), const Color(0xffffb463)],
  [
    const Color.fromARGB(255, 30, 196, 30),
    const Color.fromARGB(255, 79, 163, 30)
  ],
  [
    const Color.fromARGB(255, 116, 130, 255),
    const Color.fromARGB(255, 86, 74, 117)
  ],
  [
    const Color.fromARGB(248, 55, 30, 66),
    const Color.fromARGB(248, 122, 40, 161)
  ],
  [
    const Color.fromARGB(255, 208, 104, 105),
    const Color.fromARGB(255, 241, 66, 66)
  ],
  [
    const Color.fromARGB(248, 69, 4, 100),
    const Color.fromARGB(255, 95, 2, 138),
  ],
  [const Color(0xFF26A69A), const Color(0xFF26A69A)]
];
