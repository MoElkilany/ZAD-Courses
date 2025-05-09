import 'package:dartz/dartz.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../di/authentication.dart';
import '../../domain/entities/register/register_request.dart';
import '../../domain/entities/register/register_response.dart';

part 'register.g.dart';

@riverpod
Future<Either<Failure, RegisterResponse>> register(
  Ref ref, {
  required RegisterRequest registerRequest,
}) async {
  final register = ref.read(AuthenticationDI.register);
  final res = await register(registerRequest);
  return res;
}
