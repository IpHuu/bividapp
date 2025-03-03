import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/dtos/denghicapsim/de_nghi_cap_sim.dart';
import 'package:bividpharma/pages/denghicapsim/denghicapsim_item.dart';
import 'package:bividpharma/services/denghicapsim_service.dart';
import 'package:bividpharma/ui/widgets/document_list_page.dart';
import 'package:flutter/widgets.dart';

class DeNghiCapSimListPage extends DocumentListPage {
  DeNghiCapSimListPage({Key? key}) : super(key: key);

  @override
  String get title => 'PHIẾU ĐỀ NGHỊ CẤP SIM';

  @override
  Widget createListItem(IDocument document) {
    DeNghiCapSim item = document as DeNghiCapSim;
    return DeNghiCapSimItem(
      deNghiCapSim: item,
      showAction: false,
    );
  }

  @override
  Future<List<IDocument>> loadPaged(DocumentSearchParam args) async {
    var list = await DeNghiCapSimService.deNghiCapSim_LoadPagedData(
        args.pageNo ?? 1,
        args.pageSize ?? 10,
        args.finished ?? false,
        args.filterType ?? 0,
        args.searchText ?? '');
    return list;
  }

  @override
  DocumentListPageState createState() => _DeNghiCapSimListPageState();
}

class _DeNghiCapSimListPageState extends DocumentListPageState {}
