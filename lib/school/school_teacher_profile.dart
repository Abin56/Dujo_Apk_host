import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/profileextraDetails/teacher_extra_profileadd_model.dart';
import '../signing/dujosigning.dart';

class SchoolTeachersProfile extends StatefulWidget {
  var studentImage;
  var teacherEmail;
  var schoolID;
  SchoolTeachersProfile(
      {required this.studentImage,
      required this.teacherEmail,
      required this.schoolID,
      super.key});

  @override
  State<SchoolTeachersProfile> createState() => _SchoolTeachersProfileState();
}

class _SchoolTeachersProfileState extends State<SchoolTeachersProfile> {
  TextEditingController _houseNameController = TextEditingController();
  TextEditingController _houseNumberController = TextEditingController();
  TextEditingController _placeController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _bloodGroupController = TextEditingController();

  String teacherName = "";
  String employeeID = "";

  final List<bool> _selectedSchools = <bool>[true, false, false];

  @override
  void initState() {
    getTeacherDetails();
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
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
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
                      Text('Name :' ' $teacherName',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Employee ID :' '$employeeID',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('email :' '${widget.teacherEmail}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.01),
                          child: const Text('')),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: screenSize.width * 1 / 8,
                          width: screenSize.width * 1,
                          child: const Text(
                            "Subjects",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        child: TextField(
                            controller: _bloodGroupController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Blood Group',

                                // prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                )),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            )),
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
                            controller: _houseNameController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'House Name',

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
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white]),
                        ),
                        child: TextField(
                            controller: _houseNumberController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                hintText: 'House Number',

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
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white]),
                        ),
                        child: TextField(
                            controller: _placeController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                hintText: 'Place / Street',

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
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white]),
                        ),
                        child: TextField(
                            controller: _districtController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                hintText: 'District',

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
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white]),
                        ),
                        child: TextField(
                            controller: _stateController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                hintText: 'State',

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
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white]),
                        ),
                        child: TextField(
                            controller: _pincodeController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 255, 255, 255),
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
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                            )),
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
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: ((context) => SchoolTeacherHome(
                            //               schoolId: '',
                            //             ))));
                            final addTeacherDeatils =
                                AddExtraDetailsofTeacherModel(
                                    teacherImage: widget.studentImage,
                                    houseName: _houseNameController.text.trim(),
                                    houseNumber:
                                        _houseNameController.text.trim(),
                                    place: _placeController.text.trim(),
                                    district: _districtController.text.trim(),
                                    state: _stateController.text.trim(),
                                    pincode: _pincodeController.text.trim(),
                                    bloodGroup:
                                        _bloodGroupController.text.toString());
                            await AddExtraDetailsofTeacherToFireBase()
                                .addExtraDetailsofTeachersController(
                                    addTeacherDeatils,
                                    context,
                                    widget.schoolID,
                                    widget.teacherEmail);
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
                          const Text(
                            "Don't have an account ? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          InkWell(
                            child: Container(
                              child: const Text(
                                "Sign Up",
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

  void getTeacherDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection("Teachers")
        .doc(widget.teacherEmail)
        .get();
    setState(() {
      teacherName = vari.data()!['teacherName'];
      employeeID = vari.data()!['employeeID'];
    });
    log(vari.toString());
  }
}

getsubjects(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select Subject'),
        content: SingleChildScrollView(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  GestureDetector(
                    onTap: (){
                       
                    },
                    child: Container(
                      
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: 10)),
        actions: <Widget>[
          TextButton(
            child: const Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
