import 'package:riverpod/riverpod.dart';

final evaluationsDateFilterProvider = StateProvider<DateTime?>((ref) => null);

final evaluationsMonthFilterProvider = StateProvider<String?>((ref) => null);

final evaluationsCourseFilterProvider = StateProvider<int?>((ref) => null);
