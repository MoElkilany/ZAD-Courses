import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_padding.dart';
import '../../../../core/config/colors.dart';
import '../providers/progress_provider.dart';
import 'progress/progress_data.dart';
import 'progress/progress_search_and_filters.dart';

class ProgressBody extends ConsumerWidget {
  const ProgressBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(progressDataProvider);
        ref.invalidate(filtersProvider);
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: Padding(
        padding: appPaddingSymmetricWidth02,
        child: Column(
          children: [
            const ProgressSearchAndFilter(),
            Expanded(child: const ProgressData()),
          ],
        ),
      ),
    );
  }
}
