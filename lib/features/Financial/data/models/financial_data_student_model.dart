import '../../domain/entities/financial_data_student.dart';
import '../../../financial/data/models/financial_document_model.dart';

class FinancialDataStudentModel extends FinancialDataStudent {
  const FinancialDataStudentModel({
    required super.balance,
    required super.numRecharge,
    required super.numCourses,
    required super.numInstalments,
    required super.finDocs,
  });

  factory FinancialDataStudentModel.fromJson(Map<String, dynamic> json) => FinancialDataStudentModel(
        balance: double.tryParse('${json["accountCharge"]}') ?? 0.0,
        numRecharge: json['account_recharge_transactions'] ?? 0,
        //loop over accountings and count the number of records with course_id
        numCourses: (json['accountings'] as List).where((e) => e['course_id'] != null).length,
        numInstalments: json['coursesHasInstallments'] ?? 0,
        finDocs: (json['accountings'] as List).map((e) => FinDocModel.fromJson(e)).toList(),
      );
}
