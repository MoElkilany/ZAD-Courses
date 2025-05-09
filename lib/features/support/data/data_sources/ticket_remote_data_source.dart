import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import '../../../../core/config/endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/types/app_types.dart';
import '../../../../di/external_services.dart';
import '../models/academic_support_history_model.dart';
import '../models/new_ticket_options_model.dart';
import '../models/platform_support_history_model.dart';
import '../../domain/entities/academic_support_history.dart';
import '../../domain/entities/new_ticket_options.dart';
import '../../domain/entities/platform_support_history.dart';

abstract class TicketRemoteDataSource {
  Future<bool> submitTicket(
    String subject,
    String message,
    TicketType ticketType,
    int? courseId,
    int? roleId,
    int? departmentID,
    List<String> attachments,
  );
  Future<NewTicketOptions> getNewTicketOptions();

  Future<AcademicSupportHistory> getAcademicSupportHistory();
  Future<PlatformSupportHistory> getPlatformSupportHistory();
}

final ticketRemoteDataSource = Provider<TicketRemoteDataSource>((ref) {
  final dio = ref.read(ExternalServices.dio);
  return TicketRemoteDataSourceImpl(dio);
});

class TicketRemoteDataSourceImpl implements TicketRemoteDataSource {
  TicketRemoteDataSourceImpl(this._dio);
  final Dio _dio;

  @override
  Future<bool> submitTicket(
    String subject,
    String message,
    TicketType ticketType,
    int? courseId,
    int? roleId,
    int? departmentID,
    List<String> attachments,
  ) async {
    try {
      final data = FormData.fromMap({
        "title": subject,
        "message": message,
        "type": ticketType == TicketType.academic ? 'course_support' : 'platform_support',
        if (ticketType == TicketType.academic) "course_id": courseId,
        if (ticketType == TicketType.academic && roleId != null) "role_id": roleId,
        if (ticketType == TicketType.plataform && departmentID != null) "department_id": departmentID,
        if (attachments.isNotEmpty) "attach": attachments.map((e) => MultipartFile.fromFileSync(e)).toList()
      });
      // log('$data\n${data.fields}\n${data.files.map((e) => '${e.value.filename}')}');
      // return true;
      final res = await _dio.post(Endpoints.submitTicket, data: data);

      // log('${res.statusCode}\n${res.data}');

      if (res.statusCode == 200) {
        return res.data['success'];
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
  Future<NewTicketOptions> getNewTicketOptions() async {
    // await Future.delayed(const Duration(seconds: 2));
    // return SupportMocks.newTicketOptions;
    try {
      final res = await _dio.get(Endpoints.newTicketOptions);
      if (res.statusCode == 200) {
        if (res.data['success'] == false) {
          throw ServerException(status: 500, message: "Couldn't connect to server");
        }
        return NewTicketOptionsModel.fromJson(res.data);
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
  Future<AcademicSupportHistory> getAcademicSupportHistory() async {
    // await Future.delayed(const Duration(seconds: 2));
    // return SupportMocks.academicSupportHistory;
    try {
      final res = await _dio.get(Endpoints.academicSupportHistory);
      if (res.statusCode == 200) {
        if (res.data['success'] == false) {
          throw ServerException(status: 500, message: "Couldn't connect to server");
        }
        return AcademicSupportHistoryModel.fromJson(res.data);
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
  Future<PlatformSupportHistory> getPlatformSupportHistory() async {
    // await Future.delayed(const Duration(seconds: 2));
    // return SupportMocks.platformSupportHistory;
    try {
      final res = await _dio.get(Endpoints.platformSupportHistory);
      if (res.statusCode == 200) {
        if (res.data['success'] == false) {
          throw ServerException(status: 500, message: "Couldn't connect to server");
        }
        return PlatformSupportHistoryModel.fromJson(res.data);
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
