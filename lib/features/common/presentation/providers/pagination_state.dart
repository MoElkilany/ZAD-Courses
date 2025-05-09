class PaginationState {
  final int page;
  final int limit;

  const PaginationState({
    this.page = 1,
    this.limit = 10,
  });

  PaginationState copyWith({
    int? page,
    int? limit,
  }) {
    return PaginationState(
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }
}
