// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getQuizStatusHash() => r'f2411cb78617b5073c87d6af7ae8166e9ad18a52';

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

/// A Riverpod provider that returns the status of a quiz.
///
/// Copied from [getQuizStatus].
@ProviderFor(getQuizStatus)
const getQuizStatusProvider = GetQuizStatusFamily();

/// A Riverpod provider that returns the status of a quiz.
///
/// Copied from [getQuizStatus].
class GetQuizStatusFamily extends Family<QuizStatus> {
  /// A Riverpod provider that returns the status of a quiz.
  ///
  /// Copied from [getQuizStatus].
  const GetQuizStatusFamily();

  /// A Riverpod provider that returns the status of a quiz.
  ///
  /// Copied from [getQuizStatus].
  GetQuizStatusProvider call({
    required int quizId,
  }) {
    return GetQuizStatusProvider(
      quizId: quizId,
    );
  }

  @override
  GetQuizStatusProvider getProviderOverride(
    covariant GetQuizStatusProvider provider,
  ) {
    return call(
      quizId: provider.quizId,
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
  String? get name => r'getQuizStatusProvider';
}

/// A Riverpod provider that returns the status of a quiz.
///
/// Copied from [getQuizStatus].
class GetQuizStatusProvider extends AutoDisposeProvider<QuizStatus> {
  /// A Riverpod provider that returns the status of a quiz.
  ///
  /// Copied from [getQuizStatus].
  GetQuizStatusProvider({
    required int quizId,
  }) : this._internal(
          (ref) => getQuizStatus(
            ref as GetQuizStatusRef,
            quizId: quizId,
          ),
          from: getQuizStatusProvider,
          name: r'getQuizStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getQuizStatusHash,
          dependencies: GetQuizStatusFamily._dependencies,
          allTransitiveDependencies:
              GetQuizStatusFamily._allTransitiveDependencies,
          quizId: quizId,
        );

  GetQuizStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quizId,
  }) : super.internal();

  final int quizId;

