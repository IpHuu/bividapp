import 'dart:async';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/dtos/kehoachcongtac/ke_hoach_cong_tac.dart';
import 'package:bividpharma/pages/kehoachcongtac/kehoachcongtac_item.dart';
import 'package:bividpharma/services/kehoachcongtac_service.dart';
import 'package:bividpharma/ui/widgets/document_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeHoachCongTacListPage extends DocumentListPage {
  KeHoachCongTacListPage({Key? key}) : super(key: key);

  @override
  String get title => 'KẾ HOẠCH ĐI CÔNG TÁC';

  @override
  Widget createListItem(IDocument document) {
    KeHoachCongTac item = document as KeHoachCongTac;
    return KeHoachCongTacItem(keHoachCongTac: item, showAction: false);
  }

  @override
  Future<List<IDocument>> loadPaged(DocumentSearchParam args) async {
    var list = await KeHoachCongTacService.instance.loadPaged(
        args.pageNo ?? 1,
        args.pageSize ?? 10,
        args.finished ?? false,
        args.filterType ?? 0,
        args.searchText ?? '');
    return list;
  }

  @override
  DocumentListPageState createState() => _KeHoachCongTacListPageState();
}

class _KeHoachCongTacListPageState extends DocumentListPageState {}
