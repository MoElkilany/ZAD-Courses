import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../core/config/endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../di/external_services.dart';
import '../../../app_parent/presentation/providers/app_parent_states.dart';
import '../../domain/entities/favourited.dart';
import '../../domain/entities/purchase.dart';
import '../models/course_model.dart';
import '../models/favourited_course_model.dart';
import '../models/purchased_course_model.dart';

/// Provider for CourseRemoteDataSource
final courseRemoteDataSource = Provider<CourseRemoteDataSource>((ref) {
  final dio = ref.read(ExternalServices.dio);
  return CourseRemoteDataSourceImpl(dio, ref: ref);
});

/// Abstract class for CourseRemoteDataSource
abstract class CourseRemoteDataSource {
  Future<CourseModel> getCourse(int courseId);
  Future<List<PurchasedCourse>> getPurchasedCourses();
  Future<List<FavouritedCourse>> getFavouritedCourses();
  Future<bool> toggleFavourite(int id);
  Future<String> getSessionDetails(int sessionId);
}

/// Implementation of CourseRemoteDataSource
class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  CourseRemoteDataSourceImpl(this._dio, {required this.ref});
  final Dio _dio;
  final ProviderRef ref;

  /// Get course by courseId and userId
  @override
  Future<CourseModel> getCourse(int courseId) async {
    // await Future.delayed(const Duration(seconds: 2));
    // return CoursesMocks.mCourse;

    try {
      final res = await _dio.get(Endpoints.course + courseId.toString());

      if (res.statusCode == 200) {
        if (res.data['success'] == false) {
          throw ServerException(status: 500, message: "Internal Server Error");
        }
        final data = res.data['data'][0] as Map<String, dynamic>;
        final courseModel = CourseModel.fromJson(data);
        return courseModel;
      } else if (res.statusCode == 404) {
        throw ServerException(status: 404, message: "endpoint not found");
      } else if (res.statusCode == 500) {
        throw ServerException(status: 500, message: "Internal Server Error");
      } else if (res.statusCode == 403) {
        throw ServerException(status: 403, message: "Forbidden Access");
      } else if (res.statusCode == 401) {
        throw ServerException(status: 403, message: "Unauthorized Access");
      } else {
        throw ServerException(status: 999, message: "connection unkown error");
      }
    } catch (e) {
      throw ServerException(status: 500, message: "Couldn't connect to server");
    }
  }

  /// Get courses by user access token
  @override
  Future<List<PurchasedCourse>> getPurchasedCourses() async {
    // throw ServerException(status: 404, message: "endpoint not found");
    // await Future.delayed(const Duration(seconds: 2));
    // return CoursesMocks.mpurchasedCourse;

    try {
      final res = await _dio.get(ref.read(AppParentStates.appUserInfo)!.isTeacher() ? Endpoints.myClassesTeacher : Endpoints.purchases);
      if (res.statusCode == 200) {
        if (res.data['success'] == false) {
          throw ServerException(status: 500, message: "Internal Server Error");
        }
        final data = ref.read(AppParentStates.appUserInfo)!.isTeacher()
            ? res.data['my_classes'] as List<dynamic>
            : res.data['data']['courses'] as List<dynamic>;
        //remove all nulls from data
        data.removeWhere((element) => element == null);
        //for each "purchased_course" in data, add it to a list of purchased courses
        log(data.toString());
        final purchasedCourses = data.map((e) => PurchasedCourseModel.fromJson(e as Map<String, dynamic>)).toList(growable: false);
        return purchasedCourses;
      } else if (res.statusCode == 404) {
        throw ServerException(status: 404, message: "endpoint not found");
      } else if (res.statusCode == 500) {
        throw ServerException(status: 500, message: "Internal Server Error");
      } else if (res.statusCode == 403) {
        throw ServerException(status: 403, message: "Forbidden Access");
      } else if (res.statusCode == 401) {
        throw ServerException(status: 403, message: "Unauthorized Access");
      } else {
        throw ServerException(status: 999, message: "connection unkown error");
      }
    } catch (e) {
      throw ServerException(status: 500, message: "Couldn't connect to server");
    }
  }

  /// Get courses by user access token
  @override
  Future<List<FavouritedCourse>> getFavouritedCourses() async {
    // throw ServerException(status: 404, message: "endpoint not found");
    // await Future.delayed(const Duration(seconds: 2));
    // return CoursesMocks.mpurchasedCourse;

    try {
      final res = await _dio.get(Endpoints.favourites);

      if (res.statusCode == 200) {
        if (res.data['success'] == false) {
          throw ServerException(status: 500, message: "Internal Server Error");
        }
        final data = res.data['data']['favorites'] as List<dynamic>;
        //for each "purchased_course" in data, add it to a list of purchased courses
        final favCourses = data.map((e) => FavouritedCourseModel.fromJson(e['course'] as Map<String, dynamic>)).toList(growable: false);
        // log(favCourses.toString());
        return favCourses;
      } else if (res.statusCode == 404) {
        throw ServerException(status: 404, message: "endpoint not found");
      } else if (res.statusCode == 500) {
        throw ServerException(status: 500, message: "Internal Server Error");
      } else if (res.statusCode == 403) {
        throw ServerException(status: 403, message: "Forbidden Access");
      } else if (res.statusCode == 401) {
        throw ServerException(status: 403, message: "Unauthorized Access");
      } else {
        throw ServerException(status: 999, message: "connection unkown error");
      }
    } catch (e) {
      throw ServerException(status: 500, message: "Couldn't connect to server");
    }
  }

  /// Get course by courseId and userId
  @override
  Future<bool> toggleFavourite(int id) async {
    // await Future.delayed(const Duration(seconds: 2));
    // return true;

    try {
      final res = await _dio.post(Endpoints.toggleFav + id.toString());

      if (res.statusCode == 200) {
        // log(res.data.toString());
        if (res.data['success'] == false) {
          throw ServerException(status: 500, message: "Internal Server Error");
        }
        return true;
      } else if (res.statusCode == 404) {
        throw ServerException(status: 404, message: "endpoint not found");
      } else if (res.statusCode == 500) {
        throw ServerException(status: 500, message: "Internal Server Error");
      } else if (res.statusCode == 403) {
        throw ServerException(status: 403, message: "Forbidden Access");
      } else if (res.statusCode == 401) {
        throw ServerException(status: 403, message: "Unauthorized Access");
      } else {
        throw ServerException(status: 999, message: "connection unkown error");
      }
    } catch (e) {
      throw ServerException(status: 500, message: "Couldn't connect to server");
    }
  }

  /// Get course by courseId and userId
  @override
  Future<String> getSessionDetails(int id) async {
    try {
      // //form data body of id
      // final data = FormData.fromMap({
      //   'id': id,
      // });
      final res = await _dio.get(
        '${Endpoints.sessionDetails}/${id.toString()}',
      );

      if (res.statusCode == 200) {
        return res.data.toString();
        // return SessionDetailsModel.fromJson(
        //   res.data['data']['data'] as Map<String, dynamic>,
        // );
      } else if (res.statusCode == 404) {
        throw ServerException(status: 404, message: "endpoint not found");
      } else if (res.statusCode == 500) {
        throw ServerException(status: 500, message: "Internal Server Error");
      } else if (res.statusCode == 403) {
        throw ServerException(status: 403, message: "Forbidden Access");
      } else if (res.statusCode == 401) {
        throw ServerException(status: 403, message: "Unauthorized Access");
      } else {
        throw ServerException(status: 999, message: "connection unkown error");
      }
    } catch (e) {
      throw ServerException(status: 500, message: "Couldn't connect to server");
    }
  }
}
