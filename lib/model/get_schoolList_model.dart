//     final GetSchoolListFectingModel = GetSchoolListFectingModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

GetSchoolListFectingModel GetSchoolListFectingModelFromJson(String str) =>
    GetSchoolListFectingModel.fromJson(json.decode(str));

String GetSchoolListFectingModelToJson(GetSchoolListFectingModel data) =>
    json.encode(data.toJson());

class GetSchoolListFectingModel {
  GetSchoolListFectingModel({
    required this.id,
    required this.schoolName,
    required this.schoolAdmin,
  
  });

  String id;
  String schoolName;
  String schoolAdmin;
 

  factory GetSchoolListFectingModel.fromJson(Map<String, dynamic> json) =>
      GetSchoolListFectingModel(
        id: json["id"] ?? '',
        schoolName: json["schoolName"] ?? '',
        schoolAdmin: json["schoolAdmin"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "schoolName": schoolName,
        "schoolAdmin": schoolAdmin,
    
      };
}
