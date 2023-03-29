import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../model/get_class_wise_subject.dart';

class ClassWiseSubject extends StatefulWidget {
  var schoolID;
  var classID;
  var teacherID;
  ClassWiseSubject(
      {required this.schoolID,
      required this.classID,
      required this.teacherID,
      super.key});

  @override
  State<ClassWiseSubject> createState() => _ClassWiseSubjectState();
}

class _ClassWiseSubjectState extends State<ClassWiseSubject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class subjects'),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("SchoolListCollection")
              .doc(widget.schoolID)
              .collection("Classes")
              .doc(widget.classID)
              .collection("Subjects")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.maxFinite,
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = GetClassWiseSubjectModel.fromJson(
                              snapshot.data!.docs[index].data());

                          return GestureDetector(
                            onTap: () async {
                        
                         
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              color: Colors.amber,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(data.subject),
                                    TextButton.icon(onPressed: ()async{
                                  //     var listofsubject=[];   
                                  //       FirebaseFirestore.instance
                                  // .collection("SchoolListCollection")
                                  // .doc(widget.schoolID)
                                  // .collection("Teachers")
                                  // .doc(widget.teacherID)
                                  // .set(
                                  //   listofsubject.add({
                                  //     'subject$index':data.id,
                                  //   })
                                  // ,SetOptions(merge: true));
                                  }, icon: Icon(Icons.add), label: Text('add')),
                                       TextButton.icon(onPressed: ()async{
                                  //     var listofsubject=[];   
                                  //       FirebaseFirestore.instance
                                  // .collection("SchoolListCollection")
                                  // .doc(widget.schoolID)
                                  // .collection("Teachers")
                                  // .doc(widget.teacherID)
                                  // .set(
                                  //   listofsubject.add({
                                  //     'subject$index':data.id,
                                  //   })
                                  // ,SetOptions(merge: true));
                                  }, icon: Icon(Icons.delete), label: Text('remove'))
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: snapshot.data!.docs.length),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
