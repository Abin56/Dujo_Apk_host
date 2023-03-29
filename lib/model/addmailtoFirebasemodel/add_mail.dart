//     final AddUseridandPassModel = AddUseridandPassModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

AddUseridandPassModel AddUseridandPassModelFromJson(String str) =>
    AddUseridandPassModel.fromJson(json.decode(str));

String AddUseridandPassModelToJson(AddUseridandPassModel data) =>
    json.encode(data.toJson());

class AddUseridandPassModel {
  AddUseridandPassModel({
    required this.id,
    required this.userEmail,
    required this.date,
    required this.userPassword,
  });

  String id;
  bool userEmail = true;
  String date;
  String userPassword;

  factory AddUseridandPassModel.fromJson(Map<String, dynamic> json) =>
      AddUseridandPassModel(
        id: json["id"] ?? '',
        userEmail: json["userEmail"] ?? true,
        date: json["date"] ?? '',
        userPassword: json["userPassword"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userEmail": userEmail,
        "date": date,
        "userPassword": userPassword,
      };
}

class AddUserIDandPasswordToFireBase {
  Future addAttendenceStatusController(AddUseridandPassModel productModel, context,
      schoolid, classId, formatter, studentName, studentID) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(schoolid)
          .collection("Classes")
          .doc(classId)
          .collection(classId)
          .doc(studentID)
          .set(productModel.toJson());
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
