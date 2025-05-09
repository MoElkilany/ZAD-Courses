import '../../../financial/data/models/financial_document_model.dart';
import '../../domain/entities/financial_data_teacher.dart';

class FinancialDataTeacherModel extends FinancialDataTeacher {
  const FinancialDataTeacherModel({
    required super.finDocs,
  });

  factory FinancialDataTeacherModel.fromJson(Map<String, dynamic> json) {
    return FinancialDataTeacherModel(
      finDocs: (json['accountings'] as List).map((e) => FinDocModel.fromJson(e)).toList(),
    );
  }
}
