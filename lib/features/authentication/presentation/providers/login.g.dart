// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginHash() => r'a280bd549006a255b1748af5bbbfcd677cfb95f1';

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

/// See also [login].
@ProviderFor(login)
const loginProvider = LoginFamily();

/// See also [login].
class LoginFamily extends Family<AsyncValue<Either<Failure, LoginResponse>>> {
  /// See also [login].
  const LoginFamily();

  /// See also [login].
  LoginProvider call({
    required LoginRequest loginRequest,
  }) {
    return LoginProvider(
      loginRequest: loginRequest,
    );
  }

  @override
  LoginProvider getProviderOverride(
    covariant LoginProvider provider,
  ) {
    return call(
      loginRequest: provider.loginRequest,
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
  String? get name => r'loginProvider';
}

/// See also [login].
class LoginProvider
    extends AutoDisposeFutureProvider<Either<Failure, LoginResponse>> {
  /// See also [login].
  LoginProvider({
    required LoginRequest loginRequest,
  }) : this._internal(
          (ref) => login(
            ref as LoginRef,
            loginRequest: loginRequest,
          ),
          from: loginProvider,
          name: r'loginProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginHash,
          dependencies: LoginFamily._dependencies,
          allTransitiveDependencies: LoginFamily._allTransitiveDependencies,
          loginRequest: loginRequest,
        );

  LoginProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.loginRequest,
  }) : super.internal();

  final LoginRequest loginRequest;

  @override
  Override overrideWith(
    FutureOr<Either<Failure, LoginResponse>> Function(LoginRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoginProvider._internal(
        (ref) => create(ref as LoginRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        loginRequest: loginRequest,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<Failure, LoginResponse>>
      createElement() {
    return _LoginProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginProvider && other.loginRequest == loginRequest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, loginRequest.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginRef on AutoDisposeFutureProviderRef<Either<Failure, LoginResponse>> {
  /// The parameter `loginRequest` of this provider.
  LoginRequest get loginRequest;
}

class _LoginProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, LoginResponse>>
    with LoginRef {
  _LoginProviderElement(super.provider);

  @override
  LoginRequest get loginRequest => (origin as LoginProvider).loginRequest;
}

String _$usernameHash() => r'9b79d05d3a130f4ddcc43c663bad11972b1a1a01';

/// See also [Username].
@ProviderFor(Username)
final usernameProvider = NotifierProvider<Username, String>.internal(
  Username.new,
  name: r'usernameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$usernameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Username = Notifier<String>;
String _$passwordHash() => r'0f745381cf285ee2cfb8f1fb68e78ec088f83445';

/// See also [Password].
@ProviderFor(Password)
final passwordProvider = NotifierProvider<Password, String>.internal(
  Password.new,
  name: r'passwordProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$passwordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Password = Notifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
