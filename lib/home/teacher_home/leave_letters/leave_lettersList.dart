import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/home/teacher_home/leave_letters/list_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/leave_application/leave_application_model.dart';

class LeaveLettersListviewScreen extends StatelessWidget {
  var schooilID;
  var classID;

  LeaveLettersListviewScreen(
      {required this.schooilID, required this.classID, super.key});

  @override
  Widget build(BuildContext context) {
    int columnCount = 3;
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leave Letters"),
      ),
      body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("SchoolListCollection")
                  .doc(schooilID)
                  .collection("Classes")
                  .doc(classID)
                  .collection("LeaveApplication")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return AnimationLimiter(
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      padding: EdgeInsets.all(_w / 60),
                      crossAxisCount: columnCount,
                      children: List.generate(
                        snapshot.data!.docs.length,
                        (int index) {
                          // ApplyLeveApplicationModel data =
                          //     ApplyLeveApplicationModel.fromMap(
                          //         snapshot.data!.docs[index].data());
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 200),
                            columnCount: columnCount,
                            child: ScaleAnimation(
                              duration: const Duration(milliseconds: 900),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: FadeInAnimation(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(LeaveLettersStudentListsScreen(
                                      schooilID: schooilID,
                                      classID: classID,
                                      date:  snapshot.data!.docs[index].data()['id'],
                                    ));
                                  },
                                  child: Container(
                                    height: _h / 100,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                        bottom: _w / 10,
                                        left: _w / 50,
                                        right: _w / 50),
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(212, 67, 30, 203)
                                              .withOpacity(0.1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 40,
                                          spreadRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        snapshot.data!.docs[index].data()['id'],
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              })),
    );
  }
}
