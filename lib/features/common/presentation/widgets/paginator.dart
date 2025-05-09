import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_paginator/number_paginator.dart';
import '../../../../core/config/colors.dart';

class Paginator extends ConsumerStatefulWidget {
  const Paginator({
    super.key,
    required this.onPageChange,
    required this.numberPages,
  });

  final dynamic Function(int)? onPageChange;
  final int numberPages;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaginatorState();
}

class _PaginatorState extends ConsumerState<Paginator> {
  @override
  Widget build(BuildContext context) {
    final numberPages = widget.numberPages;
    if (numberPages > 1) {
      return NumberPaginator(
        numberPages: numberPages,
        onPageChange: widget.onPageChange,
        showNextButton: true,
        showPrevButton: true,
        config: const NumberPaginatorUIConfig(
          buttonSelectedBackgroundColor: kSecondary,
          buttonSelectedForegroundColor: kWhite,
          buttonUnselectedForegroundColor: kSecondary,
          buttonUnselectedBackgroundColor: kWhite,
          mode: ContentDisplayMode.numbers,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
