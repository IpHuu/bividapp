import 'dart:async';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/chiphicongtac/chi_phi_cong_tac_args.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/chiphicongtac/chiphicongtac_menu_kyduyet.dart';
import 'package:bividpharma/services/chiphicongtac_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/widgets/document_previewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This class handles the Page to dispaly the user's info on the "Edit NewDocument" Screen
class ChiPhiCongTacPreviewPage extends StatefulWidget {
  const ChiPhiCongTacPreviewPage({Key? key}) : super(key: key);
  @override
  State<ChiPhiCongTacPreviewPage> createState() =>
      _ChiPhiCongTacPreviewPageState();
}

class _ChiPhiCongTacPreviewPageState extends State<ChiPhiCongTacPreviewPage> {
  late String _previewUrl = "";
  late int _reportId;
  late int _tinhTrang;
  // late String _compnayCode = '';

  late bool _showBottomMenu = false;
  late bool _showAction = false;

  late StreamSubscription<int> _phieuChiPhiCongTacSub;
  late List<AttachDocument> _documents;

  final String _titleText = 'CHI PHÍ CÔNG TÁC';

  @override
  void initState() {
    super.initState();
    _documents = <AttachDocument>[];
    final mainModel = context.read<MainPageModel>();
    _phieuChiPhiCongTacSub =
        mainModel.giayChiPhiCongTacStream.stream.listen((event) {
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
    _phieuChiPhiCongTacSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _showBottomMenu = _showAction ? ([1, 2].contains(_tinhTrang)) : false;

    final docArgs = ChiPhiCongTacArgs(
        tinhTrang: _tinhTrang, idGiayXinPhep: _reportId, noiDungDuyet: '');
    final menuKyDuyet = MenuChiPhiCongTac(
        parentContext: context, args: docArgs, onApproved: _onCommandApproved);

    return DocumentPreviewer(
        title: _titleText,
        reportId: _reportId,
        documentCode: DataHelper.chiPhiCongTacName,
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
        await ChiPhiCongTacService.instance.loadAttachedDocs(_reportId);
    _documents.clear();
    if (!mounted) return;
    setState(() {
      _documents.addAll(list);
    });
  }

  Future<void> refreshReport() async {
    final report =
        await ChiPhiCongTacService.instance.loadReport(_reportId, '');
    if (mounted) {
      setState(() {
        _previewUrl = (report.reportUrl ?? "");
      });
      ChiPhiCongTacService.instance.loadOne(_reportId).then((value) {
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

  Future<bool> _onCommandApproved(bool isApproved, ChiPhiCongTacArgs args) {
    args.isApproved = isApproved;
    return ChiPhiCongTacService.instance.approve(args);
  }

  Future<String> _onLoadAttachFile(int reportId, int documentId) {
    return ChiPhiCongTacService.instance.loadAttachedFile(reportId, documentId);
  }
}
