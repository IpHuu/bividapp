import 'dart:async';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/dtos/lenhcongtac/lenh_cong_tac.dart';
import 'package:bividpharma/pages/lenhcongtac/lenhcongtac_item.dart';
import 'package:bividpharma/services/lenhcongtac_service.dart';
import 'package:bividpharma/ui/widgets/document_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LenhCongTacListPage extends DocumentListPage {
  LenhCongTacListPage({Key? key}) : super(key: key);

  @override
  String get title => 'LỆNH CÔNG TÁC';

  @override
  Widget createListItem(IDocument document) {
    LenhCongTac item = document as LenhCongTac;
    return LenhCongTacItem(lenhCongTac: item, showAction: false);
  }

  @override
  Future<List<IDocument>> loadPaged(DocumentSearchParam args) async {
    var list = await LenhCongTacService.instance.loadPaged(
        args.pageNo ?? 1,
        args.pageSize ?? 10,
        args.finished ?? false,
        args.filterType ?? 0,
        args.searchText ?? '');
    return list;
  }

  @override
  DocumentListPageState createState() => _LenhCongTacListPageState();
}

class _LenhCongTacListPageState extends DocumentListPageState {}
