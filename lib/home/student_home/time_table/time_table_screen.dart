import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:lepton_dujo/view/Dujo%20Web/subjectdropdown.dart';
import 'package:flutter/services.dart';

class TimeTablePage extends StatefulWidget {
  TimeTablePage(
      {Key? key,
      required this.schoolID,
      required this.classID,
      required this.mon,
      required this.tues,
      required this.wed,
      required this.thurs,
      required this.fri})
      : super(key: key);

  String schoolID;
  String classID;
  DocumentSnapshot<Map<String, dynamic>> mon;
  DocumentSnapshot<Map<String, dynamic>> tues;
  DocumentSnapshot<Map<String, dynamic>> wed;
  DocumentSnapshot<Map<String, dynamic>> thurs;
  DocumentSnapshot<Map<String, dynamic>> fri;

  @override
  State<TimeTablePage> createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  List<String> periodList = [
    'firstPeriod',
    'secondPeriod',
    'thirdPeriod',
    'fourthPeriod',
    'fifthPeriod',
    'sixthPeriod',
    'seventhPeriod'
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              children: [
                Flexible(
                  child: Container(
                    width: screenSize.width / 9,
                    height: screenSize.width / 9,
                    color: Colors.amber[600],
                    child: Center(
                      child: Text(
                        'Day',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: screenSize.width / 9,
                    height: screenSize.width / 9,
                    color: Colors.amber[600],
                    child: Center(
                      child: Text(
                        'Monday',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: screenSize.width / 9,
                    height: screenSize.width / 9,
                    color: Colors.amber[600],
                    child: Center(
                      child: Text(
                        'Tuesday',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: screenSize.width / 9,
                    height: screenSize.width / 9,
                    color: Colors.amber[600],
                    child: Center(
                      child: Text(
                        'Wednesday',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: screenSize.width / 9,
                    height: screenSize.width / 9,
                    color: Colors.amber[600],
                    child: Center(
                      child: Text(
                        'Thursday',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: screenSize.width / 9,
                    height: screenSize.width / 9,
                    color: Colors.amber[600],
                    child: Center(
                      child: Text(
                        'Friday',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //   Flexible(
                      //   child: Container(
                      //     width: screenSize.width/8,
                      //     height: screenSize.width/8,
                      //     color: Colors.amber[600],
                      //     child: Center(
                      //       child: Text(

                      //         (index+1).toString(), style: TextStyle(fontWeight: FontWeight.w600),),
                      //     ),
                      //   ),
                      // ),
                      Flexible(
                        child: Container(
                          width: screenSize.width / 8,
                          height: screenSize.width / 8,
                          color: Colors.amber[600],
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: screenSize.width / 8,
                          height: screenSize.width / 8,
                          color: Colors.amber[600],
                          child: Center(
                            child: Text(widget.mon.data()![(index == 3)
                                ? 'fouthPeriod'
                                : periodList[index]][periodList[index]]),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: screenSize.width / 8,
                          height: screenSize.width / 8,
                          color: Colors.amber[600],
                          child: Center(
                            child: Text(widget.tues.data()![(index == 3)
                                ? 'fouthPeriod'
                                : periodList[index]][periodList[index]]),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: screenSize.width / 8,
                          height: screenSize.width / 8,
                          color: Colors.amber[600],
                          child: Center(
                            child: Text(widget.wed.data()![(index == 3)
                                ? 'fouthPeriod'
                                : periodList[index]][periodList[index]]),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: screenSize.width / 8,
                          height: screenSize.width / 8,
                          color: Colors.amber[600],
                          child: Center(
                            child: Text(widget.thurs.data()![(index == 3)
                                ? 'fouthPeriod'
                                : periodList[index]][periodList[index]]),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: screenSize.width / 8,
                          height: screenSize.width / 8,
                          color: Colors.amber[600],
                          child: Center(
                            child: Text(widget.fri.data()![(index == 3)
                                ? 'fouthPeriod'
                                : periodList[index]][periodList[index]]),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ))),
    );
  }
}
