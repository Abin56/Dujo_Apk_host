import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/home/common_teacher/common_teacher/teacher_selectclassMenu_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../home/student_home/Students_sections/constants.dart';
import '../../../model/getClassesList_model.dart';

class GetTeacherSubject extends StatelessWidget {
  var schoolId;
  var teacherEmail;
  var classID;

  GetTeacherSubject(
      {required this.schoolId,
      required this.teacherEmail,
      required this.classID,
      super.key});

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    log("Fecting schooil id ..............$schoolId");
    int columnCount = 2;
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("SchoolListCollection")
              .doc(schoolId)
              .collection("Teachers")
              .doc(teacherEmail)
              .collection("teacherClasses")
              .doc(classID)
              .collection("subjects")
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
                                log("Schoolid>>>>>>>>>>>>?$schoolId");
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

class ClassCard extends StatelessWidget {
  const ClassCard({Key? key, required this.onPress, required this.title})
      : super(key: key);
  final VoidCallback onPress;
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
          color: knewColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
//CommonTeacherHomeMain