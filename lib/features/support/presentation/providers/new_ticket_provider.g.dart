// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_ticket_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getNewTicketOptionsHash() =>
    r'0886e968b4deea9cd863d995bff2d731936d653d';

/// See also [getNewTicketOptions].
@ProviderFor(getNewTicketOptions)
final getNewTicketOptionsProvider =
    AutoDisposeFutureProvider<Either<Failure, NewTicketOptions>>.internal(
  getNewTicketOptions,
  name: r'getNewTicketOptionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getNewTicketOptionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNewTicketOptionsRef
    = AutoDisposeFutureProviderRef<Either<Failure, NewTicketOptions>>;
String _$newTicketControllerHash() =>
    r'1a86488dcb08a664792aef150fb96412968ee331';

/// See also [NewTicketController].
@ProviderFor(NewTicketController)
final newTicketControllerProvider =
    AutoDisposeNotifierProvider<NewTicketController, NewTicketState>.internal(
  NewTicketController.new,
  name: r'newTicketControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newTicketControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewTicketController = AutoDisposeNotifier<NewTicketState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
