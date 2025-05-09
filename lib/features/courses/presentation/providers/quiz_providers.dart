import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/types/app_types.dart';
import 'course.dart';

part 'quiz_providers.g.dart';

/// A Riverpod provider that returns the status of a quiz.
@riverpod
QuizStatus getQuizStatus(GetQuizStatusRef ref, {required int quizId}) {
  final res = ref.watch(
    getCourseProvider,
  );
  return res.when(
    data: (data) {
      final course = data.fold((l) => null, (r) => r);
      if (course == null) {
        return QuizStatus.missing;
      }
      final statusString = course.courseQuizzes.firstWhere((element) => element.id == quizId).status;

      return statusString == 'completed'
          ? QuizStatus.completed
          : statusString == 'pending'
              ? QuizStatus.pending
              : QuizStatus.missing;
    },
    error: (_, __) => QuizStatus.missing,
    loading: () => QuizStatus.pending,
  );
}

/// A Riverpod provider that returns the color associated with a quiz status.
@riverpod
Color getQuizStatusColor(GetQuizStatusColorRef ref, {required QuizStatus quizStatus}) {
  final status = quizStatus;

  final statusColor = status == QuizStatus.completed
      ? kGreen
      : status == QuizStatus.pending
          ? kOrange
          : status == QuizStatus.missing
              ? kRed
              : null;

  return statusColor ?? kDark;
}

/// A Riverpod provider that returns the text associated with a quiz status.
@riverpod
String getQuizStatusText(GetQuizStatusTextRef ref, {required QuizStatus quizStatus}) {
  final status = quizStatus;

  final statusText = status == QuizStatus.completed
      ? 'learning.quiz.completed'.tr()
      : status == QuizStatus.pending
          ? 'learning.quiz.pending'.tr()
          : status == QuizStatus.missing
              ? 'learning.quiz.missing'.tr()
              : null;

  return statusText ?? 'Quiz';
}
