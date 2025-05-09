import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/types/app_types.dart';
import '../../../../core/usecase/no_parameters.dart';
import '../../../../di/support.dart';
import '../../domain/entities/new_ticket_options.dart';
import '../../domain/entities/ticket_request.dart';
import 'new_ticket_state.dart';
part 'new_ticket_provider.g.dart';

@riverpod
Future<Either<Failure, NewTicketOptions>> getNewTicketOptions(
  Ref ref,
) async {
  final getNewTicketOptions = ref.read(SupportDI.getNewTicketOptions);
  final res = await getNewTicketOptions(NoParameters());
  final ticketOptions = res.fold((l) => null, (r) => r);
  if (ticketOptions != null) {
    final newTicketController = ref.read(newTicketControllerProvider.notifier);
    newTicketController.resetTicket();
    //set courses
    newTicketController.setTicketCourse(ticketOptions.courses[0].value1);
    //set roles
    newTicketController.setTicketRole(ticketOptions.roles[0].value1);
    //set departments
    newTicketController.setTicketDepartment(ticketOptions.departments[0].value1);
  }

  return res;
}

@Riverpod(keepAlive: false)
class NewTicketController extends _$NewTicketController {
  @override
  NewTicketState build() {
    return NewTicketState(
      files: const [],
      messageController: TextEditingController(),
      subjectController: TextEditingController(),
      ticketType: TicketType.academic,
      formKey: GlobalKey<FormState>(),
      department: null,
      course: null,
      role: null,
    );
  }

  //getters
  GlobalKey<FormState> get formKey => state.formKey;
  TextEditingController get subjectController => state.subjectController;
  TextEditingController get messageController => state.messageController;
  TicketType get ticketType => state.ticketType;
  List<String> get attachments => state.files;
  int? get department => state.department;
  int? get course => state.course;
  int? get role => state.role;

  void setTicketTitle(TextEditingController subjcectController) {
    state = state.copyWith(
      subjectController: subjcectController,
      department: state.department,
      course: state.course,
      role: state.role,
    );
  }

  void setTicketDescription(TextEditingController messageController) {
    state = state.copyWith(
      messageController: messageController,
      department: state.department,
      course: state.course,
      role: state.role,
    );
  }

  void setTicketType(TicketType ticketType) {
    state = state.copyWith(
      ticketType: ticketType,
      department: state.department,
      course: state.course,
      role: state.role,
    );
  }

  void setTicketAttachments(List<String> files) {
    state = state.copyWith(
      files: files,
      department: state.department,
      course: state.course,
      role: state.role,
    );
  }

  void addTicketAttachment(String file) {
    state = state.copyWith(
      files: [...state.files, file],
      department: state.department,
      course: state.course,
      role: state.role,
    );
  }

  void removeTicketAttachment(String file) {
    state = state.copyWith(
      files: [...state.files..remove(file)],
      department: state.department,
      course: state.course,
      role: state.role,
    );
  }

  void resetTicketAttachments() {
    state = state.copyWith(
      files: [],
      department: state.department,
      course: state.course,
      role: state.role,
    );
  }

  void setTicketDepartment(int? department) {
    state = state.copyWith(
      department: department,
      course: state.course,
      role: state.role,
    );
  }

  void setTicketCourse(int? course) {
    state = state.copyWith(
      course: course,
      department: state.department,
      role: state.role,
    );
  }

  void setTicketRole(int? role) {
    state = state.copyWith(
      role: role,
      department: state.department,
      course: state.course,
    );
  }

  void resetTicket() {
    state = NewTicketState.initial();
  }

  TicketRequest getTicket() {
    return TicketRequest(
      subject: subjectController.text,
      message: messageController.text,
      ticketType: ticketType,
      attachments: attachments,
      department: department,
      course: course,
      role: role,
    );
  }
}
