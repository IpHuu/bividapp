abstract class IDocument {
  String getType();
  int getId();
}

abstract class IDocumentArgs<T> extends IBaseDocument<T> {}

abstract class IDocumentReportArgs<T> extends IBaseDocument<T> {}

abstract class IBaseDocument<T> {
  Map toMap();
}

class EmptyDocument extends IDocument {
  @override
  int getId() {
    return -1;
  }

  @override
  String getType() {
    return 'EmptyDocument';
  }
}

class RadioItemData {
  RadioItemData(this.value, this.description);
  final int value;
  final String description;
}
