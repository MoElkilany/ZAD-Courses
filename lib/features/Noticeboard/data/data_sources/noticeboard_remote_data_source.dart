import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/types/app_types.dart';
import '../../../../di/external_services.dart';
import '../models/new_notice_options_model.dart';
import '../models/noticeboard_data_student_model.dart';
import '../models/noticeboard_data_teacher_model.dart';
import '../../domain/entities/new_notice_options.dart';
import '../../domain/entities/noticeboard_data_student.dart';
import '../../domain/entities/noticeboard_data_teacher.dart';

abstract class NoticeboardRemoteDataSource {
  Future<bool> submitNotice(
    String subject,
    String message,
    NoticeType noticeType,
    int? courseId,
  );
  Future<NewNoticeOptions> getNewNoticeOptions();

  //student
  Future<NoticeboardDataStudent> getNoticeboardDataStudent();
  //teacher
  Future<NoticeboardDataTeacher> getNoticeboardDataTeacher();
}

final quizzesRemoteDataSource = Provider<NoticeboardRemoteDataSource>((ref) {
  final dio = ref.read(ExternalServices.dio);
  return NoticeboardRemoteDataSourceImpl(dio);
});

class NoticeboardRemoteDataSourceImpl implements NoticeboardRemoteDataSource {
  NoticeboardRemoteDataSourceImpl(this._dio);
  final Dio _dio;

  @override
  Future<bool> submitNotice(
    String subject,
    String message,
    NoticeType noticeType,
    int? courseId,
  ) async {
    try {
      final data = FormData.fromMap({
        "title": subject,
        "message": message,
        "type": noticeType == NoticeType.general ? 'general' : 'course',
        if (noticeType == NoticeType.course) "course_id": courseId,
      });
      // log('$data\n${data.fields}\n${data.files.map((e) => '${e.value.filename}')}');
      // return true;
      final res = await _dio.post(Endpoints.postNotice, data: data);

      // log('${res.statusCode}\n${res.data}');

      if (res.statusCode == 200) {
        return res.data['code'] == 200;
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

  @override
  Future<NewNoticeOptions> getNewNoticeOptions() async {
    // await Future.delayed(const Duration(seconds: 2));
    // return SupportMocks.newTicketOptions;
    try {
      final res = await _dio.get(Endpoints.newNotice);
      if (res.statusCode == 200) {
        if (res.data['success'] == false) {
          throw ServerException(status: 500, message: "Couldn't connect to server");
        }
        return NewNoticeOptionsModel.fromJson(res.data['data']);
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

  @override
  Future<NoticeboardDataStudent> getNoticeboardDataStudent() async {
    try {
      final res = await _dio.get(Endpoints.allNoticeboard);
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        final noticeboardModel = NoticeboardDataStudentModel.fromJson(data['data']);

        return noticeboardModel;
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

  @override
  Future<NoticeboardDataTeacher> getNoticeboardDataTeacher() async {
    try {
      final res = await _dio.get(Endpoints.allNoticeboard);
      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['success'] == false) {
          throw ServerException(status: 404, message: "endpoint not found");
        }
        final noticeboardModel = NoticeboardDataTeacherModel.fromJson(data['data']);

        return noticeboardModel;
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
