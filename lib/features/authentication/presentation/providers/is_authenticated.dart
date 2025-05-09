import 'package:dartz/dartz.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../di/authentication.dart';

part 'is_authenticated.g.dart';

@riverpod
Future<Either<Failure, bool>> isAuthenticated(Ref ref) async {
  final isAuthenticated = ref.read(AuthenticationDI.isAuthenticated);
  final res = await isAuthenticated(NoParameters());
  return res;
}
