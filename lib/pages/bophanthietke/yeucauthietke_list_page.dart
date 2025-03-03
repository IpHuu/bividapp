import 'dart:async';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/dtos/yeucauthietke/yeu_cau_thiet_ke.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/bophanthietke/yeucauthietke_item.dart';
import 'package:bividpharma/services/yeucauthietke_service.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/ui/widgets/document_fulllist_page.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class YeuCauThietKeListPage extends DocumentFullListPage {
  YeuCauThietKeListPage({Key? key}) : super(key: key);
  StreamController<SignedStreamArgs>? _streamController;

  @override
  String get title => 'YÊU CẦU THIẾT KẾ';

  @override
  Widget createListItem(IDocument document, bool showAction) {
    YeuCauThietKe item = document as YeuCauThietKe;
    return YeuCauThietKeItem(yeuCauThietKe: item, showAction: showAction);
  }

  @override
  Future<List<IDocument>> loadPaged(DocumentSearchParam args) async {
    var list = await YeuCauThietKeService.instance.loadPaged(
        args.pageNo ?? 1,
        args.pageSize ?? 10,
        args.finished ?? false,
        args.filterType ?? 0,
        args.searchText ?? '');
    return list;
  }

  @override
  StreamController<SignedStreamArgs>? get updateStreamSub {
    if (_streamController == null) {
      final mainModel =
          UIHelper.bividMainApp.currentContext!.read<MainPageModel>();
      _streamController = mainModel.documentSignedStream;
    }
    return _streamController!;
  }
}
