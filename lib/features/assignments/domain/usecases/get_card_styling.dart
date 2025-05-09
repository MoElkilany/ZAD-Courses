import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/types/app_types.dart';

/// A class that contains static methods to get the styling of an assignment card based on its status.
class GetCardStyling {
  /// Returns the color of the assignment card based on its status.
  ///
  /// [asgStatType] is the status of the assignment.
  ///
  /// Returns a [Color] object representing the color of the assignment card.
  static Color statusColor(AsgStatType asgStatType) {
    return asgStatType == AsgStatType.all
        ? kZadBlue
        : asgStatType == AsgStatType.submitted
            ? kZadBrightGreen
            : kZadBlue;
    // : asgStatType == AsgStatType.pending
    //     ? kYellow
    //     : kZadRed;
  }

  /// Returns the opacity of the color of the assignment card based on its status.
  ///
  /// [asgStatType] is the status of the assignment.
  ///
  /// Returns a [Color] object representing the opacity of the color of the assignment card.
  static Color statusColorOpacity(AsgStatType asgStatType) {
    return asgStatType == AsgStatType.all
        ? kZadBlue.withOpacity(0.25)
        : asgStatType == AsgStatType.submitted
            ? kZadBrightGreen.withOpacity(0.25)
            : kZadBlue.withOpacity(0.25);
    // : asgStatType == AsgStatType.pending
    //     ? kYellow.withOpacity(0.25)
    //     : kZadRed.withOpacity(0.25);
  }

  /// Returns the string representation of the status of the assignment.
  ///
  /// [asgStatType] is the status of the assignment.
  ///
  /// Returns a [String] object representing the status of the assignment.
  static String statusString(AsgStatType asgStatType) {
    return asgStatType == AsgStatType.all
        ? 'assignments.courseAssignments'.tr()
        : asgStatType == AsgStatType.submitted
            ? 'assignments.submittedAssignments'.tr()
            : 'assignments.courseAssignments'.tr();
    // : asgStatType == AsgStatType.pending
    //     ? 'assignments.pendingAssignments'.tr()
    //     : 'assignments.failedAssignments'.tr();
  }
}
