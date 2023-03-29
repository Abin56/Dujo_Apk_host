//     final AddExtraDetailsofParentModel = AddExtraDetailsofParentModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../signing/appLoginInterface.dart';

AddExtraDetailsofParentModel AddExtraDetailsofParentModelFromJson(String str) =>
    AddExtraDetailsofParentModel.fromJson(json.decode(str));

String AddExtraDetailsofParentModelToJson(AddExtraDetailsofParentModel data) =>
    json.encode(data.toJson());

class AddExtraDetailsofParentModel {
  AddExtraDetailsofParentModel({
    // required this.id,
    required this.nameofFather,
    required this.nameofMother,
    required this.guardianName,
    required this.houseName,
    required this.place,
    required this.state,
    required this.pincode,
    required this.parentImage,
    required this.fatherImage,
    required this.gender,
    required this.wStudent,
  });

  // String id;
  String nameofFather;
  String nameofMother;
  String guardianName;

  String houseName;
  String place;
  String state;
  String pincode;
  String parentImage;
  String fatherImage;
  String gender;
  String wStudent;

  factory AddExtraDetailsofParentModel.fromJson(Map<String, dynamic> json) =>
      AddExtraDetailsofParentModel(
        // id: json["id"] ?? '',
        place: json["place"] ?? '',
        nameofFather: json["nameofFather"] ?? '',
        nameofMother: json["nameofMother"] ?? '',
        guardianName: json["guardianName"] ?? '',
        houseName: json["houseName"] ?? '',
        state: json["state"] ?? '',
        pincode: json["pincode"] ?? '',
        parentImage: json["parentImage"] ?? '',
        fatherImage: json["fatherImage"] ?? '',
        gender: json["gender"] ?? '',
        wStudent: json["wStudent"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "place": place,
        "nameofMother": nameofMother,
        "nameofFather": nameofFather,
        "state": state,
        "guardianName": guardianName,
        "houseName": houseName,
        "pincode": pincode,
        "parentImage": parentImage,
        "fatherImage": fatherImage,
        "gender": gender,
        "wStudent": wStudent,
      };
}

class AddExtraDetailsofParentToFireBase {
  Future addExtraDetailsofParentController(
      AddExtraDetailsofParentModel productModel,
      context,
      schoolid,
      parentemail) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(schoolid)
          .collection("Students_Parents")
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
              ))
          .then((value) => Get.offAll(OpeningPage()));
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
