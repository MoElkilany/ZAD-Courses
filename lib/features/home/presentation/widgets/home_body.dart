import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_progress_indicators.dart';
import '../providers/home_info_provider.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final x = ref.watch(fetchHomeInformationProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        x.when(
          loading: () => appDefaultCircIndicator,
          error: (err, stack) => Text('Error: $err'),
          data: (data) {
            return Text(data.errorMessage.toString());
          },
        )
      ],
    );
  }
}
