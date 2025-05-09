// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office_hours_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getOfficeHoursColorHash() =>
    r'8f173bf5780163232285320cf980c2493375c759';

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

/// A Riverpod provider that returns a color based on the status of an office hour session.
///
/// Copied from [getOfficeHoursColor].
@ProviderFor(getOfficeHoursColor)
const getOfficeHoursColorProvider = GetOfficeHoursColorFamily();

/// A Riverpod provider that returns a color based on the status of an office hour session.
///
/// Copied from [getOfficeHoursColor].
class GetOfficeHoursColorFamily extends Family<Color> {
  /// A Riverpod provider that returns a color based on the status of an office hour session.
  ///
  /// Copied from [getOfficeHoursColor].
  const GetOfficeHoursColorFamily();

  /// A Riverpod provider that returns a color based on the status of an office hour session.
  ///
  /// Copied from [getOfficeHoursColor].
  GetOfficeHoursColorProvider call({
    required String status,
  }) {
    return GetOfficeHoursColorProvider(
      status: status,
    );
  }

  @override
  GetOfficeHoursColorProvider getProviderOverride(
    covariant GetOfficeHoursColorProvider provider,
  ) {
    return call(
      status: provider.status,
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
  String? get name => r'getOfficeHoursColorProvider';
}

/// A Riverpod provider that returns a color based on the status of an office hour session.
///
/// Copied from [getOfficeHoursColor].
class GetOfficeHoursColorProvider extends AutoDisposeProvider<Color> {
  /// A Riverpod provider that returns a color based on the status of an office hour session.
  ///
  /// Copied from [getOfficeHoursColor].
  GetOfficeHoursColorProvider({
    required String status,
  }) : this._internal(
          (ref) => getOfficeHoursColor(
            ref as GetOfficeHoursColorRef,
            status: status,
          ),
          from: getOfficeHoursColorProvider,
          name: r'getOfficeHoursColorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOfficeHoursColorHash,
          dependencies: GetOfficeHoursColorFamily._dependencies,
          allTransitiveDependencies:
              GetOfficeHoursColorFamily._allTransitiveDependencies,
          status: status,
        );

  GetOfficeHoursColorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final String status;

  @override
  Override overrideWith(
    Color Function(GetOfficeHoursColorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetOfficeHoursColorProvider._internal(
        (ref) => create(ref as GetOfficeHoursColorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Color> createElement() {
    return _GetOfficeHoursColorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOfficeHoursColorProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetOfficeHoursColorRef on AutoDisposeProviderRef<Color> {
  /// The parameter `status` of this provider.
  String get status;
}

class _GetOfficeHoursColorProviderElement
    extends AutoDisposeProviderElement<Color> with GetOfficeHoursColorRef {
  _GetOfficeHoursColorProviderElement(super.provider);

  @override
  String get status => (origin as GetOfficeHoursColorProvider).status;
}

String _$getOfficeHoursTextHash() =>
    r'c4afcda33e2a7eafc58008ec817363d59f443dd2';

/// A Riverpod provider that returns a localized string based on the status of an office hour session.
///
/// Copied from [getOfficeHoursText].
@ProviderFor(getOfficeHoursText)
const getOfficeHoursTextProvider = GetOfficeHoursTextFamily();

/// A Riverpod provider that returns a localized string based on the status of an office hour session.
///
/// Copied from [getOfficeHoursText].
class GetOfficeHoursTextFamily extends Family<String> {
  /// A Riverpod provider that returns a localized string based on the status of an office hour session.
  ///
  /// Copied from [getOfficeHoursText].
  const GetOfficeHoursTextFamily();

  /// A Riverpod provider that returns a localized string based on the status of an office hour session.
  ///
  /// Copied from [getOfficeHoursText].
  GetOfficeHoursTextProvider call({
    required String status,
  }) {
    return GetOfficeHoursTextProvider(
      status: status,
    );
  }

  @override
  GetOfficeHoursTextProvider getProviderOverride(
    covariant GetOfficeHoursTextProvider provider,
  ) {
    return call(
      status: provider.status,
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
  String? get name => r'getOfficeHoursTextProvider';
}

/// A Riverpod provider that returns a localized string based on the status of an office hour session.
///
/// Copied from [getOfficeHoursText].
class GetOfficeHoursTextProvider extends AutoDisposeProvider<String> {
  /// A Riverpod provider that returns a localized string based on the status of an office hour session.
  ///
  /// Copied from [getOfficeHoursText].
  GetOfficeHoursTextProvider({
    required String status,
  }) : this._internal(
          (ref) => getOfficeHoursText(
            ref as GetOfficeHoursTextRef,
            status: status,
          ),
          from: getOfficeHoursTextProvider,
          name: r'getOfficeHoursTextProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOfficeHoursTextHash,
          dependencies: GetOfficeHoursTextFamily._dependencies,
          allTransitiveDependencies:
              GetOfficeHoursTextFamily._allTransitiveDependencies,
          status: status,
        );

  GetOfficeHoursTextProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final String status;

  @override
  Override overrideWith(
    String Function(GetOfficeHoursTextRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetOfficeHoursTextProvider._internal(
        (ref) => create(ref as GetOfficeHoursTextRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _GetOfficeHoursTextProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOfficeHoursTextProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetOfficeHoursTextRef on AutoDisposeProviderRef<String> {
  /// The parameter `status` of this provider.
  String get status;
}

class _GetOfficeHoursTextProviderElement
    extends AutoDisposeProviderElement<String> with GetOfficeHoursTextRef {
  _GetOfficeHoursTextProviderElement(super.provider);

  @override
  String get status => (origin as GetOfficeHoursTextProvider).status;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
