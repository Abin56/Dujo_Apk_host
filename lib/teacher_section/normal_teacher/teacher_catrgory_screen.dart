import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/button_container.dart';

class TeacherCategoryScreen extends StatelessWidget {
  const TeacherCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
            
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Teachers",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: () {
               
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 5,
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Class Teachers",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Get.to(const PreviousStudentCourseList());
            //   },
            //   child: ButtonContainerWidget(
            //     curving: 30,
            //     colorindex: 3,
            //     height: 150,
            //     width: double.infinity,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         Text(
            //           "Previous Students",
            //           style: GoogleFonts.montserrat(
            //               color: Colors.white,
            //               fontSize: 23,
            //               fontWeight: FontWeight.w700),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}