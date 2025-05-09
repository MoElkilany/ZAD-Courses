// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_notice_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getNewNoticeOptionsHash() =>
    r'861b38dab0199e60c806f4ff5203589cacc9fdd3';

/// See also [getNewNoticeOptions].
@ProviderFor(getNewNoticeOptions)
final getNewNoticeOptionsProvider =
    AutoDisposeFutureProvider<Either<Failure, NewNoticeOptions>>.internal(
  getNewNoticeOptions,
  name: r'getNewNoticeOptionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getNewNoticeOptionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNewNoticeOptionsRef
    = AutoDisposeFutureProviderRef<Either<Failure, NewNoticeOptions>>;
String _$newNoticeControllerHash() =>
    r'3794c1b755fdd132d2c28f8d2f6ea3973b3a4677';

/// See also [NewNoticeController].
@ProviderFor(NewNoticeController)
final newNoticeControllerProvider =
    AutoDisposeNotifierProvider<NewNoticeController, NewNoticeState>.internal(
  NewNoticeController.new,
  name: r'newNoticeControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newNoticeControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewNoticeController = AutoDisposeNotifier<NewNoticeState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
