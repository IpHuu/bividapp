class DocumentSearchParam {
  final int? pageNo;
  final int? pageSize;
  final bool? finished;
  final int? filterType;
  final String? searchText;

  DocumentSearchParam(
      {this.pageNo,
      this.pageSize,
      this.finished,
      this.filterType,
      this.searchText});
}
