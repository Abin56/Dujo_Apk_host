
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class SchoolTeacherHome extends StatefulWidget {
  var schoolId;
  var teacherEmail;
  var classID;
   SchoolTeacherHome({
    required this.schoolId,
     required this.teacherEmail,
     required this.classID,
    super.key});

  @override
  State<SchoolTeacherHome> createState() => _SchoolTeacherHomeState();
}

class _SchoolTeacherHomeState extends State<SchoolTeacherHome> {
  String teacherImage ='';
  String teacherName ="";
  String teacherClass ="";
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
getTeacherDetails();
getTeacherClass();
    super.initState();
  }
  Widget build(BuildContext context) {
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://storage.googleapis.com/scipro-bucket/dujo%20bckgrnd.jpg"),
                      fit: BoxFit.cover)),
            ),
            Stack(
              children: [
               Column(
                  children: [
                    
             
              Padding(
                padding:  EdgeInsets.only(top:screenSize.width*1/15 ,
                //left: screenSize.width*1/3.3
                ),
                child: Center(
                  child: Container(
                    height: screenSize.width*1/6,
                    width: 100,
                     decoration: new BoxDecoration(
                     image: new DecorationImage(
                     image: new AssetImage('assets/images/leptdujo.png'),
                     fit: BoxFit.fill,
                       )
                     )
                   ),
                ),
              )
                
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 350),
                  height: screenSize.height * 1 / 1.8,
                  width: double.infinity,
                  decoration: const BoxDecoration(
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
                    decoration: const BoxDecoration(
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
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: const Center(
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
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: const Center(
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
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: const Center(
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
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: const Center(
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
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: const Center(
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
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: const Center(
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
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: const Center(
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
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: const Center(
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
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: const Center(
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
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: const Center(
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
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    //        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    //   return AttendenceBookScreen(schoolId: widget.schoolId);
                                    // },));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Attendence Book",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    //   return ClassTeacherIdentifyScreen(: widget.schoolId);
                                    // },));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: screenSize.width * 1 / 8,
                                      width: screenSize.width * 1 / 4,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Take Attendence",
                                          style: TextStyle(
                                               fontWeight: FontWeight.w500,
                                              fontSize: 12,
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
                      decoration: const BoxDecoration(
                        boxShadow: [
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
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(120)),
                            image: DecorationImage(
                                image: NetworkImage(teacherImage),
                                fit: BoxFit.contain),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 25, 205, 202))),
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
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child:  Center(
                                          child: Text(
                                            teacherName,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
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
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child:  Center(
                                          child: Text(
                                            teacherClass,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
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
  
    );
  }
    void getTeacherDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolId)
        .collection("Teachers")
        .doc(widget.teacherEmail)
        .get();
    setState(() {
      teacherName = vari.data()!['teacherName'];
         teacherImage = vari.data()!['teacherImage'];
    });
    log(vari.toString());
  }
   void getTeacherClass() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolId)
        .collection("Classes")
        .doc(widget.classID)
        .get();
    setState(() {
      teacherClass = vari.data()!['className'];
   
    });
    log(vari.toString());
  }
}
