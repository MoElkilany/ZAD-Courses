import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../../../di/courses.dart';

part 'zoom_provider.g.dart';

/// A Riverpod provider that manages the Course id of the current course being
/// viewed in learning page.
@Riverpod(keepAlive: true)
class SessionId extends _$SessionId {
  /// Overrides the default build method of the provider.
  /// Returns null as this provider does not have a UI representation.
  @override
  int? build() {
    return null;
  }

  /// Sets the current course id to the provided [id].
  void setId(int id) {
    state = id;
  }

  /// Returns the current couse id.
  get sessionId => state;
}

@riverpod
Future<Either<Failure, String>> sessionDetails(
  SessionDetailsRef ref,
) async {
  final sessionId = ref.read(sessionIdProvider);
  if (sessionId == null) {
    return Left(ServerFailure(
      status: 500,
      message: 'errors.serverError'.tr(),
    ));
  }
  final courseRepo = ref.read(CoursesDI.courseRepository);
  return await courseRepo.getSessionDetails(sessionId);
}
