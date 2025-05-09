import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int status;
  const Failure(this.status, this.message,
      [List properties = const <dynamic>[]]);
}

// General Failures
class ServerFailure extends Failure {
  const ServerFailure({
    required int status,
    required String message,
  }) : super(status, message);
  @override
  List<Object?> get props => [status, message];
}

class CacheFailure extends Failure {
  const CacheFailure({
    required int status,
    required String message,
  }) : super(status, message);
  @override
  List<Object?> get props => [status, message];
}
