import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/colors.dart';
import '../../../domain/entities/financial_document.dart';
import '../../providers/financial_lists_manager.dart';
import 'financial_expansion_children.dart';
import 'financial_expansion_title.dart';
import '../../../../common/presentation/providers/pagination.dart';

class FinancialListBuilder extends StatelessWidget {
  const FinancialListBuilder({
    super.key,
    required this.docManager,
    required this.width,
    required this.height,
    required this.ref,
  });

  final FinancialListManager docManager;
  final double width;
  final double height;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Consumer(builder: (context, watch, child) {
        final finList = ref.watch(pageManagerProvider.notifier).getPagedList(docManager.filteredDocuments) as List<FinDoc>;
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: finList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            FinDoc doc = finList[index];

            return Padding(
              padding: appPaddingB8,
              child: ExpansionTile(
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: index == 0 ? appBordRadBLR8 : appBordRadCir8,
                ),
                shape: index == 0
                    ? const RoundedRectangleBorder(
                        borderRadius: appBordRadBLR8,
                      )
                    : const RoundedRectangleBorder(
                        borderRadius: appBordRadCir8,
                      ),
                backgroundColor: kGray.withOpacity(0.15),
                collapsedBackgroundColor: kGray.withOpacity(0.15),
                iconColor: kGray,
                collapsedIconColor: kGray,
                controlAffinity: ListTileControlAffinity.leading,
                trailing: null,
                title: FinancialExpansionTitle(doc: doc),
                children: getFinancialExpansionTileChildren(
                  width,
                  height,
                  doc,
                  ref,
                  context,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
