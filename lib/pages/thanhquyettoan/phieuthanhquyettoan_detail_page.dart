import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/dtos/danhmuc/company.dart';
import 'package:bividpharma/model/dtos/danhmuc/short_nhan_vien.dart';
import 'package:bividpharma/model/dtos/thanhquyettoan/phieu_thanh_quyet_toan.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/system/document_file_attached_view.dart';
import 'package:bividpharma/services/danhmuc_service.dart';
import 'package:bividpharma/services/thanhquyettoan_service.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:collection/collection.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

typedef PhieutTqtUpdateCallback = Future<int> Function(
    PhieuThanhQuyetToan value);

class PhieuThanhQuyetToanDetailPage extends StatefulWidget {
  const PhieuThanhQuyetToanDetailPage({Key? key}) : super(key: key);

  @override
  State<PhieuThanhQuyetToanDetailPage> createState() =>
      _PhieuThanhQuyetToanDetailPageState();
}

class _PhieuThanhQuyetToanDetailPageState
    extends State<PhieuThanhQuyetToanDetailPage> {
  int? idThanhQuyetToan;
  bool readOnly = false;

  final ValueNotifier<PhieuThanhQuyetToan> _formData =
      ValueNotifier(PhieuThanhQuyetToan());
  final _formKey = GlobalKey<FormBuilderState>();
  final _trinhKyViewKey = GlobalKey<FormBuilderState>();

  var _phieuTQT = PhieuThanhQuyetToan();

  final List<bool> _panelViews = [true, true, true];
  bool _loading = false;
  bool _loadingResource = false;

// Combo Source
  late ShortNhanVien _nguoiDeNghi = ShortNhanVien();
  final companySource = <Company>[];
  final employeeSource = <ShortNhanVien>[];
  var loaiThanhToanSource = <RadioItemData>[
    RadioItemData(1, 'Tiền mặt'),
    RadioItemData(2, "Chuyển khoản"),
  ];

// UI Components
  final List<DropdownMenuItem<String>> companyItems =
      <DropdownMenuItem<String>>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      UIHelper.setupLoading(context);
      await _loadOtherSource();
      await _loadFormData();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg = ModalRoute.of(context)!.settings.arguments as int?;
    idThanhQuyetToan = arg;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spinkit = SizedBox(
      height: 16.0,
      child: SpinKitThreeBounce(
        color: theme.primaryColor,
        size: 30.0,
      ),
    );

    return WillPopScope(
      onWillPop: () async {
        final dlg = AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.rightSlide,
          title: 'Thông báo',
          desc:
              'Đóng màn hình và dữ liệu đang nhập sẽ không được lưu. Anh chị đồng ý không?',
          btnOkColor: theme.primaryColor,
          btnCancelOnPress: () {},
          btnOkOnPress: _onClose,
        );
        dlg.show();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Thêm Đề Nghị Thanh Toán'),
          backgroundColor: theme.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: ValueListenableBuilder(
              valueListenable: _formData,
              builder: (context, PhieuThanhQuyetToan data, child) {
                return Column(
                  children: [
                    _loading ? spinkit : Container(),
                    FormBuilder(
                      key: _formKey,
                      // enabled: false,
                      onChanged: () {
                        _formKey.currentState!.save();
                        debugPrint(_formKey.currentState!.value.toString());
                      },
                      autovalidateMode: AutovalidateMode.always,
                      initialValue: data.toMap(),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 9.0,
                        ),
                        child: Column(
                          children: <Widget>[
                            FormBuilderField(
                                builder: (field) => Container(),
                                name: 'idThanhQuyetToan'),
                            _renderPart(),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        persistentFooterButtons: [
          _buildFooterCommand(),
        ],
      ),
    );
  }

  Widget _buildFooterCommand() {
    final theme = Theme.of(context);
    return Row(
      children: <Widget>[
        Expanded(
          child: ElevatedButton.icon(
              onPressed: (_loading || _loadingResource)
                  ? null
                  : () => _onSave(context, theme),
              style:
                  ElevatedButton.styleFrom(backgroundColor: theme.primaryColor),
              icon: const Icon(Icons.save),
              label: const Text(
                'Lưu',
                style: TextStyle(color: Colors.white),
              )),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: OutlinedButton(
            onPressed: () => _onClose(),
            style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1, color: theme.primaryColor),
                backgroundColor: Colors.transparent),
            child: Text(
              'Thoát',
              style: TextStyle(color: theme.colorScheme.error),
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderPart() {
    final theme = Theme.of(context);
    const bodyPadding =
        EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 10.0);
    final boxDecor = BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0)),
      boxShadow: [
        BoxShadow(
          color: theme.primaryColor,
          spreadRadius: 4,
          blurRadius: 25,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    );
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _panelViews[index] = !isExpanded;
        });
      },
      expandedHeaderPadding: const EdgeInsets.only(left: 10.0, right: 8.0),
      elevation: 2.0,
      dividerColor: theme.primaryColor,
      children: <ExpansionPanel>[
        ExpansionPanel(
            backgroundColor: _panelViews[0] ? theme.primaryColor : Colors.white,
            headerBuilder: (BuildContext context, bool isExpanded) =>
                UIHelper.buildExpanedHeaderTitle(
                    context, "1.Thông tin công ty", isExpanded),
            body: Container(
              decoration: boxDecor,
              child: Padding(
                padding: bodyPadding,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildCompanyLookup,
                    ]),
              ),
            ),
            isExpanded: _panelViews[0]),
        ExpansionPanel(
            backgroundColor: _panelViews[1] ? theme.primaryColor : Colors.white,
            headerBuilder: (BuildContext context, bool isExpanded) =>
                UIHelper.buildExpanedHeaderTitle(
                    context, "2.Thông tin chi tiết", isExpanded),
            body: Container(
              decoration: boxDecor,
              child: Padding(
                padding: bodyPadding,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      (_phieuTQT.soPhieuAuto ?? '').isEmpty
                          ? const SizedBox(
                              height: 0.0,
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 10.0,
                              ),
                              child: Text(
                                'Số phiếu: ${_phieuTQT.soPhieuAuto}',
                                style: TextStyle(
                                    color: theme.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200,
                            child: _buildNguoiQuyetToan(),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 6.0, top: 0.0, bottom: 0.0),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  '${_nguoiDeNghi.fullName}',
                                  style: TextStyle(
                                      color: theme.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  '${_nguoiDeNghi.chucVu}',
                                  style: TextStyle(
                                      color: theme.hintColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderRadioGroup(
                        activeColor: theme.primaryColor,
                        decoration: const InputDecoration(
                          labelText: 'Hình thức thanh toán',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                                width: 1.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                          ),
                        ),
                        name: 'hinhThucTT',
                        validator: FormBuilderValidators.required(),
                        options: loaiThanhToanSource
                            .map((item) => FormBuilderFieldOption(
                                  value: item.value,
                                  child: Text(
                                    item.description,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ))
                            .toList(growable: false),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      UIHelper.formBuilderTextField(
                        fieldName: 'soTK',
                        labelText: 'Số TK',
                        hasError: false,
                        readOnly: false,
                        onlyNumber: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildMultiTextField(
                          fieldName: 'nguoiHuongThu',
                          labelText: 'Người thụ hưởng'),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildMultiTextField(
                          fieldName: 'nganHang', labelText: 'Ngân hàng'),
                    ]),
              ),
            ),
            isExpanded: _panelViews[1]),
        ExpansionPanel(
            backgroundColor: _panelViews[2] ? theme.primaryColor : Colors.white,
            headerBuilder: (BuildContext context, bool isExpanded) =>
                UIHelper.buildExpanedHeaderTitle(
                    context, "3.Tập tin đính kèm", isExpanded),
            body: Container(
              decoration: boxDecor,
              child: Padding(
                padding: bodyPadding,
                child: DocumentFileAttachView(
                    departmentName: DepartmentEnum.PhieuQuyetToan.name,
                    reportId: _phieuTQT.idThanhQuyetToan),
              ),
            ),
            isExpanded: _panelViews[2]),
      ],
    );
  }

  Widget _buildMultiTextField(
      {String fieldName = '', String labelText = '', String? hintText}) {
    final theme = Theme.of(context);
    return FormBuilderTextField(
      name: fieldName,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54, width: 1.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        hintText: hintText ?? labelText,
      ),
      // initialValue: '',
      keyboardType: TextInputType.multiline,
      expands: false,
      minLines: 2,
      maxLines: 10,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );
  }

  Widget _buildNguoiQuyetToan() {
    return FormBuilderField<String>(
      key: const ValueKey("frm_thanhquyettoan_detail_page_nguoiQuyetToan"),
      name: 'nguoiQuyetToan',
      onChanged: (value) {
        var found =
            employeeSource.firstWhereOrNull((item) => item.maNhanvien == value);
        if (found != null) {
          _nguoiDeNghi = found;
        } else {
          _nguoiDeNghi = ShortNhanVien();
        }
        if (mounted) {
          //
          setState(() {});
        }
      },
      builder: (state) {
        return _buildNguoiDeNghiSearchBox(state);
      },
      validator: FormBuilderValidators.compose([]),
    );
  }

  Widget _buildNguoiDeNghiSearchBox(state) {
    return DropdownSearch<ShortNhanVien>(
      selectedItem: _nguoiDeNghi,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: 'Chọn người đề nghị',
          border: UIHelper.lookupInputBorder,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          errorText: state.errorText,
        ),
      ),
      dropdownBuilder: (context, selectedItem) {
        String tenNv = selectedItem == null ? '' : selectedItem.fullName ?? '';
        return Text(tenNv);
      },
      onChanged: (ShortNhanVien? data) {
        if (data == null) {
          state.didChange(null);
        } else {
          state.didChange(data.maNhanvien);
        }
      },
      asyncItems: (filter) =>
          DanhMucService.nhanvien_getShortList(filter: filter),
      compareFn: (i, s) => i.maCty == s.maCty && i.userName == i.userName,
      popupProps: PopupPropsMultiSelection.modalBottomSheet(
        showSearchBox: true,
        itemBuilder: (context, item, isSelected) =>
            UIHelper.buildPopupItemSearch(context, item.fullName,
                '${item.chucVu}\n${item.email}', isSelected, Icons.person),
      ),
    );
  }

  Widget get _buildCompanyLookup {
    return companyItems.isNotEmpty
        ? FormBuilderDropdown<String>(
            name: 'maCongTy',
            decoration: InputDecoration(
              labelText: 'Công ty',
              hintText: 'Chọn công ty',
              border: UIHelper.lookupInputBorder,
            ),
            validator: FormBuilderValidators.compose(
                [FormBuilderValidators.required()]),
            items: companyItems,
            initialValue: '003',
            onChanged: (val) {
              if (val == "") {
                _formKey.currentState?.fields['maCongTy']?.didChange(null);
              }
            },
            valueTransformer: (val) => val?.toString(),
          )
        : const SizedBox(height: 1.0);
  }

/* ******************************************** */
  _onSave(BuildContext context, ThemeData theme) {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      _formKey.currentState!.save();
      final json = _formKey.currentState!.value.toString();
      final dlg = AwesomeDialog(
        context: context,
        dialogType: DialogType.noHeader,
        animType: AnimType.rightSlide,
        title: 'Xác nhận lưu',
        desc: 'Lưu nội dung Giấy tạm ứng. Anh chị đồng ý không?',
        btnOkColor: theme.primaryColor,
        btnCancelOnPress: () {},
        btnOkOnPress: _callSaveApi,
      );
      dlg.show();
    }
  }

  _onClose() {
    if (mounted) {
      Navigator.pop(context);
    }
  }

  _callSaveApi() async {
    final theme = Theme.of(context);
    setState(() {
      _loading = true;
    });
    await EasyLoading.show(
      status: 'Đang lưu dữ liệu...',
      maskType: EasyLoadingMaskType.clear,
    );
    try {
      PhieutTqtUpdateCallback fnUpdate =
          PhieuThanhQuyetToanService.phieuTQT_Create;
      final orgMap = _phieuTQT.toMap();
      final mapValue = _formKey.currentState?.value;
      final newMap = mergeMaps(orgMap, Map<String, dynamic>.from(mapValue!));

      // Edit custom fields
      // newMap['ngayLamDon'] = newMap['ngayLamDon'].toString();

      if (idThanhQuyetToan != null && idThanhQuyetToan! > 0) {
        fnUpdate = PhieuThanhQuyetToanService.phieuTQT_Update;
      }
      final newItem = PhieuThanhQuyetToan.fromMap(newMap);
      if (newItem.hasConvertError) {
        throw Exception('Không thể lưu Phiếu thanh quyết toán.');
      }
      final iRs = await fnUpdate.call(newItem);

      if (iRs <= 0) {
        throw Exception('Không thể lưu Phiếu thanh quyết toán.');
      } else {
        if (idThanhQuyetToan == null) {
          _phieuTQT.idThanhQuyetToan = iRs;
          idThanhQuyetToan = iRs;
          _formKey.currentState?.fields['idThanhQuyetToan']?.didChange(iRs);
          _loadFormData();
        }
      }
      if (mounted) {
        UIHelper.showText(context,
            okText: 'Lưu Phiếu thanh quyết toán thành công.',
            backColor: theme.primaryColor);
      }
    } catch (e) {
      if (mounted) {
        UIHelper.showText(context,
            okText: 'Không thể lưu Phiếu thanh quyết toán.', showError: true);
      }
    } finally {
      await EasyLoading.dismiss();
      setState(() {
        _loading = false;
      });
    }
  }

  _loadOtherSource() async {
    if (mounted) {
      setState(() {
        _loadingResource = true;
      });
    }
    companySource.clear();
    final comps = await DanhMucService.company_getList();
    companySource.addAll(comps);

    companyItems.clear();
    companyItems.addAll(companySource
        .map((item) => UIHelper.buildCompanyDropdownItem(item))
        .toList());
    if (mounted) setState(() {});

    employeeSource.clear();
    final emps = await DanhMucService.nhanvien_getShortList();
    employeeSource.addAll(emps);

    if (mounted) {
      setState(() {
        _loadingResource = false;
      });
    }
  }

  _loadFormData() async {
    try {
      if (mounted) {
        setState(() {
          _loading = true;
        });
      }

      final model = context.read<MainPageModel>();
      final userName = model.loginedUser.userName;
      final foundNv = await DanhMucService.nhanvien_getOne(userName: userName);
      if (foundNv != null) {
        setState(() {
          _nguoiDeNghi = foundNv;
        });
      }

      if (idThanhQuyetToan != null && idThanhQuyetToan! > 0) {
        // Edit form
        final foundData =
            await PhieuThanhQuyetToanService.phieuThanhQuyetToan_LoadOne(
                idThanhQuyetToan!);
        if (foundData != null) {
          _phieuTQT = foundData;
        }
      } else {
        // new Form
        setState(() {
          _phieuTQT.nguoiQuyetToan = _nguoiDeNghi.maNhanvien;
          _phieuTQT.maCongTy = foundNv?.maCty ?? '';
          _phieuTQT.hinhThucTt = 1;
          _phieuTQT.soTk = '';
          _phieuTQT.nguoiHuongThu = '';
          _phieuTQT.nganHang = "";
          _phieuTQT.idThanhQuyetToan = 0;
        });
      }
      _formData.value = _phieuTQT;

      if (_formKey.currentState != null) {
        final mapValue = _phieuTQT.toMap();
        mapValue['maCongTy'] = _phieuTQT.maCongTy;
        mapValue['nguoiQuyetToan'] = _phieuTQT.nguoiQuyetToan;
        mapValue['hinhThucTt'] = _phieuTQT.hinhThucTt;
        mapValue['soTk'] = _phieuTQT.soTk?.toString();
        mapValue['nguoiHuongThu'] = _phieuTQT.nguoiHuongThu?.toString();
        mapValue['nganHang'] = _phieuTQT.nganHang?.toString();
        mapValue['idThanhQuyetToan'] = _phieuTQT.idThanhQuyetToan;

        _formKey.currentState!.patchValue(mapValue);
      }
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }
}
