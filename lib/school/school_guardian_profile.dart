import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../model/profileextraDetails/guardian_extra_profile.dart';
import '../signing/Get_students/get_students_drop_downlist.dart';

const List<Widget> Schools = <Widget>[
  Text('Student'),
  Text('Parent'),
  Text('Teacher')
];

class SchoolGuardian extends StatefulWidget {
  var imagepath;
  var schoolID;
  var classID;
  var studentIDD;
  var useremail;

  SchoolGuardian(
      {required this.imagepath,
      required this.schoolID,
      required this.classID,
      required this.studentIDD,
      required this.useremail,
      super.key});

  @override
  State<SchoolGuardian> createState() => _SchoolGuardianState();
}

class _SchoolGuardianState extends State<SchoolGuardian> {
  TextEditingController nameofGuardianController = TextEditingController();
  TextEditingController nameofMotherController = TextEditingController();
  TextEditingController guardianNAmeController = TextEditingController();
  TextEditingController houseNAmeController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  String parentimageUrl = '';
  String fatherimageUrl = '';
  String gender = '';
  String studentImage = "";
  String StudetName = '';
  String admissionNumber = "";
  final List<bool> _selectedSchools = <bool>[true, false, false];

  @override
  void initState() {
    getStudentDetils();
    super.initState();
  }

