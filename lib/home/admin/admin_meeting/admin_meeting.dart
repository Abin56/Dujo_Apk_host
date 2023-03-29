import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/admin_meeting/admin_meeting_model.dart';


class ViewMeetingStd extends StatefulWidget {
  const ViewMeetingStd({super.key, required this.adminMeetingModel});
  final AdminMeetingModel adminMeetingModel;

  @override
  State<ViewMeetingStd> createState() => _ViewMeetingStdState();
}

class _ViewMeetingStdState extends State<ViewMeetingStd> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Meeting'.tr),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenSize.width * 1 / 10,
                left: screenSize.width * 1 / 30,
                right: screenSize.width * 1 / 30),
            child: Container(
              height: screenSize.width * 0.9,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 7, 65, 255),
                    blurRadius: 25.0,
                  ),
                ],
                color: Colors.blue,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: screenSize.width * 0.6, top: 20),
                      child: Text(
                        widget.adminMeetingModel.date.tr,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 255, 255, 254)),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          left: screenSize.width * 0.03, top: 35),
                      child: Text(
                        widget.adminMeetingModel.heading.tr,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 255, 255, 254)),
                      ),
                    ),
                    // SizedBox(height:screenSize.width*1/4,),

                    SizedBox(
                      height: screenSize.width * 1 / 15,
                    ),

                    Text(
                      'Category of meeting : ${widget.adminMeetingModel.categoryOfMeeting}'
                          .tr,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 254)),
                    ),
                    SizedBox(
                      height: screenSize.width * 1 / 25,
                    ),

                    Text(
                      'Members to be Expected : ${widget.adminMeetingModel.membersToBeExpected}'
                          .tr,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 254)),
                    ),
                    SizedBox(
                      height: screenSize.width * 1 / 25,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: screenSize.width / 30),
                      child: Text(
                        "Special Guest : ${widget.adminMeetingModel.specialGuest}"
                            .tr,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 255, 255, 254)),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.width * 1 / 25,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: screenSize.width / 30),
                      child: Text(
                        'Time  : ${widget.adminMeetingModel.time}'.tr,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 255, 255, 254)),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.width * 1 / 25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenSize.width / 30),
                      child: Text(
                        'Venue  : ${widget.adminMeetingModel.venue}'.tr,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 255, 255, 254)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
