import 'package:flutter/foundation.dart';
import '../../../domain/entities/platform_ticket.dart';

class PlatformListState {
  final List<PlatformTicket> allPlatformTickets;

  final List<PlatformTicket> filteredPlatformTickets;

  final List<String> dropDownDepartments;

  final String? selectedDepartment;

  /// Creates a new instance of [PlatformListState].
  const PlatformListState({
    this.allPlatformTickets = const [],
    this.filteredPlatformTickets = const [],
    this.dropDownDepartments = const [],
    this.selectedDepartment,
  });

  /// Creates a new instance of [PlatformListState] with updated values.
  ///
  /// [allPlatformTickets], [filteredPlatformTickets], [dropDownDepartments], and [selectedDepartment] can be updated.
  PlatformListState copyWith({
    List<PlatformTicket>? allPlatformTickets,
    List<PlatformTicket>? filteredPlatformTickets,
    List<String>? dropDownDepartments,
    String? selectedDepartment,
  }) {
    return PlatformListState(
      allPlatformTickets: allPlatformTickets ?? this.allPlatformTickets,
      filteredPlatformTickets: filteredPlatformTickets ?? this.filteredPlatformTickets,
      dropDownDepartments: dropDownDepartments ?? this.dropDownDepartments,
      selectedDepartment: selectedDepartment,
    );
  }

  /// Returns a string representation of the [PlatformListState] object.
  @override
  String toString() {
    return 'PlatformListState(allPlatformTickets: $allPlatformTickets, filteredPlatformTickets: $filteredPlatformTickets, dropDownDepartments: $dropDownDepartments, selectedDepartment: $selectedDepartment)';
  }

  /// Checks if two [PlatformListState] objects are equal.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlatformListState &&
        listEquals(other.allPlatformTickets, allPlatformTickets) &&
        listEquals(other.filteredPlatformTickets, filteredPlatformTickets) &&
        listEquals(other.dropDownDepartments, dropDownDepartments) &&
        other.selectedDepartment == selectedDepartment;
  }

  /// Returns the hash code of the [PlatformListState] object.
  @override
  int get hashCode {
    return allPlatformTickets.hashCode ^ filteredPlatformTickets.hashCode ^ dropDownDepartments.hashCode ^ selectedDepartment.hashCode;
  }
}
