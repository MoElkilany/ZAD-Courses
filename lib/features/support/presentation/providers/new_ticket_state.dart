import 'package:flutter/widgets.dart';
import '../../../../core/types/app_types.dart';

@immutable
class NewTicketState {
  final GlobalKey<FormState> formKey;
  final TextEditingController subjectController;
  final TextEditingController messageController;
  final TicketType ticketType;
  final List<String> files;
  final int? department;
  final int? course;
  final int? role;

  const NewTicketState({
    required this.formKey,
    required this.subjectController,
    required this.messageController,
    required this.ticketType,
    required this.files,
    required this.department,
    required this.course,
    required this.role,
  });

  factory NewTicketState.initial() {
    return NewTicketState(
      subjectController: TextEditingController(),
      messageController: TextEditingController(),
      ticketType: TicketType.academic,
      files: const [],
      formKey: GlobalKey<FormState>(),
      department: null,
      course: null,
      role: null,
    );
  }

  NewTicketState copyWith({
    TextEditingController? subjectController,
    TextEditingController? messageController,
    TicketType? ticketType,
    List<String>? files,
    GlobalKey<FormState>? formKey,
    required int? department,
    required int? course,
    required int? role,
  }) {
    return NewTicketState(
      subjectController: subjectController ?? this.subjectController,
      messageController: messageController ?? this.messageController,
      ticketType: ticketType ?? this.ticketType,
      files: files ?? this.files,
      formKey: formKey ?? this.formKey,
      department: department,
      course: course,
      role: role,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewTicketState &&
          runtimeType == other.runtimeType &&
          subjectController == other.subjectController &&
          messageController == other.messageController &&
          ticketType == other.ticketType &&
          files == other.files &&
          formKey == other.formKey &&
          department == other.department &&
          course == other.course &&
          role == other.role;

  @override
  int get hashCode =>
      subjectController.hashCode ^
      messageController.hashCode ^
      ticketType.hashCode ^
      files.hashCode ^
      formKey.hashCode ^
      department.hashCode ^
      course.hashCode ^
      role.hashCode;

  @override
  String toString() {
    return 'NewTicketState{subjectController: $subjectController, messageController: $messageController, ticketType: $ticketType, files: $files , formKey: $formKey, department: $department, course: $course, role: $role}';
  }
}