  @override
  Override overrideWith(
    QuizStatus Function(GetQuizStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetQuizStatusProvider._internal(
        (ref) => create(ref as GetQuizStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quizId: quizId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<QuizStatus> createElement() {
    return _GetQuizStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetQuizStatusProvider && other.quizId == quizId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetQuizStatusRef on AutoDisposeProviderRef<QuizStatus> {
  /// The parameter `quizId` of this provider.
  int get quizId;
}

class _GetQuizStatusProviderElement
    extends AutoDisposeProviderElement<QuizStatus> with GetQuizStatusRef {
  _GetQuizStatusProviderElement(super.provider);

  @override
  int get quizId => (origin as GetQuizStatusProvider).quizId;
}

String _$getQuizStatusColorHash() =>
    r'a1ecc202629b513eada98ce4099297fb96592927';

/// A Riverpod provider that returns the color associated with a quiz status.
///
/// Copied from [getQuizStatusColor].
@ProviderFor(getQuizStatusColor)
const getQuizStatusColorProvider = GetQuizStatusColorFamily();

/// A Riverpod provider that returns the color associated with a quiz status.
///
/// Copied from [getQuizStatusColor].
class GetQuizStatusColorFamily extends Family<Color> {
  /// A Riverpod provider that returns the color associated with a quiz status.
  ///
  /// Copied from [getQuizStatusColor].
  const GetQuizStatusColorFamily();

  /// A Riverpod provider that returns the color associated with a quiz status.
  ///
  /// Copied from [getQuizStatusColor].
  GetQuizStatusColorProvider call({
    required QuizStatus quizStatus,
  }) {
    return GetQuizStatusColorProvider(
      quizStatus: quizStatus,
    );
  }

  @override
  GetQuizStatusColorProvider getProviderOverride(
    covariant GetQuizStatusColorProvider provider,
  ) {
    return call(
      quizStatus: provider.quizStatus,
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
  String? get name => r'getQuizStatusColorProvider';
}

/// A Riverpod provider that returns the color associated with a quiz status.
///
/// Copied from [getQuizStatusColor].
class GetQuizStatusColorProvider extends AutoDisposeProvider<Color> {
  /// A Riverpod provider that returns the color associated with a quiz status.
  ///
  /// Copied from [getQuizStatusColor].
  GetQuizStatusColorProvider({
    required QuizStatus quizStatus,
  }) : this._internal(
          (ref) => getQuizStatusColor(
            ref as GetQuizStatusColorRef,
            quizStatus: quizStatus,
          ),
          from: getQuizStatusColorProvider,
          name: r'getQuizStatusColorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getQuizStatusColorHash,
          dependencies: GetQuizStatusColorFamily._dependencies,
          allTransitiveDependencies:
              GetQuizStatusColorFamily._allTransitiveDependencies,
          quizStatus: quizStatus,
        );

  GetQuizStatusColorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quizStatus,
  }) : super.internal();

  final QuizStatus quizStatus;

  @override
  Override overrideWith(
    Color Function(GetQuizStatusColorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetQuizStatusColorProvider._internal(
        (ref) => create(ref as GetQuizStatusColorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quizStatus: quizStatus,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Color> createElement() {
    return _GetQuizStatusColorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetQuizStatusColorProvider &&
        other.quizStatus == quizStatus;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizStatus.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetQuizStatusColorRef on AutoDisposeProviderRef<Color> {
  /// The parameter `quizStatus` of this provider.
  QuizStatus get quizStatus;
}

class _GetQuizStatusColorProviderElement
    extends AutoDisposeProviderElement<Color> with GetQuizStatusColorRef {
  _GetQuizStatusColorProviderElement(super.provider);

  @override
  QuizStatus get quizStatus =>
      (origin as GetQuizStatusColorProvider).quizStatus;
}

String _$getQuizStatusTextHash() => r'94b4400557055bfe35c23490d7215d42369bb89a';

/// A Riverpod provider that returns the text associated with a quiz status.
///
/// Copied from [getQuizStatusText].
@ProviderFor(getQuizStatusText)
const getQuizStatusTextProvider = GetQuizStatusTextFamily();

/// A Riverpod provider that returns the text associated with a quiz status.
///
/// Copied from [getQuizStatusText].
class GetQuizStatusTextFamily extends Family<String> {
  /// A Riverpod provider that returns the text associated with a quiz status.
  ///
  /// Copied from [getQuizStatusText].
  const GetQuizStatusTextFamily();

  /// A Riverpod provider that returns the text associated with a quiz status.
  ///
  /// Copied from [getQuizStatusText].
  GetQuizStatusTextProvider call({
    required QuizStatus quizStatus,
  }) {
    return GetQuizStatusTextProvider(
      quizStatus: quizStatus,
    );
  }

  @override
  GetQuizStatusTextProvider getProviderOverride(
    covariant GetQuizStatusTextProvider provider,
  ) {
    return call(
      quizStatus: provider.quizStatus,
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
  String? get name => r'getQuizStatusTextProvider';
}

/// A Riverpod provider that returns the text associated with a quiz status.
///
/// Copied from [getQuizStatusText].
class GetQuizStatusTextProvider extends AutoDisposeProvider<String> {
  /// A Riverpod provider that returns the text associated with a quiz status.
  ///
  /// Copied from [getQuizStatusText].
  GetQuizStatusTextProvider({
    required QuizStatus quizStatus,
  }) : this._internal(
          (ref) => getQuizStatusText(
            ref as GetQuizStatusTextRef,
            quizStatus: quizStatus,
          ),
          from: getQuizStatusTextProvider,
          name: r'getQuizStatusTextProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getQuizStatusTextHash,
          dependencies: GetQuizStatusTextFamily._dependencies,
          allTransitiveDependencies:
              GetQuizStatusTextFamily._allTransitiveDependencies,
          quizStatus: quizStatus,
        );

  GetQuizStatusTextProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quizStatus,
  }) : super.internal();

  final QuizStatus quizStatus;

  @override
  Override overrideWith(
    String Function(GetQuizStatusTextRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetQuizStatusTextProvider._internal(
        (ref) => create(ref as GetQuizStatusTextRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quizStatus: quizStatus,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _GetQuizStatusTextProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetQuizStatusTextProvider && other.quizStatus == quizStatus;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizStatus.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetQuizStatusTextRef on AutoDisposeProviderRef<String> {
  /// The parameter `quizStatus` of this provider.
  QuizStatus get quizStatus;
}

class _GetQuizStatusTextProviderElement
    extends AutoDisposeProviderElement<String> with GetQuizStatusTextRef {
  _GetQuizStatusTextProviderElement(super.provider);

  @override
  QuizStatus get quizStatus => (origin as GetQuizStatusTextProvider).quizStatus;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
