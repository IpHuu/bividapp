import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/dtos/danhmuc/short_nhan_vien.dart';
import 'package:bividpharma/model/dtos/giaytamung/giay_tam_ung.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/giaytamung/giaytamung_item.dart';
import 'package:bividpharma/services/danhmuc_service.dart';
import 'package:bividpharma/services/phieutamung_service.dart';
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

class GiayTamUngListPage extends DocumentFullListPage {
  GiayTamUngListPage({Key? key})
      : super(key: key, newPageUrl: ScreenRouteName.phieuTamUngDetailPage);

  StreamController<SignedStreamArgs>? _streamController;

  @override
  String get title => 'PHIẾU TẠM ỨNG';

  @override
  Widget createListItem(IDocument document, bool showAction) {
    GiayTamUng item = document as GiayTamUng;
    return GiayTamUngItem(
        giaytamung: item,
        showAction: showAction,
        commandCallback: commandCallback);
  }

  @override
  Future<List<IDocument>> loadPaged(DocumentSearchParam args) async {
    var list = await GiayTamUngService.giayTamUng_LoadPagedData(
        args.pageNo ?? 1,
        args.pageSize ?? 10,
        args.finished ?? false,
        args.filterType ?? 0,
        args.searchText ?? '');
    return list;
  }

  @override
  State<DocumentFullListPage> createState() => _GiayTamUngListPageState();

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

class _GiayTamUngListPageState extends DocumentFullListPageState {
  _GiayTamUngListPageState() : super() {
    fetchMyData = _loadMyData;
  }
  final employeeSource = <ShortNhanVien>[];
  final _trinhKyViewKey = GlobalKey<FormBuilderState>();

  late ShortNhanVien _nguoiTruongBP = ShortNhanVien();
  late ShortNhanVien _nguoiPTGD = ShortNhanVien();
  late ShortNhanVien _nguoiPhoPKT = ShortNhanVien();
  late ShortNhanVien _nguoiKeToanTruong = ShortNhanVien();
  late ShortNhanVien _nguoiTongGiamDoc = ShortNhanVien();

  @override
  Widget build(BuildContext context) {
    widget.commandCallback = _onActionCommand;
    EasyLoading.instance
      ..textColor = Theme.of(context).primaryColor
      ..indicatorColor = Theme.of(context).primaryColor;
    return super.build(context);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      employeeSource.clear();
      final emps = await DanhMucService.nhanvien_getShortList();
      employeeSource.addAll(emps);
    });
  }

  void _onActionCommand(dynamic arg) {
    GiayTamUng item = arg as GiayTamUng;
    UIHelper.showTrinhKyAction(context, (action, item) {
      _onPressed(action, item as GiayTamUng);
    }, item);
  }

  void _onPressed(DocumentSignAction action, GiayTamUng item) {
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
          ScreenRouteName.previewTamUngPage,
          arguments: DocumentArgs(
              maCongTy: item.maCongTy,
              reportId: item.idTamUng,
              tinhTrang: item.tinhTrang,
              showAction: false),
        );
        break;
      case DocumentSignAction.post:
        _onPostCommand(item);
        break;
    }
  }

  void _onPostCommand(GiayTamUng item) {
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

        item.listTruongBp = _trinhKyViewKey
            .currentState?.fields['listTruongBp']?.value as String;
        item.listDaiDienCTy = _trinhKyViewKey
            .currentState?.fields['listDaiDienCTy']?.value as String;
        item.listKeToanPho = _trinhKyViewKey
            .currentState?.fields['listKeToanPho']?.value as String;
        item.listKeToan =
            _trinhKyViewKey.currentState?.fields['listKeToan']?.value as String;
        item.listTgd =
            _trinhKyViewKey.currentState?.fields['listTgd']?.value as String;

        final ok = await GiayTamUngService.giaytamung_TrinhKy(item);
        if (ok) {
          if (mounted) UIHelper.showOk(context, 'Trình ký hồ sơ thành công.');
          final rfItem =
              await GiayTamUngService.giayTamUng_LoadOne(item.idTamUng);
          if (rfItem != null) {
            item = GiayTamUng.fromJson(rfItem.toJson());
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

  void _onEditCommand(GiayTamUng item) {
    MyNavigation.intentWithData(
      ScreenRouteName.phieuTamUngDetailPage,
      arguments: item.idTamUng,
    );
  }

  void _onDeleteCommand(GiayTamUng item) {
    final theme = Theme.of(context);
    final dlg = AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.rightSlide,
      title: 'Xác nhận hủy',
      desc: 'Hủy bỏ phiếu này, anh chị đồng ý không?',
      btnOkText: "Đồng ý",
      btnCancelText: "Không",
      btnOkColor: theme.primaryColor,
      btnOkIcon: Icons.check,
      btnCancelOnPress: () {
        // Navigator.pop(context, DialogAction.cancel);
      },
      btnOkOnPress: () async {
        try {
          final rs = await GiayTamUngService.giaytamung_Delete(item);
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
      },
    );
    dlg.show();
  }

  Widget _builduiTrinhKyView(GiayTamUng item) {
    return FormBuilder(
      key: _trinhKyViewKey,
      autovalidateMode: AutovalidateMode.always,
      initialValue: const {
        'listTruongBp': '',
        'listDaiDienCTy': '',
        'listKeToanPho': '',
        'listKeToan': '',
        'listTgd': '',
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            _buildEmployeeSearchField(
                'listTruongBp', 'Trưởng bộ phận', _nguoiTruongBP),
            const SizedBox(
              height: 12.0,
            ),
            _buildEmployeeSearchField('listDaiDienCTy', 'Phó TGĐ', _nguoiPTGD),
            const SizedBox(
              height: 12.0,
            ),
            _buildEmployeeSearchField(
                'listKeToanPho', 'Kế toán phó', _nguoiPhoPKT),
            const SizedBox(
              height: 12.0,
            ),
            _buildEmployeeSearchField(
                'listKeToan', 'Kế toán trưởng', _nguoiKeToanTruong),
            const SizedBox(
              height: 12.0,
            ),
            _buildEmployeeSearchField(
                'listTgd', 'Tổng giám đốc', _nguoiTongGiamDoc),
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
            itemBuilder: _employeePopupItemBuilder,
          ),
        );
      },
      validator:
          FormBuilderValidators.compose([FormBuilderValidators.required()]),
    );
  }

  Widget _employeePopupItemBuilder(
    BuildContext context,
    ShortNhanVien? item,
    bool isSelected,
  ) {
    final String chuVu = item?.chucVu ?? '';
    final String email = item?.email ?? '';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        contentPadding: EdgeInsets.zero,
        title: Text(item?.fullName ?? ''),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          (chuVu.isNotEmpty)
              ? Text(
                  item?.chucVu ?? '',
                )
              : const SizedBox(
                  height: 0.0,
                ),
          (email.isNotEmpty)
              ? Text(email)
              : const SizedBox(
                  height: 0.0,
                ),
        ]),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.person),
        ),
      ),
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
    return GiayTamUngService.giaytamung_GetMyData(arg);
  }
}
