import 'package:dartz/dartz.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../di/authentication.dart';

part 'logout.g.dart';

@riverpod
Future<Either<Failure, void>> logout(
  Ref ref,
) async {
  final logout = ref.read(AuthenticationDI.logout);
  final res = await logout(NoParameters());
  return res;
}
