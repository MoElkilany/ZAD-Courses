// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getContentIconDataHash() =>
    r'11c09da6d585a37b160a7cdf640004590d55090e';

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

/// A method that returns the icon data for a given content type.
///
/// [ref] is a reference to the provider.
///
/// [contentType] is the type of the content.
///
/// Returns an [IconData] object.
///
/// Copied from [getContentIconData].
@ProviderFor(getContentIconData)
const getContentIconDataProvider = GetContentIconDataFamily();

/// A method that returns the icon data for a given content type.
///
/// [ref] is a reference to the provider.
///
/// [contentType] is the type of the content.
///
/// Returns an [IconData] object.
///
/// Copied from [getContentIconData].
class GetContentIconDataFamily extends Family<IconData> {
  /// A method that returns the icon data for a given content type.
  ///
  /// [ref] is a reference to the provider.
  ///
  /// [contentType] is the type of the content.
  ///
  /// Returns an [IconData] object.
  ///
  /// Copied from [getContentIconData].
  const GetContentIconDataFamily();

  /// A method that returns the icon data for a given content type.
  ///
  /// [ref] is a reference to the provider.
  ///
  /// [contentType] is the type of the content.
  ///
  /// Returns an [IconData] object.
  ///
  /// Copied from [getContentIconData].
  GetContentIconDataProvider call({
    required ContentType contentType,
  }) {
    return GetContentIconDataProvider(
      contentType: contentType,
    );
  }

  @override
  GetContentIconDataProvider getProviderOverride(
    covariant GetContentIconDataProvider provider,
  ) {
    return call(
      contentType: provider.contentType,
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
  String? get name => r'getContentIconDataProvider';
}

/// A method that returns the icon data for a given content type.
///
/// [ref] is a reference to the provider.
///
/// [contentType] is the type of the content.
///
/// Returns an [IconData] object.
///
/// Copied from [getContentIconData].
class GetContentIconDataProvider extends AutoDisposeProvider<IconData> {
  /// A method that returns the icon data for a given content type.
  ///
  /// [ref] is a reference to the provider.
  ///
  /// [contentType] is the type of the content.
  ///
  /// Returns an [IconData] object.
  ///
  /// Copied from [getContentIconData].
  GetContentIconDataProvider({
    required ContentType contentType,
  }) : this._internal(
          (ref) => getContentIconData(
            ref as GetContentIconDataRef,
            contentType: contentType,
          ),
          from: getContentIconDataProvider,
          name: r'getContentIconDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getContentIconDataHash,
          dependencies: GetContentIconDataFamily._dependencies,
          allTransitiveDependencies:
              GetContentIconDataFamily._allTransitiveDependencies,
          contentType: contentType,
        );

  GetContentIconDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.contentType,
  }) : super.internal();

  final ContentType contentType;

