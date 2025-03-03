import 'dart:async';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/kehoachcongtac/ke_hoach_cong_tac_args.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/kehoachcongtac/kehoachcongtac_menu_kyduyet.dart';
import 'package:bividpharma/services/kehoachcongtac_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/widgets/document_previewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KeHoachCongTacPreviewPage extends StatefulWidget {
  const KeHoachCongTacPreviewPage({Key? key}) : super(key: key);
  @override
  State<KeHoachCongTacPreviewPage> createState() =>
      _KeHoachCongTacPreviewPageState();
}

class _KeHoachCongTacPreviewPageState extends State<KeHoachCongTacPreviewPage> {
  late String _previewUrl = "";
  late int _reportId;
  late int _tinhTrang;
  // late String _compnayCode = '';

  late bool _showBottomMenu = false;
  late bool _showAction = false;

  late StreamSubscription<int> _phieuKeHoachCongTacSub;
  late List<AttachDocument> _documents;

  final String _titleText = 'KẾ HOẠCH ĐI CÔNG TÁC';

  @override
  void initState() {
    super.initState();
    _documents = <AttachDocument>[];
    final mainModel = context.read<MainPageModel>();
    _phieuKeHoachCongTacSub =
        mainModel.giayKeHoachCongTacStream.stream.listen((event) {
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
      _showAction = arg.showAction;
      // _compnayCode = arg.documentCode;
    });
    _loadReport();
  }

  @override
  void dispose() {
    _phieuKeHoachCongTacSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _showBottomMenu = _showAction ? ([1, 2, 3, 4].contains(_tinhTrang)) : false;

    final docArgs = KeHoachCongTacArgs(
        tinhTrang: _tinhTrang, idGiayXinPhep: _reportId, noiDungDuyet: '');
    final menuKyDuyet = MenuKeHoachCongTac(
        parentContext: context, args: docArgs, onApproved: _onCommandApproved);

    return DocumentPreviewer(
        title: _titleText,
        reportId: _reportId,
        documentCode: DataHelper.keHoachCongTacName,
        documents: _documents,
        previewUrl: _previewUrl,
        showCommandMenu: _showBottomMenu,
        sheetMenu: menuKyDuyet,
        otherMenuWidget: null,
        onDocumentLoad: _onLoadAttachFile);
  }

  Future<void> _loadReport() async {
    await refreshReport();
    final list =
        await KeHoachCongTacService.instance.loadAttachedDocs(_reportId);
    _documents.clear();
    if (!mounted) return;
    setState(() {
      _documents.addAll(list);
    });
  }

  Future<void> refreshReport() async {
    final report =
        await KeHoachCongTacService.instance.loadReport(_reportId, '');
    if (mounted) {
      setState(() {
        _previewUrl = (report.reportUrl ?? "");
      });
      KeHoachCongTacService.instance.loadOne(_reportId).then((value) {
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

  Future<bool> _onCommandApproved(bool isApproved, KeHoachCongTacArgs args) {
    args.isApproved = isApproved;
    return KeHoachCongTacService.instance.approve(args);
  }

  Future<String> _onLoadAttachFile(int reportId, int documentId) {
    return KeHoachCongTacService.instance
        .loadAttachedFile(reportId, documentId);
  }
}
