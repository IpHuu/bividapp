import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/dtos/danhmuc/short_nhan_vien.dart';
import 'package:bividpharma/model/dtos/thanhquyettoan/phieu_thanh_quyet_toan.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/thanhquyettoan/thanhquyettoan_item.dart';
import 'package:bividpharma/services/danhmuc_service.dart';
import 'package:bividpharma/services/thanhquyettoan_service.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/ui/widgets/document_fulllist_page.dart';
import 'package:collection/collection.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class PhieuThanhQuyetToanListPage extends DocumentFullListPage {
  PhieuThanhQuyetToanListPage({Key? key})
      : super(key: key, newPageUrl: ScreenRouteName.phieuTqtDetailPage);
  StreamController<SignedStreamArgs>? _streamController;

  @override
  String get title => 'ĐỀ NGHỊ THANH TOÁN';

  @override
  Widget createListItem(IDocument document, bool showAction) {
    PhieuThanhQuyetToan item = document as PhieuThanhQuyetToan;
    return PhieuThanhQuyetToanItem(
        phieuThanhQuyetToan: item,
        showAction: showAction,
        commandCallback: commandCallback);
  }

  @override
  Future<List<IDocument>> loadPaged(DocumentSearchParam args) async {
    var list =
        await PhieuThanhQuyetToanService.phieuThanhQuyetToan_LoadPagedData(
            args.pageNo ?? 1,
            args.pageSize ?? 10,
            args.finished ?? false,
            args.filterType ?? 0,
            args.searchText ?? '');
    return list;
  }

  @override
  State<DocumentFullListPage> createState() =>
      _PhieuThanhQuyetToanListPageState();

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

class _PhieuThanhQuyetToanListPageState extends DocumentFullListPageState {
  _PhieuThanhQuyetToanListPageState() : super() {
    fetchMyData = _loadMyData;
  }
  final employeeSource = <ShortNhanVien>[];
  final _trinhKyViewKey = GlobalKey<FormBuilderState>();

  // Người ký duyệt
  late ShortNhanVien _nguoiTruongBP = ShortNhanVien();
  late ShortNhanVien _nguoiPTGD = ShortNhanVien();
  late ShortNhanVien _nguoiKeToanThanhToan = ShortNhanVien();
  late ShortNhanVien _nguoiTongGiamDoc = ShortNhanVien();

  @override
  Widget build(BuildContext context) {
    widget.commandCallback = _onActionCommand;
    EasyLoading.instance
      ..textColor = Theme.of(context).primaryColor
      ..indicatorColor = Theme.of(context).primaryColor;
    return super.build(context);
  }

  void _onActionCommand(dynamic arg) {
    PhieuThanhQuyetToan item = arg as PhieuThanhQuyetToan;
    UIHelper.showTrinhKyAction(context, (action, item) {
      _onPressed(action, item as PhieuThanhQuyetToan);
    }, item);
  }

  void _onPressed(DocumentSignAction action, PhieuThanhQuyetToan item) {
    Navigator.pop(context);
    switch (action) {
      case DocumentSignAction.add:
        break;
      case DocumentSignAction.edit:
        _onEditCommand(item);
        break;
      case DocumentSignAction.delete:
        _onDeleteCommand(item);
        break;
      case DocumentSignAction.preview:
        MyNavigation.intentWithData(
          ScreenRouteName.previewTQTPage,
          arguments: DocumentArgs(
              maCongTy: item.maCongTy,
              reportId: item.idThanhQuyetToan,
              tinhTrang: item.tinhTrang,
              showAction: false),
        );
        break;
      case DocumentSignAction.post:
        _onPostCommand(item);
        break;
    }
  }

