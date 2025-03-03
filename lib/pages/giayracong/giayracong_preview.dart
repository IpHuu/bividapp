import 'dart:async';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/giayracong/giay_ra_cong_args.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/giayracong/giayracong_menu_kyduyet.dart';
import 'package:bividpharma/services/giayracong_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/widgets/document_previewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This class handles the Page to dispaly the user's info on the "Edit NewDocument" Screen
class GiayRaCongPreviewPage extends StatefulWidget {
  const GiayRaCongPreviewPage({Key? key}) : super(key: key);
  @override
  State<GiayRaCongPreviewPage> createState() => _GiayRaCongPreviewPageState();
}

class _GiayRaCongPreviewPageState extends State<GiayRaCongPreviewPage>
    with SingleTickerProviderStateMixin {
  late String? _previewUrl = '';
  late int _reportId;
  late String _compnayCode = '';
  late int _tinhTrang;

  late bool _showBottomMenu = false;
  late bool _showAction = false;

  late StreamSubscription<int> _giayRaCongSub;
  late List<AttachDocument> _documents;

  final String _titleText = 'GIẤY RA CỔNG';

  @override
  void initState() {
    super.initState();
    _documents = <AttachDocument>[];
    final mainModel = context.read<MainPageModel>();
    _giayRaCongSub = mainModel.giayRaCongStream.stream.listen((event) {
      if (event != _reportId) return;
      refreshReport();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg = ModalRoute.of(context)!.settings.arguments as DocumentArgs;
    setState(() {
      _reportId = arg.reportId;
      _tinhTrang = arg.tinhTrang;
      _compnayCode = arg.maCongTy;
      _showAction = arg.showAction;
    });
    _loadReport();
  }

  @override
  void dispose() {
    _giayRaCongSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _showBottomMenu = _showAction ? ([1, 2, 3].contains(_tinhTrang)) : false;

    final giayRaCongArgs = GiayRaCongArgs(
      tinhTrang: _tinhTrang,
      giayXinPhepId: _reportId,
    );
    final menuKyDuyet = MenuGiayRaCong(
        parentContext: context,
        args: giayRaCongArgs,
        onApproved: _onCommandApproved);

    return DocumentPreviewer(
        title: _titleText,
        documents: _documents,
        previewUrl: _previewUrl,
        showCommandMenu: _showBottomMenu,
        sheetMenu: menuKyDuyet,
        reportId: _reportId,
        documentCode: DataHelper.giayRaCongName,
        onDocumentLoad: _onLoadAttachFile);
  }

  Future<void> _loadReport() async {
    await refreshReport();
    final list =
        await GiayRaCongService.giayRaCong_LoadAttachedFiles(_reportId);
    _documents.clear();
    setState(() {
      _documents.addAll(list);
    });
  }

  Future<void> refreshReport() async {
    final report =
        await GiayRaCongService.giayRaCong_LoadReport(_reportId, _compnayCode);
    if (mounted) {
      setState(() {
        _previewUrl = (report.reportUrl);
      });
      GiayRaCongService.giayRaCong_LoadOne(_reportId).then((value) {
        if (value == null) return;
        setState(() {
          _tinhTrang = value.tinhTrang;
        });
        if (_tinhTrang <= 0) {
          MyNavigation.back();
        }
      });
    }
  }

  Future<bool> _onCommandApproved(bool isApproved, GiayRaCongArgs args) {
    return GiayRaCongService.giayRaCong_approve(
      isApproved: isApproved,
      tinhTrang: args.tinhTrang,
      giayRaCongId: args.giayXinPhepId,
      noiDungDuyet: args.noiDungDuyet,
    );
  }

  Future<String> _onLoadAttachFile(int reportId, int documentId) {
    return GiayRaCongService.giayRaCong_LoadAttachedFile(reportId, documentId);
  }
}
