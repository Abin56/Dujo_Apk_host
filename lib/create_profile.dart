import 'dart:developer';


import 'package:dujo_application/school/school_guardian_profile.dart';
import 'package:dujo_application/school/school_parent_profile.dart';
import 'package:dujo_application/school/school_student_profile.dart';
import 'package:dujo_application/school/school_teacher_profile.dart';
import 'package:dujo_application/signing/Get_students/get_students_drop_downlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'collage/collage_faculty_profile.dart';
import 'collage/collage_parent_profile.dart';
import 'collage/collage_student_profile.dart';

class Profile extends StatelessWidget {
  var imagepath;
  var classID;
  var schoolID;
  var studentemail;
  var studentID;

  Profile(
      {required this.imagepath,
      required this.classID,
      required this.schoolID,
      required this.studentemail,
      required this.studentID,
      super.key});

  @override
  Widget build(BuildContext context) {
    log(imagepath);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Profile'.tr),
        ),
        backgroundColor: Color.fromARGB(255, 151, 58, 163),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.width / 4,
                  ),
                  child: Container(
                    height: screenSize.height / 3.2,
                    width: screenSize.width / 1.2,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 2),
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 93, 8, 190),
                            Color.fromARGB(255, 187, 33, 214),
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "School".tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StudentProfile(
                                        studentImage: imagepath,
                                        classID: classID,
                                        schoolID: schoolID,
                                        studentemail: studentemail,
                                      )),
                            );
                          },
                          child: Container(
                            height: 35,
                            width: screenSize.width / 2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child:
                                Center(child: Text("CREATE STUDENT PROFILE ".tr)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SchoolParentProfile(
                                    useremail: studentemail,
                                        imagepath: imagepath,
                                        classID: classID,
                                        schoolID: schoolID,
                                        studentIDD: studentsListValue!['id'],
                                      )),
                            );
                          },
                          child: Container(
                            height: 35,
                            width: screenSize.width / 2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Center(child: Text("CREATE PARENT PROFILE".tr)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SchoolGuardian(
                                    useremail: studentemail,
                                        imagepath: imagepath,
                                        classID: classID,
                                        schoolID: schoolID,
                                        studentIDD: studentsListValue!['id'],
                                      )),
                            );
                          },
                          child: Container(
                            height: 35,
                            width: screenSize.width / 2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Center(child: Text("CREATE GUARDIAN PROFILE".tr)),
                          ),
                        ),
                            SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SchoolTeachersProfile(
                                        studentImage: imagepath,
                                        schoolID: schoolID,
                                        teacherEmail: studentemail,
                                      )),
                            );
                          },
                          child: Container(
                            height: 35,
                            width: screenSize.width / 2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child:
                                Center(child: Text("CREATE TEACHER PROFILE".tr)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  height: screenSize.height / 3.2,
                  width: screenSize.width / 1.2,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 2),
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 93, 8, 190),
                          Color.fromARGB(255, 187, 33, 214),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "College".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CollegeStudentProfile()),
                          );
                        },
                        child: Container(
                          height: 35,
                          width: screenSize.width / 2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(child: Text("CREATE STUDENT PROFILE".tr)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CollegeParent()),
                          );
                        },
                        child: Container(
                          height: 35,
                          width: screenSize.width / 2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(child: Text("CREATE PARENT PROFILE".tr)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CollegeFacualty()),
                          );
                        },
                        child: Container(
                          height: 35,
                          width: screenSize.width / 2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(child: Text("CREATE FACULTY PROFILE".tr)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
