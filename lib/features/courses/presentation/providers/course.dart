import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../../../di/courses.dart';
import '../../domain/entities/course.dart';
import '../../domain/entities/favourited.dart';
import '../../domain/entities/purchase.dart';

part 'course.g.dart';

/// A Riverpod provider that provides a Future that returns an Either object
/// containing a Failure or a Course entity.
@riverpod
Future<Either<Failure, Course>> getCourse(
  GetCourseRef ref,
) async {
  final getCourse = ref.read(CoursesDI.courseRepository);
  final courseId = ref.read(courseIdProvider);
  if (courseId == null) {
    return Left(ServerFailure(
      status: 500,
      message: 'errors.serverError'.tr(),
    ));
  }
  final res = await getCourse.getCourse(courseId);
  return res;
}

@riverpod
void refreshCourse(RefreshCourseRef ref) {
  ref.invalidate(
    getCourseProvider,
  );
}

/// A Riverpod provider that provides a Future that returns an Either object
/// containing a Failure or a List of purchased courses.
@riverpod
Future<Either<Failure, List<PurchasedCourse>>> getPurchasedCourses(
  GetPurchasedCoursesRef ref,
) async {
  final getCourse = ref.read(CoursesDI.courseRepository);
  final res = await getCourse.getPurchasedCourses();
  //set course list if right
  res.fold((l) => null, (r) {
    ref.read(courseListProvider.notifier).setList(r);
  });
  return res;
}

/// A Riverpod provider that provides a Future that returns an Either object
/// containing a Failure or a List of favourited courses.
@riverpod
Future<Either<Failure, List<FavouritedCourse>>> getFavouritedCourses(
  Ref ref,
) async {
  final courseRepo = ref.read(CoursesDI.courseRepository);
  final res = await courseRepo.getFavouritedCourses();
  //set course list if right
  res.fold((l) => null, (r) {
    ref.read(favouritedCourseListProvider.notifier).setList(r);
  });
  return res;
}

/// A Riverpod provider that provides The Current List of purchased courses.
/// This provider is invalidated when the user refreshes the purchased courses
@Riverpod(keepAlive: true)
class CourseList extends _$CourseList {
  @override
  List<PurchasedCourse> build() {
    return [];
  }

  /// Sets the current list of purchased courses to the provided [list].
  /// This method is called when the user refreshes the purchased courses.
  void setList(List<PurchasedCourse> list) {
    state = list;
  }

  /// Returns the current list of purchased courses.

  get courseList => state;
}

/// A Riverpod provider that provides The Current List of favourited courses.
/// This provider is invalidated when the user refreshes the purchased courses
@Riverpod(keepAlive: true)
class FavouritedCourseList extends _$FavouritedCourseList {
  @override
  List<FavouritedCourse> build() {
    return [];
  }

  /// Sets the current list of purchased courses to the provided [list].
  /// This method is called when the user refreshes the purchased courses.
  void setList(List<FavouritedCourse> list) {
    state = list;
  }

  /// Returns the current list of purchased courses.

  get courseList => state;
}

/// A Riverpod provider that manages the Course id of the current course being
/// viewed in learning page.
@Riverpod(keepAlive: true)
class CourseId extends _$CourseId {
  /// Overrides the default build method of the provider.
  /// Returns null as this provider does not have a UI representation.
  @override
  int? build() {
    return null;
  }

  /// Sets the current course id to the provided [id].
  void setId(int id) {
    state = id;
  }

  /// Returns the current couse id.
  get courseId => state;
}

/// A Riverpod provider that provides a Future that returns an Either object
/// containing a Failure or a void (success).
@riverpod
Future<bool> toggleFavourite(
  ToggleFavouriteRef ref, {
  required int courseId,
  required BuildContext context,
  required bool isFavourite,
}) async {
  final courseRepo = ref.read(CoursesDI.courseRepository);
  bool wasToggled = false;

  await courseRepo.toggleFavourite(courseId).then((value) {
    wasToggled = value.fold((l) => false, (r) => true);

    if (wasToggled) {
      isFavourite ? showToast('courses.removedFromFavorites'.tr()) : showToast('courses.addedToFavorites'.tr());
    } else {
      //reset course list if toggle failed to how it was before
      var purchases = ref.read(courseListProvider);
      purchases = purchases.map((e) {
        if (e.id == courseId) {
          e.copyWith(
            courseContents: e.courseContents,
            expireDate: e.expireDate,
            imageUrl: e.imageUrl,
            isFavorite: isFavourite,
            purchaseDate: e.purchaseDate,
          );
        }
        return e;
      }).toList();
      ref.read(courseListProvider.notifier).setList(purchases);
      showToast('courses.favouriteError'.tr());
    }
  });
  return wasToggled;
}
