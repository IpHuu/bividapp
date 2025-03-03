import 'dart:async';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/dtos/dexuatmuahang/phieu_de_xuat_mua_hang.dart';
import 'package:bividpharma/pages/dexuatmuahang/phieudexuatmuahang_item.dart';
import 'package:bividpharma/services/dexuatmuahang_service.dart';
import 'package:bividpharma/ui/widgets/document_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhieuDeXuatMuaHangListPage extends DocumentListPage {
  PhieuDeXuatMuaHangListPage({Key? key}) : super(key: key);

  @override
  String get title => 'ĐỀ XUẤT MUA HÀNG';

  @override
  Widget createListItem(IDocument document) {
    PhieuDeXuatMuaHang item = document as PhieuDeXuatMuaHang;
    return PhieuDeXuatMuaHangItem(phieuDXMH: item, showAction: false);
  }

  @override
  Future<List<IDocument>> loadPaged(DocumentSearchParam args) async {
    var list = await PhieuDeXuatMuaHangService.phieuDeXuatMuaHang_LoadPagedData(
        args.pageNo ?? 1,
        args.pageSize ?? 10,
        args.finished ?? false,
        args.filterType ?? 0,
        args.searchText ?? '');
    return list;
  }

  @override
  DocumentListPageState createState() => _PhieuDeXuatMuaHangListPageState();
}

class _PhieuDeXuatMuaHangListPageState extends DocumentListPageState {}
