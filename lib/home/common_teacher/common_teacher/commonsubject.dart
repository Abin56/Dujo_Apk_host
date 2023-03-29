import 'package:flutter/material.dart';

import '../../student_home/Students_sections/constants.dart';
import 'common_tea_sub.dart';


class SubjectsCommon extends StatefulWidget {
  const SubjectsCommon({super.key});

  @override
  State<SubjectsCommon> createState() => _SubjectsCommonState();
}

class _SubjectsCommonState extends State<SubjectsCommon> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(actions: [
        Title(
          color: Colors.black,
           child: Text('Subjects'))]),
     body: 
     InkWell(onTap: () {
      Navigator.push(context,
      MaterialPageRoute( builder: 
      
      (context) =>  CommonTeacherSubject()),);

     },
       child: Padding(
         padding: EdgeInsets.only(top:screenSize.width*1/8,
         left: screenSize.width*1/12,
         right: screenSize.width*1/12),
         child: Container(
          height: screenSize.width*0.5,
          width: screenSize.width*1,
          decoration: BoxDecoration(
            color: knewColor,
            borderRadius: 
            BorderRadius.circular(25)),
          child: Center(child: Text('ENGLISH',
          style: TextStyle(fontSize: 18,
          color: Colors.white ),)),
         ),
       ),
     ),
    );
  }
}