  Widget _builduiTrinhKyView(PhieuThanhQuyetToan item) {
    return FormBuilder(
      key: _trinhKyViewKey,
      autovalidateMode: AutovalidateMode.always,
      initialValue: const {
        'listTruongBP': '',
        'listDaiDienCTy': '',
        'listKeToan': '',
        'listTGD': '',
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            _buildEmployeeSearchField(
                'listTruongBP', 'Trưởng bộ phận', _nguoiTruongBP),
            const SizedBox(
              height: 12.0,
            ),
            _buildEmployeeSearchField('listDaiDienCTy', 'Phó TGĐ', _nguoiPTGD),
            const SizedBox(
              height: 12.0,
            ),
            _buildEmployeeSearchField(
                'listKeToan', 'Kế toán thanh toán', _nguoiKeToanThanhToan),
            const SizedBox(
              height: 12.0,
            ),
            _buildEmployeeSearchField(
                'listTGD', 'Tổng giám đốc', _nguoiTongGiamDoc),
          ],
        ),
      ),
    );
  }

  Widget _buildEmployeeSearchField(
      String fieldName, String labelText, ShortNhanVien selectedItem) {
    return FormBuilderField<String>(
      key: ValueKey("frm_giaytamung_trinhkyview_$fieldName"),
      name: fieldName,
      onChanged: (value) {
        var found =
            employeeSource.firstWhereOrNull((item) => item.userName == value);
        if (found != null) {
          selectedItem = found;
        } else {
          selectedItem = ShortNhanVien();
        }
      },
      builder: (state) {
        return DropdownSearch<ShortNhanVien>(
          selectedItem: selectedItem,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: labelText,
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              errorText: state.errorText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.all(3.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54, width: 5.0),
              ),
            ),
          ),
          dropdownBuilder: (context, selectedItem) {
            String fullName =
                selectedItem == null ? '' : selectedItem.fullName ?? '';
            return Text(fullName);
          },
          onChanged: (ShortNhanVien? data) {
            if (data == null) {
              state.didChange(null);
            } else {
              state.didChange(data.userName);
            }
          },
          asyncItems: (filter) =>
              DanhMucService.nhanvien_getShortList(filter: filter),
          compareFn: (i, s) => i.maNhanvien == s.maNhanvien,
          popupProps: PopupPropsMultiSelection.modalBottomSheet(
            showSearchBox: true,
            itemBuilder: (context, item, isSelected) =>
                UIHelper.buildPopupItemSearch(context, item.fullName,
                    '${item.chucVu}\n${item.email}', isSelected, Icons.person),
          ),
        );
      },
      validator:
          FormBuilderValidators.compose([FormBuilderValidators.required()]),
    );
  }

  Future<List<IDocument>> _loadMyData(
      pageNo, pageItems, finished, filterType, searchText) {
    var arg = DocumentSearchParam(
        filterType: filterType,
        finished: finished,
        pageNo: pageNo,
        pageSize: 20,
        searchText: searchText);
    return PhieuThanhQuyetToanService.phieuTQT_GetMyData(arg);
  }

  void _onEditCommand(PhieuThanhQuyetToan item) {
    MyNavigation.intentWithData(
      ScreenRouteName.phieuTqtDetailPage,
      arguments: item.idThanhQuyetToan,
    );
  }

  void _onPostCommand(PhieuThanhQuyetToan item) {
    final theme = Theme.of(context);
    final dlg = AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.noHeader,
      body: _builduiTrinhKyView(item),
      btnCancelOnPress: () => Navigator.pop(context, DialogAction.cancel),
      btnOkOnPress: () {
        if (!(_trinhKyViewKey.currentState?.saveAndValidate() ?? false)) return;
        Navigator.pop(context, DialogAction.ok);
      },
      btnOkText: "Trình ký",
      btnOkColor: theme.primaryColor,
      btnOkIcon: Icons.check,
      btnCancelText: "Đóng",
      autoDismiss: false,
      onDismissCallback: (type) {
        //
      },
    );
    dlg.show().then((rs) async {
      if (rs == DialogAction.cancel) return;
      try {
        await EasyLoading.show(
          status: 'Đang trình ký...',
          maskType: EasyLoadingMaskType.clear,
        );
/*
        'listTruongBP': '',
        'listDaiDienCTy': '',
        'listKeToan': '',
        'listTGD': '',
*/
        item.listTruongBp = _trinhKyViewKey
            .currentState?.fields['listTruongBP']?.value as String;
        item.listDaiDienCTy = _trinhKyViewKey
            .currentState?.fields['listDaiDienCTy']?.value as String;
        item.listKeToan =
            _trinhKyViewKey.currentState?.fields['listKeToan']?.value as String;
        item.listTgd =
            _trinhKyViewKey.currentState?.fields['listTGD']?.value as String;

        final ok = await PhieuThanhQuyetToanService.phieuTQT_TrinhKy(item);
        if (ok) {
          if (mounted) UIHelper.showOk(context, 'Trình ký hồ sơ thành công.');
          final rfItem =
              await PhieuThanhQuyetToanService.phieuThanhQuyetToan_LoadOne(
                  item.idThanhQuyetToan);
          if (rfItem != null) {
            item = PhieuThanhQuyetToan.fromJson(rfItem.toJson());
          }
        } else {
          if (mounted) {
            UIHelper.showError(
                context, 'Không thể trình ký hồ sơ, vui lòng thử lại sau.');
          }
        }
      } catch (ex) {
        UIHelper.showError(
            context, 'Không thể trình ký hồ sơ, vui lòng thử lại sau.');
      } finally {
        await EasyLoading.dismiss();
      }
    });
  }

  void _onDeleteCommand(PhieuThanhQuyetToan item) {
    final dlg = UIHelper.dialogCreateDelete(context, okCallback: () async {
      try {
        final rs = await PhieuThanhQuyetToanService.phieuTQT_Delete(item);
        if (rs) {
          if (mounted) {
            UIHelper.showOk(context, 'Hủy phiếu thành công.');
            setState(() {
              item.isHuy = true;
            });
          }
        } else {
          if (mounted) {
            UIHelper.showError(
                context, 'Không thể hủy phiếu, vui lòng thử lại.');
          }
        }
      } catch (e) {
        UIHelper.showError(context, 'Không thể hủy phiếu, vui lòng thử lại.');
      }
    });
    dlg.show();
  }
}
