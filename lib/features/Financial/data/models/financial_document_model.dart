import '../../domain/entities/financial_document.dart';

class FinDocModel extends FinDoc {
  const FinDocModel({
    required super.title,
    required super.course,
    required super.description,
    required super.amount,
    required super.creator,
    required super.createdAt,
  });

  factory FinDocModel.fromJson(Map<String, dynamic> json) {
    //if group-a make it Group-A and so on, make first and last letter uppercase
    String courseGroup = '';
    if (json['course'] != null) {
      courseGroup = json['course']['course_group'];
      courseGroup = courseGroup[0].toUpperCase() + courseGroup.substring(1);
      //make last letter uppercase
      courseGroup = courseGroup.substring(0, courseGroup.length - 1) + courseGroup[courseGroup.length - 1].toUpperCase();
      courseGroup = '($courseGroup)';
    }
    return FinDocModel(
      title: json['meeting_time_id'] != null
          ? 'Meeting Reservation'
          : json['subscribe_id'] != null && json['subscribe'] != null
              ? json['subscribe']['title']
              : json['product_id'] != null
                  ? 'Product'
                  : json['chapter_id'] != null
                      ? 'Chapter buy'
                      : json['course_id'] != null
                          ? 'Course buy'
                          : json['promotion_id'] != null && json['promotion'] != null
                              ? json['promotion']['title']
                              : json['registration_package_id'] != null && json['registrationPackage'] != null
                                  ? json['registrationPackage']['title']
                                  : json['store_type'] == 'manual'
                                      ? 'Manual document'
                                      : json['type'] == 'addiction' && json['type_account'] == 'asset'
                                          ? 'Charge account'
                                          : json['type'] == 'deduction' && json['type_account'] == 'income'
                                              ? 'Payout'
                                              : '--',
      course: json['course'] == null ? '' : json['course']['translations'][0]['title'] + ' $courseGroup' ?? '',
      description: json['description'] ?? '',
      amount: json['type'] != 'deduction' ? double.parse(json['amount'].toString()) : -double.parse(json['amount'].toString()),
      creator: json['creator'] == null ? '-' : json['creator']['full_name'] ?? '-',
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'course': course,
      'description': description,
      'amount': amount,
      'creator': creator,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
