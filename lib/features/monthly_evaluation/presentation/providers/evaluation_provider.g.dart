// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$evaluationsDataHash() => r'993494841aa3ffb2377b3b556538d02048873e6d';

/// See also [evaluationsData].
@ProviderFor(evaluationsData)
final evaluationsDataProvider =
    FutureProvider<Either<Failure, EvaluationData>>.internal(
  evaluationsData,
  name: r'evaluationsDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$evaluationsDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EvaluationsDataRef = FutureProviderRef<Either<Failure, EvaluationData>>;
String _$evaluationsHash() => r'0cfff461fb28d30a5fc7d42fedac445753d809a1';

/// See also [evaluations].
@ProviderFor(evaluations)
final evaluationsProvider =
    FutureProvider<Either<Failure, List<MonthlyEvaluation>>>.internal(
  evaluations,
  name: r'evaluationsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$evaluationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EvaluationsRef
    = FutureProviderRef<Either<Failure, List<MonthlyEvaluation>>>;
String _$coursesHash() => r'7897d1252eb4c73f499fb5b98efc77e1372b4a43';

/// See also [courses].
@ProviderFor(courses)
final coursesProvider = FutureProvider<Either<Failure, List<Course>>>.internal(
  courses,
  name: r'coursesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$coursesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CoursesRef = FutureProviderRef<Either<Failure, List<Course>>>;
String _$filteredEvaluationsHash() =>
    r'53b03cb8d31117c438db953df3f90acb7bc7585d';

/// See also [filteredEvaluations].
@ProviderFor(filteredEvaluations)
final filteredEvaluationsProvider = AutoDisposeFutureProvider<
    Either<Failure, List<MonthlyEvaluation>>>.internal(
  filteredEvaluations,
  name: r'filteredEvaluationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredEvaluationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredEvaluationsRef
    = AutoDisposeFutureProviderRef<Either<Failure, List<MonthlyEvaluation>>>;
String _$evaluationDetailsHash() => r'f1bb9c505b11e192dfa431c8e9844d3d54267948';

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

/// See also [evaluationDetails].
@ProviderFor(evaluationDetails)
const evaluationDetailsProvider = EvaluationDetailsFamily();

/// See also [evaluationDetails].
class EvaluationDetailsFamily
    extends Family<AsyncValue<Either<Failure, EvaluationDetails>>> {
  /// See also [evaluationDetails].
  const EvaluationDetailsFamily();

  /// See also [evaluationDetails].
  EvaluationDetailsProvider call(
    MonthlyEvaluation e,
  ) {
    return EvaluationDetailsProvider(
      e,
    );
  }

  @override
  EvaluationDetailsProvider getProviderOverride(
    covariant EvaluationDetailsProvider provider,
  ) {
    return call(
      provider.e,
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
  String? get name => r'evaluationDetailsProvider';
}

/// See also [evaluationDetails].
class EvaluationDetailsProvider
    extends AutoDisposeFutureProvider<Either<Failure, EvaluationDetails>> {
  /// See also [evaluationDetails].
  EvaluationDetailsProvider(
    MonthlyEvaluation e,
  ) : this._internal(
          (ref) => evaluationDetails(
            ref as EvaluationDetailsRef,
            e,
          ),
          from: evaluationDetailsProvider,
          name: r'evaluationDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$evaluationDetailsHash,
          dependencies: EvaluationDetailsFamily._dependencies,
          allTransitiveDependencies:
              EvaluationDetailsFamily._allTransitiveDependencies,
          e: e,
        );

  EvaluationDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.e,
  }) : super.internal();

  final MonthlyEvaluation e;

  @override
  Override overrideWith(
    FutureOr<Either<Failure, EvaluationDetails>> Function(
            EvaluationDetailsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EvaluationDetailsProvider._internal(
        (ref) => create(ref as EvaluationDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        e: e,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<Failure, EvaluationDetails>>
      createElement() {
    return _EvaluationDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EvaluationDetailsProvider && other.e == e;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, e.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EvaluationDetailsRef
    on AutoDisposeFutureProviderRef<Either<Failure, EvaluationDetails>> {
  /// The parameter `e` of this provider.
  MonthlyEvaluation get e;
}

class _EvaluationDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, EvaluationDetails>>
    with EvaluationDetailsRef {
  _EvaluationDetailsProviderElement(super.provider);

  @override
  MonthlyEvaluation get e => (origin as EvaluationDetailsProvider).e;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
