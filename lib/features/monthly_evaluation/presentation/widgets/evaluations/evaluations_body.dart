import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/evaluation_provider.dart';
import 'evaluation_search_and_filters.dart';
import 'evaluations_list.dart';

class EvaluationsBody extends ConsumerWidget {
  const EvaluationsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(evaluationsDataProvider);
      },
      color: kWhite,
      backgroundColor: kSecondary,
      child: Padding(
        padding: appPaddingSymmetricWidth02,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const EvaluationSearchAndFilter(),
              const EvaluationsList(),
            ],
          ),
        ),
      ),
    );
  }
}
