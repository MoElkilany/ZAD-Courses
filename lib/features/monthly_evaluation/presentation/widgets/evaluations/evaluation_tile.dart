import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../router/router_utils.dart';
import '../../../domain/entities/evaluation.dart';
import '../../providers/evaluation_provider.dart';

class EvaluationTile extends ConsumerWidget {
  const EvaluationTile(
    this.data, {
    super.key,
  });
  final MonthlyEvaluation data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatter = DateFormat('dd MMM yyyy');
    final details = ref.watch(evaluationDetailsProvider(data));
    return details.when(
      data: (d) => d.fold(
        (l) => ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text('Error Occured'),
          subtitle: Text(l.toString()),
          textColor: Colors.black,
        ),
        (r) => ListTile(
          onTap: () {
            context.push(
              AppPages.evaluationDetails.toPath,
              extra: {
                'data': data,
                'details': r,
              },
            );
          },
          tileColor: Colors.grey.withOpacity(0.2),
          title: Text(r.courseTitle),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          subtitle: Text(r.studentName),
          leading: SizedBox(
            width: 50,
            child: Center(child: Text(r.month)),
          ),
          trailing: SizedBox(
            width: 50,
            child: Center(
              child: Text(
                formatter.format(data.createdAt),
              ),
            ),
          ),
          textColor: Colors.black,
        ),
      ),
      error: (e, __) => ListTile(
        title: Text('Error reaching server'),
        textColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        subtitle: Text(e.toString()),
      ),
      loading: () => Shimmer(
        gradient: LinearGradient(
          colors: [
            Colors.grey.withOpacity(0.4),
            Colors.grey,
            Colors.grey.withOpacity(0.4),
          ],
          stops: [0.4, 0.5, 0.6],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        enabled: true,
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          tileColor: Colors.grey.withOpacity(0.4),
          title: Text('Loading Data'),
          subtitle: Text('getting details'),
          textColor: Colors.white,
        ),
      ),
    );
  }
}
