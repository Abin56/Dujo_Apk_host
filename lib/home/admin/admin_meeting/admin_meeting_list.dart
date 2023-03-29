import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../model/admin_meeting/admin_meeting_model.dart';
import 'admin_meeting.dart';

class AdminMeetingModelList extends StatelessWidget {
  const AdminMeetingModelList({super.key, required this.schoolId,required this.fromPage});
  final String schoolId;
  final String fromPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('SchoolListCollection')
              .doc(schoolId)
              .collection('AdminMeeting').where(fromPage,isEqualTo: true)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          '${snapshot.data!.docs[index].data()["heading"]}'),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ViewMeetingStd(
                            adminMeetingModel: AdminMeetingModel.fromJson(
                              snapshot.data!.docs[index].data(),
                            ),
                          );
                        }));
                      },
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
