import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/types/app_types.dart';

part 'content_provider.g.dart';

/// A method that returns the icon data for a given content type.
///
/// [ref] is a reference to the provider.
///
/// [contentType] is the type of the content.
///
/// Returns an [IconData] object.
@riverpod
IconData getContentIconData(GetContentIconDataRef ref, {required ContentType contentType}) {
  final IconData iconData = contentType == ContentType.liveSession
      ? Icons.local_movies_outlined
      : contentType == ContentType.files
          ? Icons.file_copy
          : contentType == ContentType.text
              ? Icons.text_snippet_rounded
              : contentType == ContentType.video
                  ? Icons.play_arrow_rounded
                  : Icons.assignment_outlined;
  return iconData;
}

/// A method that returns the status of a given assignment.
///
/// [ref] is a reference to the provider.
///
/// [asgStatus] is the status of the assignment.
///
/// Returns a [String] object.
@riverpod
String getContentStatus(GetContentStatusRef ref, {required LearningAssignmentStatus? asgStatus}) {
  final status = asgStatus == LearningAssignmentStatus.done
      ? 'learning.quiz.completed'
      : asgStatus == LearningAssignmentStatus.pending
          ? 'learning.quiz.pending'
          : asgStatus == LearningAssignmentStatus.missing
              ? 'learning.quiz.missing'
              : null;
  return status ?? '';
}

/// A method that returns the color of the status of a given assignment.
///
/// [ref] is a reference to the provider.
///
/// [asgStatus] is the status of the assignment.
///
/// Returns a [Color] object.
@riverpod
Color getContentStatusColor(GetContentStatusColorRef ref, {required LearningAssignmentStatus? asgStatus}) {
  final statusColor = asgStatus == LearningAssignmentStatus.done
      ? kGreen
      : asgStatus == LearningAssignmentStatus.pending
          ? kOrange
          : asgStatus == LearningAssignmentStatus.missing
              ? kRed
              : kDark;
  return statusColor;
}
