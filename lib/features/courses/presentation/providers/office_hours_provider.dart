import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/config/colors.dart';

part 'office_hours_provider.g.dart';

/// A Riverpod provider that returns a color based on the status of an office hour session.
@riverpod
Color getOfficeHoursColor(GetOfficeHoursColorRef ref, {required String status}) {
  final color = status == 'completed'
      ? kGreen
      : status == 'inProgress'
          ? kOrange
          : status == 'recorded'
              ? kRed
              : status == 'upcoming'
                  ? kBlue
                  : kDark;
  return color;
}

/// A Riverpod provider that returns a localized string based on the status of an office hour session.
@riverpod
String getOfficeHoursText(GetOfficeHoursTextRef ref, {required String status}) {
  final statusMsg = status == 'completed'
      ? 'learning.sessionStatus.completed'
      : status == 'inProgress'
          ? 'learning.sessionStatus.inProgress'
          : status == 'recorded'
              ? 'learning.sessionStatus.recorded'
              : status == 'upcoming'
                  ? 'learning.sessionStatus.upcoming'
                  : 'learning.sessionStatus.unknown';
  return statusMsg.tr();
}
