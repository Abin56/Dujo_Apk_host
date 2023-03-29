import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/signing/appLoginInterface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/profileextraDetails/students_extra_profile.dart';
import '../signing/Get_school/get_schooil_dropList.dart';
import '../signing/dujosigning.dart';

class StudentProfile extends StatefulWidget {
  var studentImage;
  var studentemail;
  var classID;
  var schoolID;
  StudentProfile(
      {required this.studentImage,
      required this.classID,
      required this.schoolID,
      required this.studentemail,
      super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  String genderValue = "";
  String studentAName = "";
  String studentAdmissionNumber = "";
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController rollNumberController = TextEditingController();
  TextEditingController gurdenNAmeController = TextEditingController();
  TextEditingController studentAddressController = TextEditingController();

  final List<bool> _selectedSchools = <bool>[true, false, false];

  @override
  void initState() {
getStudentDetails();
    super.initState();
  }
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: ListView(children: [
        Container(
          height: 250,
          width: screenSize.width,
          // margin: EdgeInsets.only(top: screenSize.width * 0.8),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80, left: 40),
                    child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 2,
                      child: const Text(
                        "Welcome,",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 90, 1, 131)),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 100),
                child: Container(
                  height: screenSize.width * 1 / 7,
                  width: screenSize.width * 1 / 2,
                  child: const Text(
                    "Sign Up,",
                    style: TextStyle(
                        fontSize: 35, color: Color.fromARGB(255, 90, 1, 131)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Stack(children: [
          Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(29),
                    topRight: Radius.circular(29)),
                gradient: LinearGradient(
                  colors: [Color(0xFFD40469), Color(0xFF5F005B)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(120)),
                            image: DecorationImage(
                                image: NetworkImage(widget.studentImage),
                                fit: BoxFit.contain),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 25, 205, 202))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 110, top: 130),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: [
                      Text('Name :' + '${studentAName}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.width*1/25,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Student email :' + '${widget.studentemail}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.width*1/25,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Admission Number :' + '${studentAdmissionNumber}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.width*1/25,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Container(
                          height: screenSize.width * 1 / 7,
                          width: screenSize.width * 1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 238, 238, 238)),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: GetClassesForSignUpDropDownButton(
                              schoolID: widget.schoolID),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Container(
                              height: screenSize.width * 1 / 8,
                              width: screenSize.width * 1 / 2.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                // gradient: LinearGradient(colors: [
                                //   Color.fromARGB(255, 110, 49, 252),
                                //   Color.fromARGB(255, 212, 0, 255)
                                // ]),
                              ),
                              child: TextField(
                                  controller: bloodGroupController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Blood Group',

                                      // prefixIcon: Icon(Icons.email),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(19),
                                        borderSide: BorderSide.none,
                                      )),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  )),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Container(
                              height: screenSize.width * 1 / 8,
                              width: screenSize.width * 1 / 2.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                // gradient: LinearGradient(colors: [
                                //   Color.fromARGB(255, 110, 49, 252),
                                //   Color.fromARGB(255, 212, 0, 255)
                                // ]),
                              ),
                              child: TextField(
                                  controller: rollNumberController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Roll No',

                                      // prefixIcon: Icon(Icons.email),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(19),
                                        borderSide: BorderSide.none,
                                      )),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  )),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01),
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
                          child: DropdownButton(
                            hint: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Gender",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            underline: const SizedBox(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            icon: const Padding(
                              padding: EdgeInsets.all(
                                13,
                              ),
                              child: Icon(Icons.arrow_drop_down,
                                  size: 18, color: Colors.grey),
                            ),
                            isExpanded: true,
                            items: ["MALE", "FEMALE", ""].map(
                              (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(() {
                                genderValue = val.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white]),
                        ),
                        child: TextField(
                            controller: gurdenNAmeController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Guardian Name',

                                // prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(19),
                                  borderSide: BorderSide.none,
                                )),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(29)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: screenSize.width * 1 / 15,
                              top: screenSize.width * 1 / 20),
                          child: TextField(
                            controller: studentAddressController,
                            maxLines: 8, //or null
                            decoration:
                                InputDecoration.collapsed(hintText: "Address"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: screenSize.width * 1 / 9,
                        width: screenSize.width * 1 / 1.9,
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
                            log(classesListValue!["id"]);
                            final studenDetails =
                                AddExtraDetailsofStudentsModel(
                                    // id: '',
                                    studentClass: classesListValue!["id"],
                                    bloodGroup:
                                        bloodGroupController.text.trim(),
                                    rollNo: rollNumberController.text.trim(),
                                    gurdianName:
                                        gurdenNAmeController.text.trim(),
                                    address:
                                        studentAddressController.text.trim(),
                                    gender: genderValue,
                                    studentImage: widget.studentImage);

                            AddExtraDetailsofStudentsToFireBase()
                                .addExtraDetailsofStudentsController(
                                    studenDetails,
                                    context,
                                    widget.schoolID,
                                    widget.classID,
                                    widget.studentemail)
                                .then((value) => showDialog(
                                      context: context,
                                      barrierDismissible:
                                          false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Message'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text('Successfully updated'),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('ok'),
                                              onPressed: () {
                                              Get.offAll(OpeningPage());
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    ));
                          },
                          child: const Text('Update My profile'),
                        ),
                      ),
                      SizedBox(height: screenSize.width * 1 / 100),
                      Padding(
                        padding: EdgeInsets.only(
                          left: screenSize.width * 1 / 9,
                          top: screenSize.width * 1 / 29,
                        ),
                        child: Row(children: [
                          const Text(
                            "Don't have an account ? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          InkWell(
                            child: Container(
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.yellowAccent),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DujoLogin()),
                              );
                            },
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ]))
        ]),
      ]),
    );
  }

  void getStudentDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection("Classes")
        .doc(widget.classID)
        .collection("Students")
        .doc(widget.studentemail)
        .get();
    setState(() {
      studentAName = vari.data()!['studentName'];
      studentAdmissionNumber = vari.data()!['admissionNumber'];
    });
    log(vari.toString());
  }
}
