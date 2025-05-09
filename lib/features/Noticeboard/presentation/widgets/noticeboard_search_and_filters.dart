import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/app_border.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_sized_box.dart';
import '../../../../core/config/colors.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import '../providers/noticeboard_filter.dart';
import '../providers/noticeboard_lists_manager.dart';
import 'filters/noticeboard_filter_column.dart';
import '../../../../main.dart';
import '../../../../router/router_utils.dart';

class NoticeboardSearchAndFilter extends ConsumerStatefulWidget {
  const NoticeboardSearchAndFilter({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoticeboardSearchAndFilterState();
}

class _NoticeboardSearchAndFilterState extends ConsumerState<NoticeboardSearchAndFilter> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final manager = ref.watch(noticeboardListManagerProvider.notifier);
    final filter = ref.watch(noticeboardFilterProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appBoxH8,
        //search bar and filter
        Row(
          children: [
            if (filter.query != null)
              IconButton(
                onPressed: () {
                  filter.resetQuery();
                  manager.setFilteredNotices();
                  GoRouter.of(context).pushReplacement(AppPages.noticeboard.toPath);
                },
                icon: const Icon(
                  Icons.clear,
                ),
              ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'assignments.search'.tr(),
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
                  filter.setQuery(value);
                  manager.setFilteredNotices();
                  GoRouter.of(context).pushReplacement(AppPages.noticeboard.toPath);
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
                      body: const NoticeboardFilterCollumn(),
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
