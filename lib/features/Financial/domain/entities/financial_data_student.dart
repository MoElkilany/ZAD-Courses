import 'package:equatable/equatable.dart';
import '../../../financial/domain/entities/financial_document.dart';

class FinancialDataStudent extends Equatable {
  final double balance;
  final int numRecharge;
  final int numCourses;
  final int numInstalments;

  final List<FinDoc> finDocs;

  const FinancialDataStudent({
    required this.balance,
    required this.numRecharge,
    required this.numCourses,
    required this.numInstalments,
    required this.finDocs,
  });

  @override
  List<Object?> get props => [
        balance,
        numRecharge,
        numCourses,
        numInstalments,
        finDocs,
      ];
}
