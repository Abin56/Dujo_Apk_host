import 'package:flutter/material.dart';
import 'package:get/get.dart';

const List<Widget> Schools = <Widget>[
  Text('Student'),
  Text('Parent'),
  Text('Teacher')
];

class CollegeParent extends StatefulWidget {
  const CollegeParent({super.key});

  @override
  State<CollegeParent> createState() => _CollegeParentState();
}

class _CollegeParentState extends State<CollegeParent> {
  final List<bool> _selectedSchools = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
                        "Welcome,".tr,
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
                    "Sign Up,".tr,
                    style: TextStyle(
                        fontSize: 35, color: Color.fromARGB(255, 90, 1, 131)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Stack(children: [
          // Container(
          //   height: screenSize.height * 0.5,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: NetworkImage(
          //               "https://storage.googleapis.com/scipro-bucket/dujo%20bckgrnd.jpg"),
          //           fit: BoxFit.cover)),
          // ),
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
                Padding(
                  padding: const EdgeInsets.only(right: 230, top: 20),
                  child: Text(
                    "Sign in As:".tr,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 162, 166),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: ToggleButtons(
                    onPressed: (int index) {
                      setState(() {
                        for (int i = 0; i < _selectedSchools.length; i++) {
                          _selectedSchools[i] = i == index;
                        }
                      });
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(1)),
                    selectedBorderColor: Colors.red[700],
                    selectedColor: Colors.black,
                    fillColor: Colors.white,
                    color: Colors.black,
                    constraints: const BoxConstraints(
                      minHeight: 40.0,
                      minWidth: 100.0,
                    ),
                    isSelected: _selectedSchools,
                    children: Schools,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenSize.width * 1 / 4.8),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  'https://via.placeholder.com/150'),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 70, top: 85),
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: screenSize.width * 1 / 25),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  'https://via.placeholder.com/150'),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 70, top: 85),
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        ],
                      ),
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
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 8,
                          width: screenSize.width * 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Colors.white),
                          child: Center(
                            child: Text(
                              'Name'.tr,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18),
                            ),
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
                            color: Colors.white),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: screenSize.width * 1 / 6.5,
                            width: screenSize.width * 1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                'Admission Number'.tr,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                                "Select School".tr,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18),
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
                              "school 1",
                              "school 2",
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
                                var yourVar = val.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                                "Select Class",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18),
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
                              "Class 1",
                              "Class 2",
                              "Class 3",
                              "Class 4",
                              "Class 5",
                              "Class 6",
                              "Class 7",
                              "Class 8",
                              "Class 9",
                              "Class 10",
                              "Class 11",
                              "Class 12",
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
                                var yourVar = val.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Container(
                              height: screenSize.width * 1 / 8,
                              width: screenSize.width * 1 / 4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                // gradient: LinearGradient(colors: [
                                //   Color.fromARGB(255, 110, 49, 252),
                                //   Color.fromARGB(255, 212, 0, 255)
                                // ]),
                              ),
                              child: TextField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Class',

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
                                    backgroundImage: NetworkImage(
                                        'https://via.placeholder.com/150'),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: screenSize.width * 1 / 6,
                                      top: screenSize.width * 1 / 6,
                                    ),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                      ),
                                      alignment: Alignment.center,
                                    ),
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
                              "MALE",
                              "FEMALE",
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
                                var yourVar = val.toString();
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
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Guardian Name',

                                // prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(19),
                                  borderSide: BorderSide.none,
                                )),
                            style: TextStyle(
                              color: Colors.white,
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
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Address',

                                // prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(19),
                                  borderSide: BorderSide.none,
                                )),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Enter Your Email',

                                // prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                )),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
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
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: ((context) => ParentSchool())));
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
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const DujoLogin()),
                              // );
                            },
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
}