  @override
  Override overrideWith(
    IconData Function(GetContentIconDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetContentIconDataProvider._internal(
        (ref) => create(ref as GetContentIconDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        contentType: contentType,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<IconData> createElement() {
    return _GetContentIconDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetContentIconDataProvider &&
        other.contentType == contentType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, contentType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetContentIconDataRef on AutoDisposeProviderRef<IconData> {
  /// The parameter `contentType` of this provider.
  ContentType get contentType;
}

class _GetContentIconDataProviderElement
    extends AutoDisposeProviderElement<IconData> with GetContentIconDataRef {
  _GetContentIconDataProviderElement(super.provider);

  @override
  ContentType get contentType =>
      (origin as GetContentIconDataProvider).contentType;
}

String _$getContentStatusHash() => r'7eca7c939fcaaa4f9306150cd8657e6c5a8343ca';

/// A method that returns the status of a given assignment.
///
/// [ref] is a reference to the provider.
///
/// [asgStatus] is the status of the assignment.
///
/// Returns a [String] object.
///
/// Copied from [getContentStatus].
@ProviderFor(getContentStatus)
const getContentStatusProvider = GetContentStatusFamily();

/// A method that returns the status of a given assignment.
///
/// [ref] is a reference to the provider.
///
/// [asgStatus] is the status of the assignment.
///
/// Returns a [String] object.
///
/// Copied from [getContentStatus].
class GetContentStatusFamily extends Family<String> {
  /// A method that returns the status of a given assignment.
  ///
  /// [ref] is a reference to the provider.
  ///
  /// [asgStatus] is the status of the assignment.
  ///
  /// Returns a [String] object.
  ///
  /// Copied from [getContentStatus].
  const GetContentStatusFamily();

  /// A method that returns the status of a given assignment.
  ///
  /// [ref] is a reference to the provider.
  ///
  /// [asgStatus] is the status of the assignment.
  ///
  /// Returns a [String] object.
  ///
  /// Copied from [getContentStatus].
  GetContentStatusProvider call({
    required LearningAssignmentStatus? asgStatus,
  }) {
    return GetContentStatusProvider(
      asgStatus: asgStatus,
    );
  }

  @override
  GetContentStatusProvider getProviderOverride(
    covariant GetContentStatusProvider provider,
  ) {
    return call(
      asgStatus: provider.asgStatus,
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
  String? get name => r'getContentStatusProvider';
}

/// A method that returns the status of a given assignment.
///
/// [ref] is a reference to the provider.
///
/// [asgStatus] is the status of the assignment.
///
/// Returns a [String] object.
///
/// Copied from [getContentStatus].
class GetContentStatusProvider extends AutoDisposeProvider<String> {
  /// A method that returns the status of a given assignment.
  ///
  /// [ref] is a reference to the provider.
  ///
  /// [asgStatus] is the status of the assignment.
  ///
  /// Returns a [String] object.
  ///
  /// Copied from [getContentStatus].
  GetContentStatusProvider({
    required LearningAssignmentStatus? asgStatus,
  }) : this._internal(
          (ref) => getContentStatus(
            ref as GetContentStatusRef,
            asgStatus: asgStatus,
          ),
          from: getContentStatusProvider,
          name: r'getContentStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getContentStatusHash,
          dependencies: GetContentStatusFamily._dependencies,
          allTransitiveDependencies:
              GetContentStatusFamily._allTransitiveDependencies,
          asgStatus: asgStatus,
        );

  GetContentStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.asgStatus,
  }) : super.internal();

  final LearningAssignmentStatus? asgStatus;

  @override
  Override overrideWith(
    String Function(GetContentStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetContentStatusProvider._internal(
        (ref) => create(ref as GetContentStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        asgStatus: asgStatus,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _GetContentStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetContentStatusProvider && other.asgStatus == asgStatus;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, asgStatus.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetContentStatusRef on AutoDisposeProviderRef<String> {
  /// The parameter `asgStatus` of this provider.
  LearningAssignmentStatus? get asgStatus;
}

class _GetContentStatusProviderElement
    extends AutoDisposeProviderElement<String> with GetContentStatusRef {
  _GetContentStatusProviderElement(super.provider);

  @override
  LearningAssignmentStatus? get asgStatus =>
      (origin as GetContentStatusProvider).asgStatus;
}

String _$getContentStatusColorHash() =>
    r'c1b1a223208f743f5cfe850c0b2887c062474efa';

/// A method that returns the color of the status of a given assignment.
///
/// [ref] is a reference to the provider.
///
/// [asgStatus] is the status of the assignment.
///
/// Returns a [Color] object.
///
/// Copied from [getContentStatusColor].
@ProviderFor(getContentStatusColor)
const getContentStatusColorProvider = GetContentStatusColorFamily();

/// A method that returns the color of the status of a given assignment.
///
/// [ref] is a reference to the provider.
///
/// [asgStatus] is the status of the assignment.
///
/// Returns a [Color] object.
///
/// Copied from [getContentStatusColor].
class GetContentStatusColorFamily extends Family<Color> {
  /// A method that returns the color of the status of a given assignment.
  ///
  /// [ref] is a reference to the provider.
  ///
  /// [asgStatus] is the status of the assignment.
  ///
  /// Returns a [Color] object.
  ///
  /// Copied from [getContentStatusColor].
  const GetContentStatusColorFamily();

  /// A method that returns the color of the status of a given assignment.
  ///
  /// [ref] is a reference to the provider.
  ///
  /// [asgStatus] is the status of the assignment.
  ///
  /// Returns a [Color] object.
  ///
  /// Copied from [getContentStatusColor].
  GetContentStatusColorProvider call({
    required LearningAssignmentStatus? asgStatus,
  }) {
    return GetContentStatusColorProvider(
      asgStatus: asgStatus,
    );
  }

  @override
  GetContentStatusColorProvider getProviderOverride(
    covariant GetContentStatusColorProvider provider,
  ) {
    return call(
      asgStatus: provider.asgStatus,
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
  String? get name => r'getContentStatusColorProvider';
}

/// A method that returns the color of the status of a given assignment.
///
/// [ref] is a reference to the provider.
///
/// [asgStatus] is the status of the assignment.
///
/// Returns a [Color] object.
///
/// Copied from [getContentStatusColor].
class GetContentStatusColorProvider extends AutoDisposeProvider<Color> {
  /// A method that returns the color of the status of a given assignment.
  ///
  /// [ref] is a reference to the provider.
  ///
  /// [asgStatus] is the status of the assignment.
  ///
  /// Returns a [Color] object.
  ///
  /// Copied from [getContentStatusColor].
  GetContentStatusColorProvider({
    required LearningAssignmentStatus? asgStatus,
  }) : this._internal(
          (ref) => getContentStatusColor(
            ref as GetContentStatusColorRef,
            asgStatus: asgStatus,
          ),
          from: getContentStatusColorProvider,
          name: r'getContentStatusColorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getContentStatusColorHash,
          dependencies: GetContentStatusColorFamily._dependencies,
          allTransitiveDependencies:
              GetContentStatusColorFamily._allTransitiveDependencies,
          asgStatus: asgStatus,
        );

  GetContentStatusColorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.asgStatus,
  }) : super.internal();

  final LearningAssignmentStatus? asgStatus;

  @override
  Override overrideWith(
    Color Function(GetContentStatusColorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetContentStatusColorProvider._internal(
        (ref) => create(ref as GetContentStatusColorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        asgStatus: asgStatus,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Color> createElement() {
    return _GetContentStatusColorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetContentStatusColorProvider &&
        other.asgStatus == asgStatus;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, asgStatus.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetContentStatusColorRef on AutoDisposeProviderRef<Color> {
  /// The parameter `asgStatus` of this provider.
  LearningAssignmentStatus? get asgStatus;
}

class _GetContentStatusColorProviderElement
    extends AutoDisposeProviderElement<Color> with GetContentStatusColorRef {
  _GetContentStatusColorProviderElement(super.provider);

  @override
  LearningAssignmentStatus? get asgStatus =>
      (origin as GetContentStatusColorProvider).asgStatus;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
