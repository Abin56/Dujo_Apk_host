import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/student_home/students_main_home.dart';
import '../dujo_sign_up/student_dujoSiginUp.dart';

class StudentLoginSection extends StatefulWidget {
  var schoolId;
  var classID;

  StudentLoginSection({
    super.key,
    required this.screenSize,
    required this.schoolId,
    this.classID,
  });

  final Size screenSize;

  @override
  State<StudentLoginSection> createState() => _StudentLoginSectionState();
}

class _StudentLoginSectionState extends State<StudentLoginSection> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log(widget.classID.toString());
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top:widget.screenSize.width * 1 / 15,
            left: widget.screenSize.width * 1 / 12,
                right: widget.screenSize.width * 1 / 13),
            child: Container(
             // height: screenSize.width * 0.13,
              decoration: BoxDecoration(
                   //color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                     // focusColor: Colors.white,
                      hintText: 'Enter Email ID',
                      prefixIcon: Icon(Icons.mail_lock_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      )),
                  style: TextStyle(fontSize: widget.screenSize.width*1/25)),
            ),
          ),
          SizedBox(
            height: widget.screenSize.width /15,
          ),
          Padding(
            padding: EdgeInsets.only(
                // top: screenSize.width * 1 / 36,
                left: widget.screenSize.width * 1 / 12,
                right: widget.screenSize.width * 1 / 13),
            child: Container(
             // height: widget.screenSize.width * 0.13,
              decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(19)),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: TextStyle(fontSize: widget.screenSize.width*1/25),
                  hintText: 'Password',
                ),
                style: TextStyle(fontSize: widget.screenSize.width*1/25),
                obscureText: true,
              ),
            ),
          ),
          SizedBox(
            height: widget.screenSize.width * 1 / 23,
          ),
          InkWell(
            child: Padding(
              padding: EdgeInsets.only(left: widget.screenSize.width * 1 / 1.9),
              child: Text(
                "Forgot Password ?",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {},
          ),
          SizedBox(height: widget.screenSize.width * 1 / 36),
          Container(
            height: widget.screenSize.width * 1 / 7,
            width: widget.screenSize.width * 1 / 1.2,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(14)),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                padding: const EdgeInsets.all(9.0),
                textStyle: const TextStyle(fontSize: 17),
              ),
              onPressed: () async {
                try {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim())
                      .then(
                        (value) => Get.to(
                          StudentsMainHomeScreen(
                            classID: widget.classID,
                            schoolID: widget.schoolId,
                            studentEmailid: emailController.text.trim(),
                          ),
                        ),
                      );
                  // .then((value) => Get.to(SchoolStudentHomeNew(
                  //       schoolID: schoolId,
                  //       classID: classID,
                  //       studentEmailid: emailController.text.trim(),
                  //     )));
                } catch (e) {
                  errorBox(context, e);
                }
              },
              child: const Text('SIGN IN'),
            ),
          ),
          SizedBox(height: widget.screenSize.width * 1 / 100),
          Padding(
            padding: EdgeInsets.only(
                left: widget.screenSize.width * 1 / 4.3,
                top: widget.screenSize.width * 1 / 29),
            child: Row(children: [
              Text(
                "Don't have an account ? ",
                style: TextStyle(color: Colors.white),
              ),
              InkWell(
                child: Container(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 19, color: Colors.yellowAccent),
                  ),
                ),
                onTap: () {
                  Get.to(StuentDujoSignup(
                    schoolID: widget.schoolId,
                    classID: widget.classID,
                  ));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //            DujoSignup(schoolID:schoolId ,classID: classID,)),
                  // );
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

void errorBox(context, e) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(e.toString()),
        );
      });
}
