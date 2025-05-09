import 'package:equatable/equatable.dart';

/// This class represents an assignment request entity.
class AssignmentRequest extends Equatable {
  /// The ID of the user who made the assignment request.
  final int userId;

  /// Constructs an instance of [AssignmentRequest].
  ///
  /// [userId] is a required parameter.
  const AssignmentRequest({
    required this.userId,
  });

  /// Returns a list of properties that will be used to determine if two [AssignmentRequest] objects are equal.
  ///
  /// In this case, the only property is [userId].
  @override
  List<Object?> get props => [userId];
}
