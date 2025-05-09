import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/app_border.dart';
import '../../../../core/config/colors.dart';
import '../providers/financial_lists_manager.dart';
import 'financial_list/financial_list_builder.dart';
import '../../../common/presentation/providers/pagination.dart';
import '../../../common/presentation/widgets/paginator.dart';

class FinancialList extends ConsumerStatefulWidget {
  const FinancialList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FinancialListState();
}

class _FinancialListState extends ConsumerState<FinancialList> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 16;
    final height = MediaQuery.of(context).size.height;

    final docManager = ref.watch(financialListManagerProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: kSecondary,
            borderRadius: appBordRadTLR8,
          ),
          height: height * 0.05,
          child: Row(
            children: [
              const SizedBox(
                width: 50,
              ),
              Flexible(
                child: SizedBox(
                  // width: isDesktop ? width * 0.385 : width * 0.325,
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: AutoSizeText(
                      'financial.title'.tr(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: width * 0.4,
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: AutoSizeText(
                      'financial.course'.tr(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.135,
              ),
            ],
          ),
        ),
        FinancialListBuilder(
          docManager: docManager,
          width: width,
          height: height,
          ref: ref,
        ),
        Paginator(
          numberPages: ref.watch(pageManagerProvider.notifier).getPagesCount(docManager.filteredDocuments),
          onPageChange: (int index) {
            ref.read(pageManagerProvider.notifier).setPage(index + 1);
            setState(() {});
          },
        ),
      ],
    );
  }
}
