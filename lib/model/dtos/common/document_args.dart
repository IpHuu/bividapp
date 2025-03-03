class DocumentArgs {
  final int reportId;
  final int tinhTrang;
  final String maCongTy;
  final String documentCode;
  final String titleText;
  final bool showAction;

  DocumentArgs({
    this.titleText = '',
    this.maCongTy = '',
    this.reportId = 0,
    this.tinhTrang = 0,
    this.documentCode = '',
    this.showAction = false,
  });
}
