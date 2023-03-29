import 'package:dujo_application/home/common_teacher/common_teacher/project_teacher.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../guardian_home/guardian_home_screen.dart';
import '../../parent_home/parent_home_screen.dart';
import '../../student_home/Students_sections/constants.dart';
import 'assignment_teacher.dart';

class CommonTeacherSubject extends StatefulWidget {
  const CommonTeacherSubject({super.key});

  @override
  State<CommonTeacherSubject> createState() => _CommonTeacherSubjectState();
}

class _CommonTeacherSubjectState extends State<CommonTeacherSubject> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
           Padding(
              padding:  EdgeInsets.only(top: screenSize.width*1/13,bottom:  screenSize.width*1/18),
              child: Container(
                width: 100.w,
                decoration: BoxDecoration(
                  color: kOtherColor,
                  borderRadius: kTopBorderRadius,
                ),
                child: SingleChildScrollView(
                  //for padding
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            onPress: () {},
                            icon: 'assets/icons/Exams.svg',
                            title: 'Exams',
                          ),
                         
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            onPress: () {},
                            icon: 'assets/icons/homework.svg',
                            title: 'HomeWork',
                          ),
                           HomeCard(
                            onPress: () {},
                            icon: 'assets/icons/result.svg',
                            title: 'Result',
                          ),
                        ],
                      ),
                    
                     
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          
                           HomeCard(
                            onPress: () {
                              Navigator.push(context,
                              MaterialPageRoute( builder:
                              (context) => TeacherProject()),);
                            },
                            icon: 'assets/icons/project.svg',
                            title: 'Projects',
                          ),
                           HomeCard(
                            onPress: () {
                               
                            },
                            icon: 'assets/icons/materials.svg',
                            title: 'Study \n Materials',
                          ),
                        ],
                      ),
                     
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           HomeCard(
                            onPress: () {},
                            icon: 'assets/icons/class.svg',
                            title: 'Special \n Classes',
                          ),
                           HomeCard(
                            onPress: () {
                               Navigator.push(context,
                               MaterialPageRoute( builder:
                               (context) =>  TeacherAssignments()),);
                            },
                            icon: 'assets/icons/assignment.svg',
                            title: 'Assignments',
                          ),
                        ],
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