// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dujo_application/model/progress_report/progress_report_model.dart';
// import 'package:dujo_application/widget/progress_report_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';

// class SamplePage extends StatelessWidget {
//   const SamplePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection("SchoolListCollection")
//               .doc('mthssCheng16767')
//               .collection("Classes")
//               .doc("class1@mthss")
//               .collection("Students")
//               .doc("mthssCheng16767")
//               .collection("StudentProgressReport")
//               .doc('mthssCheng16767')
//               .snapshots(),
//           builder: (context,snapshot) {
//             // log(snapshot.data!.data().toString());
//             UploadProgressReportModel data =
//                 UploadProgressReportModel.fromMap(snapshot.data!.data()!);
//             return GestureDetector(
//               onTap: () {
//                 Get.to(InvoiceScreen(
//                     customerName: '',
//                     email: '',
//                     inVoiceNumber: 0,
//                     price: 0,
//                     purchasingModel: ''));
//               },
//               child: Container(
//                 child: ListView.separated(
//                   itemBuilder: (context,Index) {
//                     return Text(data.reports[Index].subject);
//                   },
//                   separatorBuilder: (context, index) {
//                     return Divider();
//                   },
//                   itemCount: data.reports.length,
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }
