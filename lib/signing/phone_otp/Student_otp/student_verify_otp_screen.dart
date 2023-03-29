import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../controllers/Bloc/Phone_otp/auth_cubit.dart';
import '../../../controllers/Bloc/Phone_otp/auth_state.dart';
import 'student_get_otp_verify_screen.dart';

class StudentPhoneVerificationScreen extends StatefulWidget {
  var schooilID;
  var classID;
  var studentID;
  var userEmail;
  var userPassword;
  StudentPhoneVerificationScreen(
      {required this.classID,
      required this.userEmail,
      required this.userPassword,
      this.schooilID,
      required this.studentID,
      super.key});

  @override
  State<StudentPhoneVerificationScreen> createState() =>
      Student_PhoneVerificationScreenState();
}

class Student_PhoneVerificationScreenState extends State<StudentPhoneVerificationScreen> {
  String phoneNumber = "";

  @override
  void initState() {
    getUserPhoneNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("number?>>>>>>>>>>>>>${phoneNumber}");
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Center(
            child: Column(
              children: [
                LottieBuilder.asset('assets/images/otpverfication.json'),
                const Text(
                  'Phone Verification',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('We need to register your phone before getting'),
                const SizedBox(
                  height: 10,
                ),
                const Text('started!'),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthCodeSentState) {
                      Get.off(StudentGetPhoneOTPVerificationScreen(
                        classID:widget.classID ,
                        schooilID: widget.schooilID,
                        phoneNumber: phoneNumber,
                        userEmail: widget.userEmail,
                        userPassword: widget.userPassword,
                      ));
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            // ignore: deprecated_member_use
                            primary: Colors.green.shade600),
                        onPressed: () async {
                          String verifyNumber = "+91$phoneNumber";
                          BlocProvider.of<AuthCubit>(context)
                              .sentOTP(verifyNumber);
                          log(verifyNumber);
                        },
                        child: const Text('Send OTP'));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  void getUserPhoneNumber() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schooilID)
        .collection("Classes")
        .doc(widget.classID)
        .collection("Students")
        .doc(widget.userEmail)
        .get();
    setState(() {
      phoneNumber = vari.data()!['parentPhNo'.toString()];
    });
    log(vari.data().toString());
  }
}
