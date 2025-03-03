import 'dart:async';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/yeucauthietke/yeucauthietke_args.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/bophanthietke/yeucauthietke_menu_kyduyet.dart';
import 'package:bividpharma/services/yeucauthietke_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/widgets/document_previewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This class handles the Page to dispaly the user's info on the "Edit NewDocument" Screen
class YeuCauThietKePreviewPage extends StatefulWidget {
  const YeuCauThietKePreviewPage({Key? key}) : super(key: key);
  @override
  State<YeuCauThietKePreviewPage> createState() =>
      _YeuCauThietKePreviewPageState();
}

class _YeuCauThietKePreviewPageState extends State<YeuCauThietKePreviewPage>
    with SingleTickerProviderStateMixin {
  late String? _previewUrl = '';
  late int _reportId;
  late String _compnayCode = '';
  late int _tinhTrang;

  late bool _showBottomMenu = false;
  late bool _showAction = false;

  late StreamSubscription<SignedStreamArgs> _yeuCauThietKeSub;
  late List<AttachDocument> _documents;

  final String _titleText = 'YÊU CẦU THIẾT KẾ';

  @override
  void initState() {
    super.initState();
    _documents = <AttachDocument>[];
    final mainModel = context.read<MainPageModel>();
    _yeuCauThietKeSub = mainModel.documentSignedStream.stream.listen((event) {
      if (event.docType != DataHelper.phieuYeuCauThietKeName) return;
      if (event.documentId != _reportId) return;
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
    _yeuCauThietKeSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _showBottomMenu =
        _showAction ? ([1, 2, 3, 4, 5].contains(_tinhTrang)) : false;

    final yeuCauThietKeArgs = YeuCauThietKeArgs(
      tinhTrang: _tinhTrang,
      idAutoQC: _reportId,
      documentId: _reportId,
    );
    final menuKyDuyet = MenuYeuCauThietKe(
        parentContext: context,
        args: yeuCauThietKeArgs,
        onApproved: _onCommandApproved);

    return DocumentPreviewer(
        title: _titleText,
        documents: _documents,
        previewUrl: _previewUrl,
        showCommandMenu: _showBottomMenu,
        sheetMenu: menuKyDuyet,
        reportId: _reportId,
        documentCode: DataHelper.phieuYeuCauThietKeName,
        onDocumentLoad: _onLoadAttachFile);
  }

  Future<void> _loadReport() async {
    await refreshReport();
    final list =
        await YeuCauThietKeService.instance.loadAttachedDocs(_reportId);
    _documents.clear();
    setState(() {
      _documents.addAll(list);
    });
  }

  Future<void> refreshReport() async {
    final report =
        await YeuCauThietKeService.instance.loadReport(_reportId, _compnayCode);
    if (mounted) {
      setState(() {
        _previewUrl = (report.reportUrl);
      });
      YeuCauThietKeService.instance.loadOne(_reportId).then((value) {
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

  Future<bool> _onCommandApproved(bool isApproved, YeuCauThietKeArgs args) {
    return YeuCauThietKeService.instance.approve(args);
  }

  Future<String> _onLoadAttachFile(int reportId, int documentId) {
    return YeuCauThietKeService.instance.loadAttachedFile(reportId, documentId);
  }
}
