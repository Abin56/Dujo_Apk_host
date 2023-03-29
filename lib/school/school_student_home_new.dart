import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../teacher_section/attendence_section/classTeacher_classes.dart';

class SchoolStudentHomeNew extends StatefulWidget {
  var schoolID;
  var classID;
  var studentEmailid;
  SchoolStudentHomeNew(
      {required this.schoolID,
      required this.classID,
      required this.studentEmailid,
      super.key});

  @override
  State<SchoolStudentHomeNew> createState() => _SchoolStudentHomeNewState();
}

class _SchoolStudentHomeNewState extends State<SchoolStudentHomeNew> {
  String studentName = '';
  String studentclass = '';
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Recorded Classes',
      style: optionStyle,
    ),
    Text(
      'Index 2: Live Classes',
      style: optionStyle,
    ),
    Text(
      'Index 3: Chat',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    getStudentClass();
    getStudentDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.schoolID);
    log(widget.classID);
    log(widget.studentEmailid);

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Student Home'),
      ),
      body: ListView(children: [
        // width: double.infinity,
        Container(
          width: screenSize.width * 0.8,
          margin: EdgeInsets.only(top: screenSize.width * 1 / 15),
          child: Row(),
        ),
        Stack(
          children: [
            Container(
              height: screenSize.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://storage.googleapis.com/scipro-bucket/dujo%20bckgrnd.jpg"),
                      fit: BoxFit.cover)),
            ),
            Stack(
              children: [
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: screenSize.width * 1 / 12),
                        width: screenSize.width / 3,
                        child: Divider(
                          color: Colors.red,
                          thickness: 3,
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.width * 1 / 12),
                      child: Container(
                        height: screenSize.width * 1 / 7,
                        width: screenSize.width * 1 / 3,
                        decoration: BoxDecoration(
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
                        margin: EdgeInsets.only(top: screenSize.width * 1 / 12),
                        width: screenSize.width / 3,
                        child: Divider(
                          color: Colors.red,
                          thickness: 3,
                        )),
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 350),
                  height: screenSize.height * 1 / 1.8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 107, 55, 202),
                        Color.fromARGB(255, 209, 31, 129),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Container(
                    height: screenSize.width * 0.43,
                    width: screenSize.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 100),
                          child: Container(
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Time Table",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Teachers",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Subjects",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 10),
                          child: Container(
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Tests",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Projects",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Assignments",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Container(
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Events",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Progress Reports",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Notices",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Container(
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Recorded Classes",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Live classes",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(
                                    //   builder: (context) {
                                    //     return ClassTeacherIdentifyScreen(
                                    //         schoolId: widget.schoolID);
                                    //   },
                                    // ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Attendence",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 200,
                  ),
                  child: Center(
                    child: Container(
                      height: screenSize.width * 0.7,
                      width: screenSize.width * 0.8,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.blue,
                              blurRadius: 1,
                              spreadRadius: 3,
                              offset: Offset(0, 0)),
                          BoxShadow(
                              color: Colors.red,
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: Offset(5, 5)),
                        ],
                        color: Color.fromARGB(255, 174, 174, 219),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(
                                  'https://via.placeholder.com/150'),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Container(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: screenSize.width * 1 / 10,
                                        width: screenSize.width * 1 / 1.7,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            studentName,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Container(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: screenSize.width * 1 / 10,
                                        width: screenSize.width * 1 / 1.7,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            studentclass,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Recorded Classes',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: 'Live Classes',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void getStudentDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection("Classes")
        .doc(widget.classID)
        .collection("Students")
        .doc(widget.studentEmailid)
        .get();
    setState(() {
      studentName = vari.data()!['studentName'];
    });
    log(vari.toString());
  }

  getStudentClass() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection("Classes")
        .doc(widget.classID)
        .get();
    setState(() {
      studentclass = vari.data()!['className'];
    });
  }
}
