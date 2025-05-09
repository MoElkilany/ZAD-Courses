import 'package:dartz/dartz.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../di/support.dart';
import '../../domain/entities/academic_support_history.dart';
import '../../domain/entities/platform_support_history.dart';
import 'academicProviders/academic_manager.dart';
import 'platformProviders/platform_manager.dart';

part 'support_history.g.dart';

@Riverpod(keepAlive: true)
Future<Either<Failure, AcademicSupportHistory>> getAcademicSupportHistory(
  Ref ref,
) async {
  final getAcademicSupportHistory = ref.read(SupportDI.getAcademicSupportHistory);
  // log('attempting to get academic support history 1 ');
  final res = await getAcademicSupportHistory(NoParameters());
  final academicManager = ref.watch(academicManagerProvider.notifier);
  final data = res.fold((l) => null, (r) => r);
  if (data != null) {
    academicManager.setAllTickets(data.academicTickets);
    academicManager.initFilteredTickets(data.academicTickets);
  }
  return res;
}

@Riverpod(keepAlive: true)
Future<Either<Failure, PlatformSupportHistory>> getPlatformSupportHistory(
  Ref ref,
) async {
  final getPlatformSupportHistory = ref.read(SupportDI.getPlatformSupportHistory);
  final res = await getPlatformSupportHistory(NoParameters());
  final platformManager = ref.watch(platformManagerProvider.notifier);
  final data = res.fold((l) => null, (r) => r);
  if (data != null) {
    platformManager.setAllTickets(data.platformTickets);
    platformManager.initFilteredTickets(data.platformTickets);
  }
  return res;
}
