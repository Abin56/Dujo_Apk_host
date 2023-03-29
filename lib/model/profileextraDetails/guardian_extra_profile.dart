//     final AddExtraDetailsofGuardianModel = AddExtraDetailsofGuardianModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../signing/appLoginInterface.dart';

AddExtraDetailsofGuardianModel AddExtraDetailsofGuardianModelFromJson(
        String str) =>
    AddExtraDetailsofGuardianModel.fromJson(json.decode(str));

String AddExtraDetailsofGuardianModelToJson(
        AddExtraDetailsofGuardianModel data) =>
    json.encode(data.toJson());

class AddExtraDetailsofGuardianModel {
  AddExtraDetailsofGuardianModel({
    // required this.id,

    required this.houseName,
    required this.place,
    required this.state,
    required this.pincode,
    required this.guardianImage,
    required this.gender,
    required this.wStudent,
  });

  // String id;
  String wStudent;
  String houseName;
  String place;
  String state;
  String pincode;
  String guardianImage;
  String gender;

  factory AddExtraDetailsofGuardianModel.fromJson(Map<String, dynamic> json) =>
      AddExtraDetailsofGuardianModel(
        // id: json["id"] ?? '',
        place: json["place"] ?? '',

        houseName: json["houseName"] ?? '',
        state: json["state"] ?? '',
        pincode: json["pincode"] ?? '',
        guardianImage: json["guardianImage"] ?? '',
        gender: json["gender"] ?? '',
        wStudent: json["wStudent"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "place": place,
        "state": state,
        "houseName": houseName,
        "pincode": pincode,
        "guardianImage": guardianImage,
        "gender": gender,
        "wStudent": wStudent,
      };
}

class AddExtraDetailsofGuardianToFireBase {
  Future addExtraDetailsofGuardianController(
      AddExtraDetailsofGuardianModel productModel,
      context,
      schoolid,
      parentemail) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(schoolid)
          .collection("Student_Guardian")
          .doc(parentemail)
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
              ),
              )
          .then((value) => Get.offAll(OpeningPage()));
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
