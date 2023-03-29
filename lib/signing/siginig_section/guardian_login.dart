import 'dart:developer';
import 'package:dujo_application/signing/dujo_sign_up/guardian_dujoSiginUp.dart';
import 'package:dujo_application/signing/siginig_section/student_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/guardian_home/guardian_drawer/guardian_main_home.dart';
import '../../home/guardian_home/guardian_home_screen.dart';

class GuardianLoginSection extends StatefulWidget {
  var id;
  var schooilID;
  var classID;

  GuardianLoginSection({
    super.key,
    required this.screenSize,
    required this.classID,
    required this.schooilID,
    required this.id,
  });

  final Size screenSize;

  @override
  State<GuardianLoginSection> createState() => _GuardianLoginSectionState();
}

class _GuardianLoginSectionState extends State<GuardianLoginSection> {
  TextEditingController _idController = TextEditingController();

  TextEditingController _passwoedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  controller: _idController,
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
                controller: _passwoedController,
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
                log(_idController.text.trim());
                try {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _idController.text.trim(),
                          password: _passwoedController.text.trim())
                      .then((value) => Get.to(GuardianMainHomeScreen(
                            classID: widget.classID,
                            schoolID: widget.schooilID,
                            parentmailId: _idController.text.trim(),
                          )));
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
                  Get.to(GuardianDujoSignup(
                      schoolID: widget.schooilID, classID: widget.classID));
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
