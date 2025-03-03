import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DocumentFileAttachView extends StatefulWidget {
  const DocumentFileAttachView(
      {Key? key, required this.departmentName, required this.reportId})
      : super(key: key);
  final String departmentName;
  final int reportId;

  @override
  State<DocumentFileAttachView> createState() => _DocumentFileAttachViewState();
}

class _DocumentFileAttachViewState extends State<DocumentFileAttachView> {
  final ValueNotifier<String> _filePath = ValueNotifier("");
  final List<AttachDocument> documents = [];

  late String _departmentName = widget.departmentName;
  late int _reportId = widget.reportId;

  late bool _isUploading = false;
  late double _uploadProgressValue = 0.0;
  late String _localFile = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _departmentName = widget.departmentName;
    _reportId = widget.reportId;
    final isHasFile = _filePath.value.isNotEmpty;

    final theme = Theme.of(context);
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildToolbarList(),
          ValueListenableBuilder(
              valueListenable: _filePath,
              builder: (context, value, child) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.white, border: Border.all(width: 1.0)),
                  constraints:
                      const BoxConstraints(minHeight: 30, maxHeight: 100),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          _filePath.value.isEmpty
                              ? 'Chưa chọn tập tin'
                              : _filePath.value,
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                          padding: const EdgeInsets.all(0.0),
                          onPressed: () {
                            setState(() {
                              _filePath.value = "";
                            });
                          },
                          disabledColor: Colors.black26,
                          color: theme.primaryColorLight,
                          icon: const Icon(
                            Icons.close,
                          )),
                      IconButton(
                          padding: const EdgeInsets.all(0.0),
                          onPressed:
                              (_reportId > 0 && isHasFile) ? _uploadFile : null,
                          disabledColor: Colors.black26,
                          color: theme.primaryColor,
                          icon: const Icon(
                            Icons.upload,
                          )),
                    ],
                  ),
                );
              }),
          _isUploading
              ? Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: LinearPercentIndicator(
                          animation: true,
                          lineHeight: 15.0,
                          animationDuration: 2500,
                          percent: _uploadProgressValue,
                          center: Text('${_uploadProgressValue * 100}%'),
                          progressColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(
                  height: 0.0,
                ),
          const SizedBox(
            height: 10.0,
          ),
          _buildFileList(),
        ],
      ),
    );
  }

  Widget _buildToolbarList() {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Chọn tập tin để tải lên:',
          textAlign: TextAlign.start,
          style:
              TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    _selectFile();
                  },
                  icon: Icon(
                    Icons.folder_open,
                    color: theme.primaryColor,
                  )),
              IconButton(
                  padding: const EdgeInsets.all(0.0),
                  onPressed: () => _loadDocumentList(),
                  icon: Icon(Icons.refresh, color: theme.primaryColor)),
            ],
          ),
        ),
      ],
    );
  }

  void _uploadFile() async {
    //
    try {
      setState(() {
        _uploadProgressValue = 0;
        _isUploading = true;
      });
      final document = await ApiCoreService.uploadAttachedFile(
        _departmentName,
        _reportId.toString(),
        '_',
        _localFile,
        _uploadFileCallback,
      );
      setState(() {
        _uploadProgressValue = 1;
      });
      if (document != null) {
        setState(() {
          documents.insert(0, document);
        });
        if (mounted) {
          UIHelper.showOk(context, 'Đã tải tập tin đính kèm lên máy chủ.');
        }
      }
    } catch (_) {
      UIHelper.showError(context,
          'Bạn cần cho phép Bivid App truy cập tập tin trên thiết bị này.');
    } finally {
      setState(() {
        _uploadProgressValue = 0;
        _isUploading = false;
      });
    }
  }

  void _selectFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        File file = File(result.files.single.path ?? '');
        _localFile = file.path;
        final fileName = _localFile.split('/').last;
        _filePath.value = fileName;
        setState(() {});
      } else {
        // User canceled the picker
      }
    } catch (_) {
      UIHelper.showError(context,
          'Bạn cần cho phép Bivid App truy cập tập tin trên thiết bị này.');
    }
  }

  Widget _buildFileList() {
    final Future<List<AttachDocument>> funcLoadDocumentList =
        _loadDocumentListAsync();
    return FutureBuilder<List<AttachDocument>>(
      future: funcLoadDocumentList,
      builder:
          (BuildContext context, AsyncSnapshot<List<AttachDocument>> snapshot) {
        return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int index) {
              final docItem = documents[index];
              return Card(
                child: ListTile(
                  title: Text('${docItem.fileName}${docItem.extension}'),
                  trailing: IconButton(
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () => _showDeleteAction(docItem),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ),
              );
            });
      },
    );
  }

  Future<void> _loadDocumentList() async {
    if (_reportId <= 0) return;
    //
    try {
      final list =
          await ApiCoreService.loadAttachedFiles(_departmentName, _reportId);
      documents.clear();
      setState(() {
        documents.addAll(list);
      });
    } catch (ex) {
      //
    }
  }

  Future<List<AttachDocument>> _loadDocumentListAsync() async {
    if (_reportId <= 0) {
      return [];
    }
    //
    try {
      final list =
          await ApiCoreService.loadAttachedFiles(_departmentName, _reportId);
      documents.clear();
      setState(() {
        documents.addAll(list);
      });

      return documents;
    } catch (ex) {
      //
    }
    return [];
  }

  void _showDeleteAction(AttachDocument doc) {
    final theme = Theme.of(context);

    final dlg = AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.rightSlide,
      title: 'Xác nhận xóa',
      desc:
          'Xóa bỏ tập tinh đính kèm ${doc.fileName}${doc.extension}, anh chị đồng ý không?',
      btnOkText: "Đồng ý",
      btnCancelText: "Không",
      btnOkColor: theme.primaryColor,
      btnOkIcon: Icons.check,
      btnCancelOnPress: () {
        // Navigator.pop(context, DialogAction.cancel);
      },
      btnOkOnPress: () async {
        try {
          final rs = await ApiCoreService.removeAttachedFile(
              doc.id!, doc.department!, doc.code!);
          if (rs) {
            if (mounted) {
              UIHelper.showOk(context, 'Xóa tập tin đính kèm thành công.');
              setState(() {
                documents.remove(doc);
              });
            }
          } else {
            if (mounted) {
              UIHelper.showError(context,
                  'Không thể xóa tập tin đính kèm thành công, vui lòng thử lại.');
            }
          }
        } catch (e) {
          UIHelper.showError(context,
              'Không thể xóa tập tin đính kèm thành công, vui lòng thử lại.');
        }
      },
    );
    dlg.show();
  }

  void _uploadFileCallback(item) {
    var percent = item / 100;
    if (percent >= 1) {
      percent = 0.90;
    }
    setState(() {
      _uploadProgressValue = percent;
    });
  }
}
