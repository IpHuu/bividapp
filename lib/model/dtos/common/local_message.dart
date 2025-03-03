import 'package:objectbox/objectbox.dart';

@Entity()
class LocalMessage {
  LocalMessage(
      {this.id = 0,
      required this.docType,
      required this.title,
      required this.body,
      this.cloudId = 0,
      this.createDate,
      this.refData = '',
      this.imageUrl = '',
      this.summaryText = ''});

  int id = 0;
  String docType;
  int cloudId = 0;
  String? title;
  String? body;
  DateTime? createDate;
  String? refData;
  String? imageUrl;
  String? summaryText;

  factory LocalMessage.fromMap(Map<String, dynamic> json) {
    late LocalMessage newItem = LocalMessage(docType: '', body: '', title: '');

    try {
      newItem.docType = json["docType"] ?? '';
      newItem.body = json["body"] ?? '';
      newItem.title = json["title"] ?? '';
      newItem.refData = json["refData"] ?? '';
      newItem.imageUrl = json["imageUrl"] ?? '';
      newItem.summaryText = json["summaryText"] ?? '';
      newItem.cloudId =
          json["cloudId"] != null ? int.parse(json["cloudId"]) : 0;
      newItem.createDate = json["createDate"] != null
          ? DateTime.parse(json["createDate"])
          : null;

      return newItem;
    } catch (ex) {
      return newItem;
    }
  }
}
