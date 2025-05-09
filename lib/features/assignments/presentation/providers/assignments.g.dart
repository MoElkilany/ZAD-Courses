// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignments.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getStudentAssignmentsHash() =>
    r'23aae6a952f5af3de1a5b69c646aa25d7bbe14f1';

/// See also [getStudentAssignments].
@ProviderFor(getStudentAssignments)
final getStudentAssignmentsProvider =
    FutureProvider<Either<Failure, StudentAssignmentsList>>.internal(
  getStudentAssignments,
  name: r'getStudentAssignmentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getStudentAssignmentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetStudentAssignmentsRef
    = FutureProviderRef<Either<Failure, StudentAssignmentsList>>;
String _$getTeacherAssignmentsHash() =>
    r'98d92e54340976677cabec675da7abe6ac48de08';

/// See also [getTeacherAssignments].
@ProviderFor(getTeacherAssignments)
final getTeacherAssignmentsProvider =
    AutoDisposeFutureProvider<Either<Failure, TeacherAssignmentsList>>.internal(
  getTeacherAssignments,
  name: r'getTeacherAssignmentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getTeacherAssignmentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetTeacherAssignmentsRef
    = AutoDisposeFutureProviderRef<Either<Failure, TeacherAssignmentsList>>;
String _$getStudentSubmissionsHash() =>
    r'98b2266105f964ae3ceb437deb64c3b370704290';

/// See also [getStudentSubmissions].
@ProviderFor(getStudentSubmissions)
final getStudentSubmissionsProvider = AutoDisposeFutureProvider<
    Either<Failure, List<StudentSubmission>>>.internal(
  getStudentSubmissions,
  name: r'getStudentSubmissionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getStudentSubmissionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetStudentSubmissionsRef
    = AutoDisposeFutureProviderRef<Either<Failure, List<StudentSubmission>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
