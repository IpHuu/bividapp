import 'package:bividpharma/model/dtos/giayracong/giay_ra_cong.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/pages/giayracong/giayracong_item.dart';
import 'package:bividpharma/services/giayracong_service.dart';
import 'package:bividpharma/ui/widgets/document_list_page.dart';
import 'package:flutter/widgets.dart';

class GiayRaCongListPage extends DocumentListPage {
  GiayRaCongListPage({Key? key}) : super(key: key);

  @override
  String get title => 'GIẤY RA CỔNG';

  @override
  Widget createListItem(IDocument document) {
    GiayRaCong item = document as GiayRaCong;
    return GiayRaCongItem(giayRaCong: item, showAction: false);
  }

  @override
  Future<List<IDocument>> loadPaged(DocumentSearchParam args) async {
    var list = await GiayRaCongService.giayRaCong_LoadPagedData(
        args.pageNo ?? 1,
        args.pageSize ?? 10,
        args.finished ?? false,
        args.filterType ?? 0,
        args.searchText ?? '');
    return list;
  }

  @override
  DocumentListPageState createState() => _GiayRaCongListPageState();
}

class _GiayRaCongListPageState extends DocumentListPageState {}
