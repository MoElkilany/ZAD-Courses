import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';

import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../main.dart';
import '../../providers/evaluations_filter.dart';
import '../filters/evaluations_filter_column.dart';

class EvaluationSearchAndFilter extends ConsumerStatefulWidget {
  const EvaluationSearchAndFilter({super.key});

  @override
  ConsumerState<EvaluationSearchAndFilter> createState() => _EvaluationSearchAndFilterState();
}

class _EvaluationSearchAndFilterState extends ConsumerState<EvaluationSearchAndFilter> {
  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final search = ref.watch(evaluationsMonthFilterProvider);
    searchController.text = search ?? '';

    final nullFilter =
        ref.watch(evaluationsDateFilterProvider) == null && ref.watch(evaluationsCourseFilterProvider) == null && (search?.isEmpty ?? true);
    final searchNotifier = ref.read(evaluationsMonthFilterProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appBoxH8,
        //search bar and filter
        Row(
          children: [
            if (!nullFilter)
              IconButton(
                onPressed: () {
                  searchNotifier.update((_) => '');
                },
                icon: const Icon(
                  Icons.clear,
                ),
              ),
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'evaluations.searchByMonth'.tr(),
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: kGray,
                  border: const OutlineInputBorder(
                    borderRadius: appBordRadCir8,
                    borderSide: BorderSide.none,
                  ),
                  focusColor: kWhite,
                  fillColor: kGray.withOpacity(
                    0.15,
                  ),
                ),
                onSubmitted: (value) {
                  searchNotifier.update((_) => value);
                },
                maxLines: 1,
              ),
            ),
            appBoxW8,
            Container(
              decoration: BoxDecoration(
                borderRadius: appBordRadCir8,
                color: kGray.withOpacity(
                  0.15,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    showModalSideSheet(
                      barrierDismissible: true,
                      elevation: 10,
                      width: isLandscape ? width * 0.4 : width * 0.7,
                      context: context,
                      ignoreAppBar: false,
                      body: const EvaluationsFilterCollumn(),
                    );
                  },
                  child: Padding(
                    padding: appPaddingAll8,
                    child: Row(
                      children: [
                        const Icon(Icons.filter_alt_outlined),
                        appBoxW8,
                        AutoSizeText(
                          'assignments.filter'.tr(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        appBoxH8
      ],
    );
  }
}
