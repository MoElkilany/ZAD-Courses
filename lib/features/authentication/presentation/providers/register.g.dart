// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$registerHash() => r'c17d15e7d322b1c76dbd8c9df0ff91bbf5bdf31c';

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

/// See also [register].
@ProviderFor(register)
const registerProvider = RegisterFamily();

/// See also [register].
class RegisterFamily
    extends Family<AsyncValue<Either<Failure, RegisterResponse>>> {
  /// See also [register].
  const RegisterFamily();

  /// See also [register].
  RegisterProvider call({
    required RegisterRequest registerRequest,
  }) {
    return RegisterProvider(
      registerRequest: registerRequest,
    );
  }

  @override
  RegisterProvider getProviderOverride(
    covariant RegisterProvider provider,
  ) {
    return call(
      registerRequest: provider.registerRequest,
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
  String? get name => r'registerProvider';
}

/// See also [register].
class RegisterProvider
    extends AutoDisposeFutureProvider<Either<Failure, RegisterResponse>> {
  /// See also [register].
  RegisterProvider({
    required RegisterRequest registerRequest,
  }) : this._internal(
          (ref) => register(
            ref as RegisterRef,
            registerRequest: registerRequest,
          ),
          from: registerProvider,
          name: r'registerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$registerHash,
          dependencies: RegisterFamily._dependencies,
          allTransitiveDependencies: RegisterFamily._allTransitiveDependencies,
          registerRequest: registerRequest,
        );

  RegisterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.registerRequest,
  }) : super.internal();

  final RegisterRequest registerRequest;

  @override
  Override overrideWith(
    FutureOr<Either<Failure, RegisterResponse>> Function(RegisterRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RegisterProvider._internal(
        (ref) => create(ref as RegisterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        registerRequest: registerRequest,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<Failure, RegisterResponse>>
      createElement() {
    return _RegisterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegisterProvider &&
        other.registerRequest == registerRequest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, registerRequest.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RegisterRef
    on AutoDisposeFutureProviderRef<Either<Failure, RegisterResponse>> {
  /// The parameter `registerRequest` of this provider.
  RegisterRequest get registerRequest;
}

class _RegisterProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, RegisterResponse>>
    with RegisterRef {
  _RegisterProviderElement(super.provider);

  @override
  RegisterRequest get registerRequest =>
      (origin as RegisterProvider).registerRequest;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
