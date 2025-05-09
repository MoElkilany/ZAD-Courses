// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zoom_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sessionDetailsHash() => r'0d02b9a7717a62cf976ccd7b90dc087649c44d25';

/// See also [sessionDetails].
@ProviderFor(sessionDetails)
final sessionDetailsProvider =
    AutoDisposeFutureProvider<Either<Failure, String>>.internal(
  sessionDetails,
  name: r'sessionDetailsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sessionDetailsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SessionDetailsRef
    = AutoDisposeFutureProviderRef<Either<Failure, String>>;
String _$sessionIdHash() => r'a4f5c9b23fe1b3a6a719e8db0fa504b98dfbdcb4';

/// A Riverpod provider that manages the Course id of the current course being
/// viewed in learning page.
///
/// Copied from [SessionId].
@ProviderFor(SessionId)
final sessionIdProvider = NotifierProvider<SessionId, int?>.internal(
  SessionId.new,
  name: r'sessionIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sessionIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SessionId = Notifier<int?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
