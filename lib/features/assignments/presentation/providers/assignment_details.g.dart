// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment_details.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$studentAssignmentDetailsHash() =>
    r'aff90d5ea07deea45fd25c3d587e7a4526120cea';

/// A Riverpod provider class for managing the details of a student assignment.
///
/// Copied from [StudentAssignmentDetails].
@ProviderFor(StudentAssignmentDetails)
final studentAssignmentDetailsProvider =
    NotifierProvider<StudentAssignmentDetails, StudentAssignment?>.internal(
  StudentAssignmentDetails.new,
  name: r'studentAssignmentDetailsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$studentAssignmentDetailsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StudentAssignmentDetails = Notifier<StudentAssignment?>;
String _$studentsAssignmentSubmissionsDetailsHash() =>
    r'2e2daff51a8b30559169d550d1687e81a8601293';

/// A Riverpod provider class for managing the Submissions of a student assignment.
///
/// Copied from [StudentsAssignmentSubmissionsDetails].
@ProviderFor(StudentsAssignmentSubmissionsDetails)
final studentsAssignmentSubmissionsDetailsProvider =
    NotifierProvider<StudentsAssignmentSubmissionsDetails, int?>.internal(
  StudentsAssignmentSubmissionsDetails.new,
  name: r'studentsAssignmentSubmissionsDetailsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$studentsAssignmentSubmissionsDetailsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StudentsAssignmentSubmissionsDetails = Notifier<int?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
