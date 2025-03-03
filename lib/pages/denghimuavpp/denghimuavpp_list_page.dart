import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/dtos/denghimuavpp/de_nghi_mua_vpp.dart';
import 'package:bividpharma/pages/denghimuavpp/denghimuavpp_item.dart';
import 'package:bividpharma/services/denghimuavpp_service.dart';
import 'package:bividpharma/ui/widgets/document_list_page.dart';
import 'package:flutter/widgets.dart';

class DeNghiMuaVppListPage extends DocumentListPage {
  DeNghiMuaVppListPage({Key? key}) : super(key: key);

  @override
  String get title => 'PHIẾU ĐỀ NGHỊ MUA VPP';

  @override
  Widget createListItem(IDocument document) {
    DeNghiMuaVpp item = document as DeNghiMuaVpp;
    return DeNghiMuaVppItem(
      deNghiMuaVpp: item,
      showAction: false,
    );
  }

  @override
  Future<List<IDocument>> loadPaged(DocumentSearchParam args) async {
    DeNghiMuaVppService apiService = DeNghiMuaVppService();
    var list = await apiService.loadPaged(args.pageNo ?? 1, args.pageSize ?? 10,
        args.finished ?? false, args.filterType ?? 0, args.searchText ?? '');
    return list;
  }

  @override
  DocumentListPageState createState() => _DeNghiMuaVppListPageState();
}

class _DeNghiMuaVppListPageState extends DocumentListPageState {}
