import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../../../di/financial.dart';
import '../../domain/entities/financial_data_student.dart';
import '../../domain/entities/financial_data_teacher.dart';
import '../../../financial/presentation/providers/financial_lists_manager.dart';

part 'financial_data.g.dart';

@riverpod
Future<Either<Failure, FinancialDataStudent>> getFinancialDataStudent(
  Ref ref,
) async {
  final financialDataRepo = ref.read(FinancialDI.financialRepository);
  final res = await financialDataRepo.getFinancialDataStudent();
  if (res.isRight()) {
    final docs = res.getOrElse(() => throw Exception()).finDocs;
    //sort docs by date created, newest first
    docs.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    ref.watch(financialListManagerProvider.notifier).setAllDocuments(docs);
    ref.watch(financialListManagerProvider.notifier).initFilteredDocuments(docs);
  }
  return res;
}

@riverpod
Future<Either<Failure, FinancialDataTeacher>> getFinancialDataTeacher(
  Ref ref,
) async {
  final financialDataRepo = ref.read(FinancialDI.financialRepository);
  final res = await financialDataRepo.getFinancialDataTeacher();
  if (res.isRight()) {
    final docs = res.getOrElse(() => throw Exception()).finDocs;
    //sort docs by date created, newest first
    docs.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    ref.watch(financialListManagerProvider.notifier).setAllDocuments(docs);
    ref.watch(financialListManagerProvider.notifier).initFilteredDocuments(docs);
  }
  return res;
}
