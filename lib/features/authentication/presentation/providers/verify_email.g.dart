// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$verifyEmailHash() => r'a79fc45f487b2fcce513d80f661d95348940e1c9';

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

/// See also [verifyEmail].
@ProviderFor(verifyEmail)
const verifyEmailProvider = VerifyEmailFamily();

/// See also [verifyEmail].
class VerifyEmailFamily
    extends Family<AsyncValue<Either<Failure, VerificationResponse>>> {
  /// See also [verifyEmail].
  const VerifyEmailFamily();

  /// See also [verifyEmail].
  VerifyEmailProvider call({
    required VerificationRequest verificationRequest,
  }) {
    return VerifyEmailProvider(
      verificationRequest: verificationRequest,
    );
  }

  @override
  VerifyEmailProvider getProviderOverride(
    covariant VerifyEmailProvider provider,
  ) {
    return call(
      verificationRequest: provider.verificationRequest,
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
  String? get name => r'verifyEmailProvider';
}

/// See also [verifyEmail].
class VerifyEmailProvider
    extends AutoDisposeFutureProvider<Either<Failure, VerificationResponse>> {
  /// See also [verifyEmail].
  VerifyEmailProvider({
    required VerificationRequest verificationRequest,
  }) : this._internal(
          (ref) => verifyEmail(
            ref as VerifyEmailRef,
            verificationRequest: verificationRequest,
          ),
          from: verifyEmailProvider,
          name: r'verifyEmailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyEmailHash,
          dependencies: VerifyEmailFamily._dependencies,
          allTransitiveDependencies:
              VerifyEmailFamily._allTransitiveDependencies,
          verificationRequest: verificationRequest,
        );

  VerifyEmailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.verificationRequest,
  }) : super.internal();

  final VerificationRequest verificationRequest;

  @override
  Override overrideWith(
    FutureOr<Either<Failure, VerificationResponse>> Function(
            VerifyEmailRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyEmailProvider._internal(
        (ref) => create(ref as VerifyEmailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        verificationRequest: verificationRequest,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<Failure, VerificationResponse>>
      createElement() {
    return _VerifyEmailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyEmailProvider &&
        other.verificationRequest == verificationRequest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, verificationRequest.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyEmailRef
    on AutoDisposeFutureProviderRef<Either<Failure, VerificationResponse>> {
  /// The parameter `verificationRequest` of this provider.
  VerificationRequest get verificationRequest;
}

class _VerifyEmailProviderElement extends AutoDisposeFutureProviderElement<
    Either<Failure, VerificationResponse>> with VerifyEmailRef {
  _VerifyEmailProviderElement(super.provider);

  @override
  VerificationRequest get verificationRequest =>
      (origin as VerifyEmailProvider).verificationRequest;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
