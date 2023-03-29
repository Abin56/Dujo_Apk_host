import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

import '../../../controllers/Bloc/Phone_otp/auth_cubit.dart';
import '../../../controllers/Bloc/Phone_otp/auth_state.dart';
import '../../../school/uploadImage _to_firebase.dart';



class TeacherGetPhoneOTPVerificationScreen extends StatelessWidget {
  var schooilID;
  var classID;
  var phoneNumber;
  var userEmail;
  var userPassword;
  final otpController = TextEditingController();
  TeacherGetPhoneOTPVerificationScreen(
      {required this.phoneNumber,
      required this.userEmail,
      required this.userPassword,
      required this.classID,
      required this.schooilID,
      super.key});

  @override
  Widget build(BuildContext context) {
    log('email>>>>>>>>>>>>>>>>>>>>>>>>${userEmail}');
    log('password>>>>>>>>>>>>>>>>>>>>>>>>${userPassword}');
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    // ignore: unused_local_variable
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );
    // ignore: unused_local_variable
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code = "";
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  LottieBuilder.asset(
                      'assets/images/105761-verification-code-otp-v2.json',
                      height: 300),
                  const Text(
                    'Otp Verification',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'We need to register your phone ${phoneNumber}before getting'),
                  SizedBox(
                    height: 10,
                  ),
                  const Text('started!'),
                  SizedBox(
                    height: 10,
                  ),
                  Pinput(
                    controller: otpController,
                    length: 6,
                    showCursor: true,
                    onChanged: (value) {
                      code = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoggedInState) {
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: userEmail, password: userPassword);
                        showDialog(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Message'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('Registration Successfully'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('ok'),
                                  onPressed: () {
                                    Get.offAll(UploadImageScreen(
                                      studentID: '',
                                      classID: classID,
                                      schoolId: schooilID,
                                      studentemail: userEmail,
                                    ));
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else if (state is AuthErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                duration: Duration(milliseconds: 2000),
                                content: Text("Somthing Wrong!!!!!")));
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
                            primary: Colors.green.shade600),
                        onPressed: () async {
                          BlocProvider.of<AuthCubit>(context)
                              .verifyOTP(otpController.text);
                        },
                        child: const Text('Verify Phone Number'),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
