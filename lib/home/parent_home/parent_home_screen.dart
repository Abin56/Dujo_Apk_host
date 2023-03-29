import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/home/parent_home/parent_accessories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../student_home/Students_sections/constants.dart';

class ParentHomeScreen extends StatefulWidget {
  var schoolId;
  var classId;
  var parentmailId;
  ParentHomeScreen(
      {required this.schoolId,
      required this.classId,
      required this.parentmailId,
      super.key});
  static String routeName = 'ParentHome';

  @override
  State<ParentHomeScreen> createState() => _ParentHomeScreenState();
}

class _ParentHomeScreenState extends State<ParentHomeScreen> {
  String fatherName = "";
  String mothersName = "";
  String studentName = '';
  String fatherImage = "";
  String motherImage = "";
  String studentID = "";
  String studentClass ="";
  //
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

  //
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
                          mothersName,
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        sizedBox,
                        Text(
                          'Student : $studentName\n ID : $studentClass',
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
                      backgroundImage: NetworkImage(motherImage),
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
            parentName: mothersName,
            studentID:studentID ,
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
        .collection("Students_Parents")
        .doc(widget.parentmailId)
        .get();
    setState(() {
      studentID = vari.data()!['wStudent'];
      fatherImage = vari.data()!['fatherImage'];
      motherImage = vari.data()!['parentImage'];
      fatherName = vari.data()!['nameofFather'];
      mothersName = vari.data()!['nameofMother'];
    });
    log("Hi this is student id${studentID}");
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
      studentClass = vari.data()!['studentClass'];
    });
    log(studentName);
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
