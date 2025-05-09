// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCourseHash() => r'6d14cf0e74a65e4da4b92fe535d270b965e97bc3';

/// A Riverpod provider that provides a Future that returns an Either object
/// containing a Failure or a Course entity.
///
/// Copied from [getCourse].
@ProviderFor(getCourse)
final getCourseProvider =
    AutoDisposeFutureProvider<Either<Failure, Course>>.internal(
  getCourse,
  name: r'getCourseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getCourseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCourseRef = AutoDisposeFutureProviderRef<Either<Failure, Course>>;
String _$refreshCourseHash() => r'a0d919dedf0c72cf500617445f098bf989c657c6';

/// See also [refreshCourse].
@ProviderFor(refreshCourse)
final refreshCourseProvider = AutoDisposeProvider<void>.internal(
  refreshCourse,
  name: r'refreshCourseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$refreshCourseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RefreshCourseRef = AutoDisposeProviderRef<void>;
String _$getPurchasedCoursesHash() =>
    r'3f151ac3201901f76ac608e6dee9870d0e8d8502';

/// A Riverpod provider that provides a Future that returns an Either object
/// containing a Failure or a List of purchased courses.
///
/// Copied from [getPurchasedCourses].
@ProviderFor(getPurchasedCourses)
final getPurchasedCoursesProvider =
    AutoDisposeFutureProvider<Either<Failure, List<PurchasedCourse>>>.internal(
  getPurchasedCourses,
  name: r'getPurchasedCoursesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getPurchasedCoursesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetPurchasedCoursesRef
    = AutoDisposeFutureProviderRef<Either<Failure, List<PurchasedCourse>>>;
String _$getFavouritedCoursesHash() =>
    r'd8654fdc7ef8eb694cde5e397eff64955afe7b8b';

/// A Riverpod provider that provides a Future that returns an Either object
/// containing a Failure or a List of favourited courses.
///
/// Copied from [getFavouritedCourses].
@ProviderFor(getFavouritedCourses)
final getFavouritedCoursesProvider =
    AutoDisposeFutureProvider<Either<Failure, List<FavouritedCourse>>>.internal(
  getFavouritedCourses,
  name: r'getFavouritedCoursesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getFavouritedCoursesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetFavouritedCoursesRef
    = AutoDisposeFutureProviderRef<Either<Failure, List<FavouritedCourse>>>;
String _$toggleFavouriteHash() => r'f109a2befd135dc6b5d3d400e381640a877f9036';

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

/// A Riverpod provider that provides a Future that returns an Either object
/// containing a Failure or a void (success).
///
/// Copied from [toggleFavourite].
@ProviderFor(toggleFavourite)
const toggleFavouriteProvider = ToggleFavouriteFamily();

/// A Riverpod provider that provides a Future that returns an Either object
/// containing a Failure or a void (success).
///
/// Copied from [toggleFavourite].
class ToggleFavouriteFamily extends Family<AsyncValue<bool>> {
  /// A Riverpod provider that provides a Future that returns an Either object
  /// containing a Failure or a void (success).
  ///
  /// Copied from [toggleFavourite].
  const ToggleFavouriteFamily();

  /// A Riverpod provider that provides a Future that returns an Either object
  /// containing a Failure or a void (success).
  ///
  /// Copied from [toggleFavourite].
  ToggleFavouriteProvider call({
    required int courseId,
    required BuildContext context,
    required bool isFavourite,
  }) {
    return ToggleFavouriteProvider(
      courseId: courseId,
      context: context,
      isFavourite: isFavourite,
    );
  }

  @override
  ToggleFavouriteProvider getProviderOverride(
    covariant ToggleFavouriteProvider provider,
  ) {
    return call(
      courseId: provider.courseId,
      context: provider.context,
      isFavourite: provider.isFavourite,
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
  String? get name => r'toggleFavouriteProvider';
}

/// A Riverpod provider that provides a Future that returns an Either object
/// containing a Failure or a void (success).
///
/// Copied from [toggleFavourite].
class ToggleFavouriteProvider extends AutoDisposeFutureProvider<bool> {
  /// A Riverpod provider that provides a Future that returns an Either object
  /// containing a Failure or a void (success).
  ///
  /// Copied from [toggleFavourite].
  ToggleFavouriteProvider({
    required int courseId,
    required BuildContext context,
    required bool isFavourite,
  }) : this._internal(
          (ref) => toggleFavourite(
            ref as ToggleFavouriteRef,
            courseId: courseId,
            context: context,
            isFavourite: isFavourite,
          ),
          from: toggleFavouriteProvider,
          name: r'toggleFavouriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$toggleFavouriteHash,
          dependencies: ToggleFavouriteFamily._dependencies,
          allTransitiveDependencies:
              ToggleFavouriteFamily._allTransitiveDependencies,
          courseId: courseId,
          context: context,
          isFavourite: isFavourite,
        );

  ToggleFavouriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.courseId,
    required this.context,
    required this.isFavourite,
  }) : super.internal();

  final int courseId;
  final BuildContext context;
  final bool isFavourite;

  @override
  Override overrideWith(
    FutureOr<bool> Function(ToggleFavouriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ToggleFavouriteProvider._internal(
        (ref) => create(ref as ToggleFavouriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        courseId: courseId,
        context: context,
        isFavourite: isFavourite,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ToggleFavouriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ToggleFavouriteProvider &&
        other.courseId == courseId &&
        other.context == context &&
        other.isFavourite == isFavourite;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseId.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, isFavourite.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ToggleFavouriteRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `courseId` of this provider.
  int get courseId;

  /// The parameter `context` of this provider.
  BuildContext get context;

  /// The parameter `isFavourite` of this provider.
  bool get isFavourite;
}

class _ToggleFavouriteProviderElement
    extends AutoDisposeFutureProviderElement<bool> with ToggleFavouriteRef {
  _ToggleFavouriteProviderElement(super.provider);

  @override
  int get courseId => (origin as ToggleFavouriteProvider).courseId;
  @override
  BuildContext get context => (origin as ToggleFavouriteProvider).context;
  @override
  bool get isFavourite => (origin as ToggleFavouriteProvider).isFavourite;
}

String _$courseListHash() => r'eaa0a66602a43f3d43503eb0fe071c180fcff0a9';

/// A Riverpod provider that provides The Current List of purchased courses.
/// This provider is invalidated when the user refreshes the purchased courses
///
/// Copied from [CourseList].
@ProviderFor(CourseList)
final courseListProvider =
    NotifierProvider<CourseList, List<PurchasedCourse>>.internal(
  CourseList.new,
  name: r'courseListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$courseListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CourseList = Notifier<List<PurchasedCourse>>;
String _$favouritedCourseListHash() =>
    r'6fa9c50afdcd8d35e56ab62322452a4ca927f127';

/// A Riverpod provider that provides The Current List of favourited courses.
/// This provider is invalidated when the user refreshes the purchased courses
///
/// Copied from [FavouritedCourseList].
@ProviderFor(FavouritedCourseList)
final favouritedCourseListProvider =
    NotifierProvider<FavouritedCourseList, List<FavouritedCourse>>.internal(
  FavouritedCourseList.new,
  name: r'favouritedCourseListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favouritedCourseListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavouritedCourseList = Notifier<List<FavouritedCourse>>;
String _$courseIdHash() => r'6e1f402542dd37f36509c951a1e64543b10d2fe3';

/// A Riverpod provider that manages the Course id of the current course being
/// viewed in learning page.
///
/// Copied from [CourseId].
@ProviderFor(CourseId)
final courseIdProvider = NotifierProvider<CourseId, int?>.internal(
  CourseId.new,
  name: r'courseIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$courseIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CourseId = Notifier<int?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
