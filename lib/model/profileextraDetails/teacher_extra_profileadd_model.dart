//     final AddExtraDetailsofTeacherModel = AddExtraDetailsofTeacherModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../signing/appLoginInterface.dart';

AddExtraDetailsofTeacherModel AddExtraDetailsofTeacherModelFromJson(
        String str) =>
    AddExtraDetailsofTeacherModel.fromJson(json.decode(str));

String AddExtraDetailsofTeacherModelToJson(
        AddExtraDetailsofTeacherModel data) =>
    json.encode(data.toJson());

class AddExtraDetailsofTeacherModel {
  AddExtraDetailsofTeacherModel({
    // required this.id,
    required this.houseName,
    required this.houseNumber,
    required this.place,
    required this.district,
    required this.state,
    required this.pincode,
    required this.bloodGroup,
    required this.teacherImage,
  });

  // String id;
  String houseName;
  String houseNumber;
  String place;
  String district;
  String state;
  String pincode;
  String bloodGroup;
  String teacherImage;

  factory AddExtraDetailsofTeacherModel.fromJson(Map<String, dynamic> json) =>
      AddExtraDetailsofTeacherModel(
        // id: json["id"] ?? '',
        pincode: json["pincode"] ?? '',
        houseName: json["houseName"] ?? '',
        houseNumber: json["houseNumber"] ?? '',
        place: json["place"] ?? '',
        district: json["district"] ?? '',
        state: json["state"] ?? '',
        bloodGroup: json["bloodGroup"] ?? '',
        teacherImage: json["teacherImage"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "houseNumber": houseNumber,
        "houseName": houseName,
        "bloodGroup": bloodGroup,
        "place": place,
        "district": district,
        "state": pincode,
        "teacherImage": teacherImage,
      };
}

class AddExtraDetailsofTeacherToFireBase {
  Future addExtraDetailsofTeachersController(
      AddExtraDetailsofTeacherModel productModel,
      context,
      schoolid,
      teacheremail) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(schoolid)
          .collection("Teachers")
          .doc(teacheremail)
          .set(productModel.toJson(), SetOptions(merge: true))
          .then((value) => showDialog(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Message'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Records Updated'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              ))
          .then((value) => Get.offAll(OpeningPage()));
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
