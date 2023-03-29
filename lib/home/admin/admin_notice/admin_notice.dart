import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/admin_notice/admin_notice_model.dart';

class ViewNoticeStd extends StatefulWidget {
  const ViewNoticeStd({super.key, required this.adminNoticeModel});
  final AdminNoticeModel adminNoticeModel;

  @override
  State<ViewNoticeStd> createState() => _ViewNoticeStdState();
}

class _ViewNoticeStdState extends State<ViewNoticeStd> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notices'.tr),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenSize.width * 1 / 10,
                left: screenSize.width * 1 / 30,
                right: screenSize.width * 1 / 30),
            child: Container(
              height: screenSize.width * 0.8,
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
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.width * 1 / 15,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: screenSize.width * 1 / 2.6),
                          child: Text(
                            'Notice'.tr,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 255, 255, 254)),
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 1 / 5.8,
                        ),
                        Text(
                          widget.adminNoticeModel.publishedDate, //date
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 255, 254)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width * 1 / 25,
                  ),
                  Text(
                    widget.adminNoticeModel.heading.tr, //heading
                    style: const TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 254)),
                  ),
                  SizedBox(
                    height: screenSize.width * 1 / 25,
                  ),
                  widget.adminNoticeModel.customContent.isEmpty
                      ? Padding(
                          padding:
                              EdgeInsets.only(left: screenSize.width * 1 / 15),
                          child: Text(
                            "This is to inform all the students that" +
                                " ${widget.adminNoticeModel.heading}  will be conductod" +
                                " \non ${widget.adminNoticeModel.dateofoccation} at  ${widget.adminNoticeModel.venue} with various cultural programmes.${widget.adminNoticeModel.chiefGuest} will be grace the occasion. Student who would like to occasion in various programme should contact their respective classteacher latest by ${widget.adminNoticeModel.dateOfSubmission} ."
                                    .tr,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 255, 255, 254)),
                          ),
                        )
                      : Padding(
                          padding:
                              EdgeInsets.only(left: screenSize.width * 1 / 15),
                          child: Text(
                            widget.adminNoticeModel.customContent.tr,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 255, 255, 254)),
                          ),
                        ),
                  SizedBox(
                    height: screenSize.width * 1 / 25,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenSize.width * 1 / 1.5),
                    child: Text(
                      'Signature'.tr,
                      style: const TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 255, 255, 254)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenSize.width * 1 / 7,
                left: screenSize.width * 1 / 30,
                right: screenSize.width * 1 / 30,
                bottom: screenSize.width * 1 / 25),
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
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: widget.adminNoticeModel.imageUrl.isEmpty
                    ? const Text('No image found')
                    : Image.network(widget.adminNoticeModel.imageUrl,
                        fit: BoxFit.fill),
              ),
            ),
          )
        ],
      ),
    );
  }
}
