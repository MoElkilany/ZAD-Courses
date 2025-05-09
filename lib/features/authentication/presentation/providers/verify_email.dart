import 'package:dartz/dartz.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../di/authentication.dart';
import '../../domain/entities/verification/verification_request.dart';
import '../../domain/entities/verification/verification_response.dart';

part 'verify_email.g.dart';

@riverpod
Future<Either<Failure, VerificationResponse>> verifyEmail(
  Ref ref, {
  required VerificationRequest verificationRequest,
}) async {
  final verifyEmail = ref.read(AuthenticationDI.verfiyEmail);
  final res = await verifyEmail(verificationRequest);
  return res;
}
