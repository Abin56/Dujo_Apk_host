import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/get_schoolList/dropdown-schoolList.dart';
import 'Get_school/get_schooil_dropList.dart';
import 'dujosigning.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenSize.width * 1 / 8,
                        right: screenSize.width * 1 / 40),
                    child: Column(
                      children: [
                        Container(
                          height: screenSize.width * 1 / 7,
                          width: screenSize.width * 1 / 3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/Lepton.png'),
                            ),
                          ),
                        ),
                        Container(
                          height: screenSize.width * 1 / 7,
                          width: screenSize.width * 1 / 3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/dujoo.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Image(image: AssetImage('assets/images/dujo top login.png')),
              Image(image: AssetImage('assets/images/leptondujobg.png'))
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: screenSize.width * 1.14),
              child: Container(
                height: screenSize.width * 1.12,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(29),
                      topRight: Radius.circular(29)),
                  gradient: LinearGradient(
                    colors: [Color(0xFFD40469), Color(0xFF5F005B)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenSize.width * 1 / 5,
                          right: screenSize.width * 1 / 3),
                      child: Text(
                        "Hello...".tr,
                        style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'family_name',
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.width * 1 / 3),
                      child: Container(
                        height: screenSize.width * 1 / 7,
                        width: screenSize.width * 1 / 1.2,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(14)),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.all(9.0),
                            textStyle: const TextStyle(fontSize: 17),
                          ),
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Enter Your School ID'.tr),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        GetSchoolListDropDownButton()
                                      ],
                                      // children: [
                                      //   // TextFormField(
                                      //   //   controller:schoolIdController,
                                      //   // )
                                      // ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('ok'.tr),
                                      onPressed: () async {
                                        selectClass(context);
                                      },
                                    ),
                                    TextButton(
                                      child: Text('cancel'.tr),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text('Login'.tr),
                        ),
                      ),
                    ),
                  ]),
                ),
              )),
        ],
      ),
    ));
  }
}

selectClass(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select your class'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GetClassesForSignUpDropDownButton(
                  schoolID: schoolListValue!["id"]),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('ok'),
            onPressed: () async {
              await Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DujoLogin(
                    schoolID: schoolListValue!["id"],
                    classID: classesListValue!["id"],
                  );
                },
              ));
            },
          ),
        ],
      );
    },
  );
}