  Widget build(BuildContext context) {
    log(widget.studentIDD);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
                    padding: EdgeInsets.only(top: 80, left: 40),
                    child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 2,
                      child: Text(
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
                padding: EdgeInsets.only(top: 5, right: 100),
                child: Container(
                  height: screenSize.width * 1 / 7,
                  width: screenSize.width * 1 / 2,
                  child: Text(
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
              // height: screenSize.width * 1.29,
              //  width: double.infinity,
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
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenSize.width * 1 / 4.8),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, left: 40),
                            child: Container(
                              height: 160,
                              width: 160,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(120)),
                                  image: DecorationImage(
                                      image: NetworkImage(widget.imagepath),
                                      fit: BoxFit.contain),
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 25, 205, 202))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: screenSize.width * 1 / 25),
                      // Stack(
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(top: 20),
                      //       child: Container(
                      //         height: 90.h,
                      //         width: 90,
                      //         // color: Colors.amber,
                      //         decoration: BoxDecoration(
                      //             border: Border.all(
                      //                 color: Colors.white, width: 3),
                      //             color: Colors.transparent,
                      //             shape: BoxShape.circle),
                      //         child: pickeimagefilesec == null
                      //             ? const CircleAvatar(
                      //                 backgroundColor: Colors.black,
                      //                 radius: 100,
                      //                 // child: Image.asset(getimagePath),
                      //               )
                      //             : CircleAvatar(
                      //                 backgroundColor: Colors.black,
                      //                 radius: 100,
                      //                 backgroundImage: FileImage(
                      //                   File(pickeimagefilesec!.path!),
                      //                 ),
                      //               ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding:
                      //           const EdgeInsets.only(left: 70, top: 85),
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           selectSecondGallery().then((value) => uploadFileSec());
                      //           // uploadFileSec();
                      //         },
                      //         child: Container(
                      //           height: 25,
                      //           width: 25,
                      //           decoration: BoxDecoration(
                      //             shape: BoxShape.circle,
                      //             color: Color.fromARGB(255, 0, 0, 0),
                      //           ),
                      //           child: Icon(
                      //             Icons.camera_alt,
                      //             color: Colors.white,
                      //           ),
                      //           alignment: Alignment.center,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: [
                      Text('E-mail :' + '${widget.useremail}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.white]),
                        ),
                        child: TextField(
                            controller: nameofGuardianController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Name of Guardian',

                                // prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(19),
                                  borderSide: BorderSide.none,
                                )),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            )),
                      ),
                
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: screenSize.width * 1 / 6,
                              // width: screenSize.width * 1 / 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                // gradient: LinearGradient(colors: [
                                //   Color.fromARGB(255, 110, 49, 252),
                                //   Color.fromARGB(255, 212, 0, 255)
                                // ]),
                              ),
                              child: Column(
                                children: [
                                  Text('Name : ${StudetName}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      )),
                                  Text('AD.NO : ' + '${admissionNumber}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                // top: screenSize.width * 1 / 8,
                                left: screenSize.width * 1 / 8,
                              ),
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(studentImage),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
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
                                color: Color.fromARGB(255, 238, 238, 238)),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: DropdownButton(
                            hint: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Gender",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            underline: const SizedBox(),
                            style: const TextStyle(
                              fontSize: 18,
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
                            items: [
                              "male",
                              "female",
                            ].map(
                              (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(() {
                                gender = val.toString();
                              });
                            },
                          ),
                        ),
                      ),
             
        
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.white]),
                        ),
                        child: TextField(
                            controller: houseNAmeController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 255, 255),
                                hintText: 'House Name',

                                // prefixIcon: Icon(Icons.email),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(19),
                                  borderSide: BorderSide.none,
                                )),
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.white]),
                        ),
                        child: TextField(
                            controller: houseNumberController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 255, 255),
                                hintText: 'House Number',

                                // prefixIcon: Icon(Icons.email),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(19),
                                  borderSide: BorderSide.none,
                                )),
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.white]),
                        ),
                        child: TextField(
                            controller: placeController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 255, 255),
                                hintText: 'Place / Street',

                                // prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(19),
                                  borderSide: BorderSide.none,
                                )),
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.white]),
                        ),
                        child: TextField(
                            controller: districtController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 255, 255),
                                hintText: 'District',

                                // prefixIcon: Icon(Icons.email),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(19),
                                  borderSide: BorderSide.none,
                                )),
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.white]),
                        ),
                        child: TextField(
                            controller: stateController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 255, 255),
                                hintText: 'State',

                                // prefixIcon: Icon(Icons.email),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(19),
                                  borderSide: BorderSide.none,
                                )),
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.white]),
                        ),
                        child: TextField(
                            controller: pincodeController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 255, 255),
                                hintText: 'PinCode',

                                // prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(19),
                                  borderSide: BorderSide.none,
                                )),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                            )),
                      ),
                      SizedBox(
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
                            foregroundColor: Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.all(9.0),
                            textStyle: const TextStyle(fontSize: 17),
                          ),
                          onPressed: () {
                            log("ParentUrl${parentimageUrl}");
                            log("FatherUrl${fatherimageUrl}");
                            final parentDetails =
                                AddExtraDetailsofGuardianModel(
                                  wStudent: studentsListValue!['id'],
                                    gender: gender,
                                    houseName: houseNAmeController.text.trim(),
                                    place: placeController.text.trim(),
                                    state: stateController.text.trim(),
                                    pincode: pincodeController.text.trim(),
                                    guardianImage: widget.imagepath,
                                    );
                            AddExtraDetailsofGuardianToFireBase()
                                .addExtraDetailsofGuardianController(
                                    parentDetails,
                                    context,
                                    widget.schoolID,
                                    widget.useremail);
                          },
                          child: const Text('Sign Up'),
                        ),
                      ),
                      SizedBox(height: screenSize.width * 1 / 100),
                      Padding(
                        padding: EdgeInsets.only(
                          left: screenSize.width * 1 / 9,
                          top: screenSize.width * 1 / 29,
                        ),
                        child: Row(children: [
                          Text(
                            "Don't have an account ? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          InkWell(
                            child: Container(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.yellowAccent),
                              ),
                            ),
                            onTap: () {},
                          ),
                        ]),
                      ),
                      SizedBox(
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
  getStudentDetils() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection("Classes")
        .doc(widget.classID)
        .collection("Students")
        .doc(widget.studentIDD)
        .get();
    setState(() {
      studentImage = vari.data()!['studentImage'];
      admissionNumber = vari.data()!['admissionNumber'];
      StudetName = vari.data()!['studentName'];
    });
    log(vari.toString());
  }
}
