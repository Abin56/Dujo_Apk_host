import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../signing/dujosigning.dart';

class CollegeParentHome extends StatelessWidget {
  const CollegeParentHome({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('College Parent Home Page'.tr),
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
                          margin:
                              EdgeInsets.only(top: screenSize.width * 1 / 12),
                          width: screenSize.width / 3,
                          child: Divider(
                            color: Colors.red,
                            thickness: 3,
                          )),
                      Padding(
                        padding:
                            EdgeInsets.only(top: screenSize.width * 1 / 12),
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
                          margin:
                              EdgeInsets.only(top: screenSize.width * 1 / 12),
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
                      borderRadius: BorderRadius.all(Radius.circular(30)),
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
                                            "Time Table".tr,
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
                                            "Teachers".tr,
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
                                            "Subjects".tr,
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
                                            "Tests".tr,
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
                                            "Projects".tr,
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
                                            "Assignments".tr,
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
                                            "Events".tr,
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
                                            "Progress Reports".tr,
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
                                            "Notices".tr,
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
                                            "Recorded Classes".tr,
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
                                            "Live classes".tr,
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
                                            "Attendence".tr,
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
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
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
                                              "Name".tr,
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
                              padding: const EdgeInsets.only(left: 20),
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
                                              "Class".tr,
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
           Container(
                  height: screenSize.width * 1 / 7,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DujoLogin()),
                      );
                    },
                    child:  Text('Logout'.tr),
                  ),
                ),
        ]),
      ),
    );
  }
}
