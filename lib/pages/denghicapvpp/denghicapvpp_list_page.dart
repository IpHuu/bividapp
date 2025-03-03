import 'dart:async';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/dtos/denghicapvpp/de_nghi_cap_vpp.dart';
import 'package:bividpharma/pages/denghicapvpp/denghicapvpp_item.dart';
import 'package:bividpharma/services/denghicapvpp_service.dart';
import 'package:bividpharma/ui/widgets/document_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeNghiCapVppListPage extends DocumentListPage {
  DeNghiCapVppListPage({Key? key}) : super(key: key);

  @override
  String get title => 'ĐỀ NGHỊ CẤP VPP';

  @override
  Widget createListItem(IDocument document) {
    DeNghiCapVpp item = document as DeNghiCapVpp;
    return DeNghiCapVppItem(deNghiCapVpp: item, showAction: false);
  }

  @override
  Future<List<IDocument>> loadPaged(DocumentSearchParam args) async {
    var list = await DeNghiCapVppService.instance.loadPaged(
        args.pageNo ?? 1,
        args.pageSize ?? 10,
        args.finished ?? false,
        args.filterType ?? 0,
        args.searchText ?? '');
    return list;
  }

  @override
  DocumentListPageState createState() => _DeNghiCapVppListPageState();
}

class _DeNghiCapVppListPageState extends DocumentListPageState {}
