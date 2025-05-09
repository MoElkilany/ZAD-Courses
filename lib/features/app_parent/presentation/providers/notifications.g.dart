// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getZadNotificationHash() =>
    r'76c9412fcd8d9f81699959ac7e2d884a7d229ce1';

/// See also [getZadNotification].
@ProviderFor(getZadNotification)
final getZadNotificationProvider =
    FutureProvider<Either<Failure, List<ZadNotification>>>.internal(
  getZadNotification,
  name: r'getZadNotificationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getZadNotificationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetZadNotificationRef
    = FutureProviderRef<Either<Failure, List<ZadNotification>>>;
String _$markNotificationReadHash() =>
    r'5c19397eb14260b89c46f7b42f8a4c5c956f9309';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [markNotificationRead].
@ProviderFor(markNotificationRead)
const markNotificationReadProvider = MarkNotificationReadFamily();

/// See also [markNotificationRead].
class MarkNotificationReadFamily
    extends Family<AsyncValue<Either<Failure, bool>>> {
  /// See also [markNotificationRead].
  const MarkNotificationReadFamily();

  /// See also [markNotificationRead].
  MarkNotificationReadProvider call({
    required int notificationId,
  }) {
    return MarkNotificationReadProvider(
      notificationId: notificationId,
    );
  }

  @override
  MarkNotificationReadProvider getProviderOverride(
    covariant MarkNotificationReadProvider provider,
  ) {
    return call(
      notificationId: provider.notificationId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'markNotificationReadProvider';
}

/// See also [markNotificationRead].
class MarkNotificationReadProvider
    extends AutoDisposeFutureProvider<Either<Failure, bool>> {
  /// See also [markNotificationRead].
  MarkNotificationReadProvider({
    required int notificationId,
  }) : this._internal(
          (ref) => markNotificationRead(
            ref as MarkNotificationReadRef,
            notificationId: notificationId,
          ),
          from: markNotificationReadProvider,
          name: r'markNotificationReadProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$markNotificationReadHash,
          dependencies: MarkNotificationReadFamily._dependencies,
          allTransitiveDependencies:
              MarkNotificationReadFamily._allTransitiveDependencies,
          notificationId: notificationId,
        );

  MarkNotificationReadProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.notificationId,
  }) : super.internal();

  final int notificationId;

  @override
  Override overrideWith(
    FutureOr<Either<Failure, bool>> Function(MarkNotificationReadRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MarkNotificationReadProvider._internal(
        (ref) => create(ref as MarkNotificationReadRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        notificationId: notificationId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<Failure, bool>> createElement() {
    return _MarkNotificationReadProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MarkNotificationReadProvider &&
        other.notificationId == notificationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, notificationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MarkNotificationReadRef
    on AutoDisposeFutureProviderRef<Either<Failure, bool>> {
  /// The parameter `notificationId` of this provider.
  int get notificationId;
}

class _MarkNotificationReadProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, bool>>
    with MarkNotificationReadRef {
  _MarkNotificationReadProviderElement(super.provider);

  @override
  int get notificationId =>
      (origin as MarkNotificationReadProvider).notificationId;
}

String _$notificationsListHash() => r'4085d12d29eef88bd6056476c728d0c2f9453693';

/// See also [NotificationsList].
@ProviderFor(NotificationsList)
final notificationsListProvider =
    NotifierProvider<NotificationsList, List<ZadNotification>>.internal(
  NotificationsList.new,
  name: r'notificationsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationsList = Notifier<List<ZadNotification>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
