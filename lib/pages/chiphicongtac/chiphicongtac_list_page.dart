// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:bividpharma/model/dtos/chiphicongtac/chi_phi_cong_tac.dart';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/pages/chiphicongtac/chiphicongtac_item.dart';
import 'package:bividpharma/services/chiphicongtac_service.dart';
import 'package:bividpharma/ui/widgets/document_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChiPhiCongTacListPage extends DocumentListPage {
  ChiPhiCongTacListPage({Key? key}) : super(key: key);

  @override
  String get title => 'CHI PHÍ CÔNG TÁC';

  @override
  Widget createListItem(IDocument document) {
    ChiPhiCongTac item = document as ChiPhiCongTac;
    return ChiPhiCongTacItem(chiPhiCongTac: item, showAction: false);
  }

  @override
  Future<List<IDocument>> loadPaged(DocumentSearchParam args) async {
    var list = await ChiPhiCongTacService.instance.loadPaged(
        args.pageNo ?? 1,
        args.pageSize ?? 10,
        args.finished ?? false,
        args.filterType ?? 0,
        args.searchText ?? '');
    return list;
  }

  @override
  DocumentListPageState createState() => _ChiPhiCongTacListPageState();
}

class _ChiPhiCongTacListPageState extends DocumentListPageState {}
