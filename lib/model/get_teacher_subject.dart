//     final GetTeacherTeachSubjectModel = GetTeacherTeachSubjectModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';



GetTeacherTeachSubjectModel GetTeacherTeachSubjectModelFromJson(String str) =>
    GetTeacherTeachSubjectModel.fromJson(json.decode(str));

String GetTeacherTeachSubjectModelToJson(GetTeacherTeachSubjectModel data) =>
    json.encode(data.toJson());

class GetTeacherTeachSubjectModel {
  GetTeacherTeachSubjectModel({
    required this.id,
    required this.SubjectName,
    required this.wclass,
    required this.admissionNumber,
    required this.parentName,
    required this.parentPhNo,
    required this.joinDate,
    required this.date,
  });

  String SubjectName;
  String wclass;
  String id;
  String admissionNumber;
  String parentName;
  String parentPhNo;
  String joinDate;
    String date;

  factory GetTeacherTeachSubjectModel.fromJson(Map<String, dynamic> json) =>
      GetTeacherTeachSubjectModel(
        id: json["id"] ?? '',
        SubjectName: json["SubjectName"] ?? '',
        wclass: json["wclass"] ?? '',
        joinDate: json["joinDate"] ?? '',
        admissionNumber: json["admissionNumber"] ?? '',
        parentName: json["parentName"] ?? '',
        parentPhNo: json["parentPhNo"] ?? '',
                date: json["date"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "SubjectName": SubjectName,
        "wclass": wclass,
        "admissionNumber": admissionNumber,
        "parentName": parentName,
        "parentPhNo": parentPhNo,
        "joinDate": joinDate,
         "date": date,
      };
}
