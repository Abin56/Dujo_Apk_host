import 'dart:convert';

import 'package:dujo_application/model/profileextraDetails/teacher_extra_profileadd_model.dart';
import 'package:flutter/foundation.dart';

class ListofSubjects {
  List<AddExtraDetailsofTeacherModel> listofSubjects;
  ListofSubjects({
    required this.listofSubjects,
  });

  ListofSubjects copyWith({
    List<AddExtraDetailsofTeacherModel>? listofSubjects,
  }) {
    return ListofSubjects(
      listofSubjects: listofSubjects ?? this.listofSubjects,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listofSubjects': listofSubjects.map((x) => x.toJson()).toList(),
    };
  }

  factory ListofSubjects.fromMap(Map<String, dynamic> map) {
    return ListofSubjects(
      listofSubjects: List<AddExtraDetailsofTeacherModel>.from(
        (map['listofSubjects'] as List<dynamic>).map<AddExtraDetailsofTeacherModel>(
          (x) => AddExtraDetailsofTeacherModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListofSubjects.fromJson(String source) =>
      ListofSubjects.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ListofSubjects(listofSubjects: $listofSubjects)';

  @override
  bool operator ==(covariant ListofSubjects other) {
    if (identical(this, other)) return true;

    return listEquals(other.listofSubjects, listofSubjects);
  }

  @override
  int get hashCode => listofSubjects.hashCode;
}


class ListOfClasses {
  List<AddExtraDetailsofTeacherModel> listofClasses;
  ListOfClasses({
    required this.listofClasses,
  });

  ListOfClasses copyWith({
    List<AddExtraDetailsofTeacherModel>? listofClasses,
  }) {
    return ListOfClasses(
      listofClasses: listofClasses ?? this.listofClasses,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listofClasses': listofClasses.map((x) => x.toJson()).toList(),
    };
  }

  factory ListOfClasses.fromMap(Map<String, dynamic> map) {
    return ListOfClasses(
      listofClasses: List<AddExtraDetailsofTeacherModel>.from(
        (map['ListOfClasses'] as List<dynamic>).map<AddExtraDetailsofTeacherModel>(
          (x) => AddExtraDetailsofTeacherModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListOfClasses.fromJson(String source) =>
      ListOfClasses.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ListOfClasses(listofClasses: $listofClasses)';

  @override
  bool operator ==(covariant ListOfClasses other) {
    if (identical(this, other)) return true;

    return listEquals(other.listofClasses, listofClasses);
  }

  @override
  int get hashCode => listofClasses.hashCode;
}