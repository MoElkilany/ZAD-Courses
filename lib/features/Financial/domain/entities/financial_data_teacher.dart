import 'package:equatable/equatable.dart';
import '../../../financial/domain/entities/financial_document.dart';

class FinancialDataTeacher extends Equatable {
  final List<FinDoc> finDocs;

  const FinancialDataTeacher({
    required this.finDocs,
  });

  @override
  List<Object?> get props => [
        finDocs,
      ];
}
