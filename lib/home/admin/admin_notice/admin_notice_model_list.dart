import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/model/admin_notice/admin_notice_model.dart';
import 'package:flutter/material.dart';

import 'admin_notice.dart';

class AdminNoticeModelList extends StatelessWidget {
  const AdminNoticeModelList({
    super.key,
    required this.schoolId,
    required this.fromPage,
  });
  final String schoolId;
  final String fromPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('SchoolListCollection')
              .doc(schoolId)
              .collection('adminNotice')
              .where(fromPage, isEqualTo: true)
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
                          return ViewNoticeStd(
                            adminNoticeModel: AdminNoticeModel.fromJson(
                                snapshot.data!.docs[index].data()),
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
