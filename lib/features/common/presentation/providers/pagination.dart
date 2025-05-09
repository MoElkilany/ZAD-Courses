import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'pagination_state.dart';

part 'pagination.g.dart';

@Riverpod(keepAlive: false)
class PageManager extends _$PageManager {
  @override
  PaginationState build() {
    return const PaginationState();
  }

  //how to read state
  int get page => state.page;
  int get limit => state.limit;

  void setPage(int page) {
    state = state.copyWith(page: page);
  }

  void setLimit(int limit) {
    state = state.copyWith(limit: limit);
  }

  void reset() {
    state = const PaginationState();
  }

  void resetPage() {
    state = state.copyWith(page: 1);
  }

  List getPagedList(List list) {
    final int startIndex = (page - 1) * limit;
    final int endIndex = page * limit;
    //handling last page
    if (endIndex > list.length) {
      return list.sublist(startIndex);
    }
    return list.sublist(startIndex, endIndex);
  }

  int getPagesCount(List list) {
    return (list.length / limit).ceil();
  }
}
