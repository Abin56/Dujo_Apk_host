import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Get_students/get_students_drop_downlist.dart';
import '../../dujosigning.dart';
import '../../phone_otp/parents_otp/get_otp_parents.dart';

class ParentDujoSignup extends StatelessWidget {
  var schoolID;
  var classID;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confromController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ParentDujoSignup({required this.schoolID,required this.classID, super.key});

  final List<bool> _selectedSchools = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    log("for paRENTS${schoolID}");
        log("for paRENTS${classID}");
    var screenSize = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          body: ListView(children: [
            // width: double.infinity,
            Container(
              width: screenSize.width * 0.8,
              margin: EdgeInsets.only(top: screenSize.width * 1 / 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  top: screenSize.width * 1 / 12),
                              width: screenSize.width / 3,
                              child: const Divider(
                                color: Colors.red,
                                thickness: 3,
                              )),
                          Padding(
                            padding:
                                EdgeInsets.only(top: screenSize.width * 1 / 20),
                            child: Container(
                              height: screenSize.width * 1 / 7,
                              width: screenSize.width * 1 / 3,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://firebasestorage.googleapis.com/v0/b/lepton-dujo-official.appspot.com/o/files%2Fleptdujo1.png?alt=media&token=2d8436cc-dc95-4d28-b2b5-8a5c0e19baae",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  top: screenSize.width * 1 / 12),
                              width: screenSize.width / 3,
                              child: const Divider(
                                color: Colors.red,
                                thickness: 3,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: screenSize.height * 0.7,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/leptondujobg.png",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenSize.width * 1),
                  child: Container(
                    height: screenSize.width * 2,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      gradient: LinearGradient(
                        colors: [Color(0xFFD40469), Color(0xFF5F005B)],
                        //colors: [Colors.blue, Colors.blueGrey],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenSize.width * 0.005,
                    top: screenSize.width * 1.11,
                    //right: screenSize.width * 1/30
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 250,
                        child: Container(
                          height: screenSize.width * 1 / 8,
                          width: screenSize.width * 1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 238, 238, 238)),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: GetStudentsForSignUpDropDownButton(
                              schoolID: schoolID, classID: classID),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: screenSize.width * 1 / 13),
                        // child: Container(
                        //   height: screenSize.width * 1 / 6.8,
                        //   width: screenSize.width * 0.65,
                        //   decoration: BoxDecoration(
                        //       // color: Colors.white,
                        //       borderRadius: BorderRadius.circular(15)),
                          child: TextFormField(
                              controller: emailController,
                              validator: (input) => input!.isValidEmail()
                                  ? null
                                  : "Please Enter a Valid email id",
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Enter Mail ID',
                                  prefixIcon: const Icon(Icons.mail_lock_sharp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  )),
                              style: const TextStyle(fontSize: 20)),
                        //),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: screenSize.width * 1 / 13),
                        child: Container(
                          height: screenSize.width * 1 / 6.8,
                          width: screenSize.width * 0.65,
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty || value.length < 4) {
                                  return 'Please enter a valid Password';
                                } else {
                                  return null;
                                }
                              },
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Password',
                                  prefixIcon: const Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  )),
                              style: const TextStyle(fontSize: 20)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: screenSize.width * 1 / 13,
                             left:screenSize.width * 1 / 8,
                            right: screenSize.width * 1 / 8 ),
                        // child: Container(
                        //   height: screenSize.width * 1 / 6.8,
                        //   width: screenSize.width * 0.65,
                        //   decoration: BoxDecoration(
                        //       // color: Colors.white,
                        //       borderRadius: BorderRadius.circular(15)),
                          child: TextFormField(
                              validator: (value) {
                                if (passwordController.text.trim() !=
                                    confromController.text.trim()) {
                                  return 'Password are Incorrect!!';
                                } else {
                                  return null;
                                }
                              },
                              controller: confromController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Confirm Password',
                                  prefixIcon: const Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  )),
                              style: const TextStyle(fontSize: 20)),
                       // ),
                      ),
                      SizedBox(height: screenSize.width * 1 / 15),
                      Container(
                        height: screenSize.width * 1 / 7,
                        width: screenSize.width * 1 / 1.5,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(14)),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.all(9.0),
                            textStyle: const TextStyle(fontSize: 17),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              Get.to(ParentPhoneVerificationScreen(
                                studentId: studentsListValue!['id'],
                                userEmail: emailController.text.trim(),
                                userPassword: passwordController.text.trim(),
                                classID: classID,
                                studentID: studentsListValue!["id"],
                                schooilID: schoolID,
                              ));
                            }
                          },
                          child: const Text('SIGN UP'),
                        ),
                      ),
                      SizedBox(height: screenSize.width * 1 / 100),
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenSize.width * 1 / 8,
                            top: screenSize.width * 1 / 29),
                        child: Row(children: [
                          const Text(
                            "Don't have an account ? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          InkWell(
                            child: Container(
                              child: const Text(
                                "Sign IN",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.yellowAccent),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DujoLogin(classID: classID,)),
                              );
                              // Get.to(ScreenPhoneLogin(classID: classID,schooilID: schoolID,));
                            },
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
