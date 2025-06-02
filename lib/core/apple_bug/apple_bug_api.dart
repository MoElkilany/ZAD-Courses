// This API is only used to bypass the Apple Store upload issue.

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:zad_test/core/apple_bug/model/show_my_courses_model.dart';

int visibleMyCourse = -1;

class AppleBugApi {
  static Future<void> showMyCourses(String token) async {
    String url = 'https://zadcourses.com/api/development/panel/app-purchases';
    try {
      var result = await Dio().get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      ShowMyCoursesModel data = ShowMyCoursesModel.fromJson(result.data);
      visibleMyCourse = data.data.showMyCourses;
      log("result is ${result.data}");
    } catch (e) {
      throw Exception(e);
    }
  }
}
