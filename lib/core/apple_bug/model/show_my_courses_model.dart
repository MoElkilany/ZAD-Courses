import 'package:flutter/foundation.dart';

class ShowMyCoursesModel {
  final bool success;
  final DataInfo data;
  factory ShowMyCoursesModel.fromJson(Map<String, dynamic> json) {
    return ShowMyCoursesModel(
      success: json['success'],
      data: DataInfo.fromJson(json['data']),
    );
  }
  ShowMyCoursesModel({required this.success, required this.data});
}

class DataInfo {
  final int showMyCourses;
  factory DataInfo.fromJson(Map<String, dynamic> json) {
    return DataInfo(showMyCourses: json['app_purchases']);
  }
  DataInfo({required this.showMyCourses});
}
