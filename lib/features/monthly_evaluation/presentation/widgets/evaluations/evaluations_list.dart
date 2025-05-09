import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widgets/error/contents_none.dart';
import '../../providers/evaluation_provider.dart';
import 'evaluation_tile.dart';

class EvaluationsList extends ConsumerWidget {
  const EvaluationsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(filteredEvaluationsProvider).when(
          data: (d) => d.fold(
            (_) => Center(
              child: Text('Error occured{}'),
            ),
            (
              filteredEvaluations,
            ) {
              return filteredEvaluations.isEmpty
                  ? ContentsNone(
                      text: 'noticeboard.noticesNone'.tr(),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      shrinkWrap: true,
                      itemCount: filteredEvaluations.length,
                      itemBuilder: (ctx, i) {
                        return EvaluationTile(filteredEvaluations[i]);
                      },
                    );
            },
          ),
          error: (_, __) => Center(
            child: Text('Error reaching server'),
          ),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
