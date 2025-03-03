import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/danhmuc/company.dart';
import 'package:bividpharma/model/dtos/danhmuc/currency.dart';
import 'package:bividpharma/model/dtos/danhmuc/short_dxmh.dart';
import 'package:bividpharma/model/dtos/danhmuc/short_khcv.dart';
import 'package:bividpharma/model/dtos/danhmuc/short_nhan_vien.dart';
import 'package:bividpharma/model/dtos/giaytamung/giay_tam_ung.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/system/document_file_attached_view.dart';
import 'package:bividpharma/services/danhmuc_service.dart';
import 'package:bividpharma/services/phieutamung_service.dart';
import 'package:bividpharma/ui/ui_helper.dart';
// import 'package:bividpharma/ui/ui_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

typedef GiayTampUngUpdateCallback = Future<int> Function(GiayTamUng value);

class GiayTamUngDetailPage extends StatefulWidget {
  const GiayTamUngDetailPage({Key? key}) : super(key: key);

  @override
  State<GiayTamUngDetailPage> createState() => _GiayTamUngDetailState();
}

class _GiayTamUngDetailState extends State<GiayTamUngDetailPage>
    with TickerProviderStateMixin {
  int? idTamUng;
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;

  final ValueNotifier<GiayTamUng> _formData = ValueNotifier(GiayTamUng());
  var _giayTamUng = GiayTamUng();

  final _formKey = GlobalKey<FormBuilderState>();
  bool _nguoiNhanBanGiaoHasError = false;
  bool _nguoiLamDonHasError = false;
  bool _loading = false;
  bool _loadingResource = false;

  // bool _companyHasError = false;
  // bool _tongThoiGianHasError = false;

  late ShortNhanVien _nguoiDeNghi = ShortNhanVien();
  late ShortKhcv _khcvSelectedItem = ShortKhcv();
  late ShortDxmh _dxmhSelectedItem = ShortDxmh();

  final companySource = <Company>[];
  final currencySource = <Currency>[];
  final employeeSource = <ShortNhanVien>[];
  final khcvSource = <ShortKhcv>[];
  final dxmhSource = <ShortDxmh>[];
  final _numberFormater = NumberFormat("#,##0.00", "en_US");

  final List<DropdownMenuItem<String>> companyItems =
      <DropdownMenuItem<String>>[];
  final List<DropdownMenuItem<String>> currencyItems =
      <DropdownMenuItem<String>>[];

  final List<bool> _panelViews = [true, true, true, true];

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
    idTamUng = arg;
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
          title: const Text('Thêm Phiếu Tạm Ứng'),
          backgroundColor: theme.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: ValueListenableBuilder(
              valueListenable: _formData,
              builder: (context, GiayTamUng data, child) {
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
                                name: 'idTamUng'),
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
      GiayTampUngUpdateCallback fnUpdate = GiayTamUngService.giaytamung_Create;
      final orgMap = _giayTamUng.toMap();
      final mapValue = _formKey.currentState?.value;
      final newMap = mergeMaps(orgMap, Map<String, dynamic>.from(mapValue!));

      // Edit custom fields
      newMap['tienTamUng'] = _numberFormater.parse(newMap['tienTamUng']);
      newMap['ngayTamUng'] = newMap['ngayTamUng'].toString();

      if (idTamUng != null) {
        fnUpdate = GiayTamUngService.giaytamung_Update;
      }
      final newItem = GiayTamUng.fromMap(newMap);
      if (newItem.hasConvertError) {
        throw Exception('Không thể lưu Giấy tạm ứng.');
      }
      final iRs = await fnUpdate.call(newItem);

      if (iRs <= 0) {
        throw Exception('Không thể lưu Giấy tạm ứng.');
      } else {
        if (idTamUng == null) {
          idTamUng = iRs;
          _formKey.currentState?.fields['idTamUng']?.didChange(iRs);
          _loadFormData();
        }
      }
      if (mounted) {
        UIHelper.showText(context,
            okText: 'Lưu Giấy tạm ứng thành công.',
            backColor: theme.primaryColor);
      }
    } catch (e) {
      if (mounted) {
        UIHelper.showText(context,
            okText: 'Không thể lưu Giấy tạm ứng.', showError: true);
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

  _loadCurrency() async {
    currencySource.clear();
    if (_giayTamUng.maCongTy.isNotEmpty) {
      final curs =
          await DanhMucService.currency_getList(filter: _giayTamUng.maCongTy);
      currencySource.addAll(curs);
    }
    currencyItems.clear();
    currencyItems.addAll(currencySource
        .map((item) => _buildCurrencyDropdownItem(item))
        .toList());

    if (mounted) setState(() {});
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

      if (idTamUng != null && idTamUng! > 0) {
        // Edit form
        final foundData = await GiayTamUngService.giayTamUng_LoadOne(idTamUng!);
        if (foundData != null) {
          _giayTamUng = foundData;
        }
      } else {
        // new Form
        setState(() {
          _giayTamUng.idTamUng = 0;
          _giayTamUng.maCongTy = foundNv?.maCty ?? '';
          _giayTamUng.nguoiTamUng = _nguoiDeNghi.maNhanvien ?? '';
          _giayTamUng.ngayTamUng = DateTime.now();
          _giayTamUng.tienTamUng = 0.0;
          _giayTamUng.ngoaiTe = 'VND';
        });
      }

      _formData.value = _giayTamUng;
      if (_formKey.currentState != null) {
        final mapValue = _giayTamUng.toMap();
        mapValue['nguoiTamUng'] = _giayTamUng.nguoiTamUng;
        mapValue['ngayTamUng'] = _giayTamUng.ngayTamUng;
        mapValue['tienTamUng'] =
            _numberFormater.format(_giayTamUng.tienTamUng ?? 0);
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

  DropdownMenuItem<String> _buildCurrencyDropdownItem(Currency item) {
    return DropdownMenuItem<String>(
      key: ValueKey('${item.maCty}-${item.maNt}'),
      alignment: AlignmentDirectional.centerStart,
      value: item.maNt,
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${item.maNt}',
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderTitle(String title, bool isExpaned) {
    final theme = Theme.of(context);
    final backColor = isExpaned ? theme.primaryColor : Colors.white;
    final fontColor = isExpaned ? Colors.white : theme.primaryColor;
    return Container(
      color: backColor,
      constraints: const BoxConstraints(
        maxHeight: 10.0,
        minHeight: 10.0,
      ),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.only(left: 10.0),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: fontColor),
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
              _loadCurrency();
            },
            valueTransformer: (val) => val?.toString(),
          )
        : const SizedBox(height: 1.0);
  }

  Widget get _buildCurrencyLookup {
    return currencyItems.isNotEmpty
        ? FormBuilderDropdown<String>(
            name: 'ngoaiTe',
            decoration: const InputDecoration(
              labelText: 'Loại tiền',
              hintText: 'Chọn loại tiền',
              constraints: BoxConstraints(
                maxWidth: 100,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
            initialValue: null,
            validator: FormBuilderValidators.compose(
                [FormBuilderValidators.required()]),
            items: currencyItems,
            onChanged: (val) {
              if (val == "") {
                _formKey.currentState?.fields['ngoaiTe']?.didChange(null);
              }
            },
            valueTransformer: (val) => val?.toString(),
          )
        : const SizedBox(height: 1.0);
  }

  Widget get _buildKhcvLookup {
    return FormBuilderField<int?>(
      key: const ValueKey("frm_giaynghiphep_detail_page_idKeHoachCongViec"),
      name: 'idKeHoachCongViec',
      onChanged: (value) {
        var found = khcvSource
            .firstWhereOrNull((item) => item.idKeHoachCongViec == value);
        if (found != null) {
          _khcvSelectedItem = found;
        } else {
          _khcvSelectedItem = ShortKhcv();
        }
      },
      builder: (state) {
        return DropdownSearch<ShortKhcv>(
          selectedItem: _khcvSelectedItem,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: 'Chọn kế hoạch công việc',
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              errorText: state.errorText,
            ),
          ),
          dropdownBuilder: (context, selectedItem) {
            String soPhieu =
                selectedItem == null ? '' : selectedItem.soPhieuAuto ?? '';
            // String title = selectedItem?.veViec ?? '';

            return Text(soPhieu);
          },
          onChanged: (ShortKhcv? data) {
            if (data == null) {
              state.didChange(null);
            } else {
              state.didChange(data.idKeHoachCongViec);
            }
          },
          asyncItems: (filter) =>
              DanhMucService.khcv_getShortList(maCongTy: _giayTamUng.maCongTy),
          compareFn: (i, s) => i.idKeHoachCongViec == s.idKeHoachCongViec,
          popupProps: PopupPropsMultiSelection.modalBottomSheet(
            showSearchBox: true,
            itemBuilder: (context, item, isSelected) => _buildPopupItemBuilder(
                context, item.veViec, item.soPhieuAuto, isSelected),
          ),
        );
      },
      validator: FormBuilderValidators.compose([]),
    );
  }

  Widget get _buildDxmhLookup {
    return FormBuilderField<int>(
      key: const ValueKey("frm_giaynghiphep_detail_page_idDeXuatMH"),
      name: 'idDeXuatMH',
      onChanged: (value) {
        var found =
            dxmhSource.firstWhereOrNull((item) => item.idDeXuatMh == value);
        if (found != null) {
          _dxmhSelectedItem = found;
        } else {
          _dxmhSelectedItem = ShortDxmh();
        }
      },
      builder: (state) {
        return DropdownSearch<ShortDxmh>(
          selectedItem: _dxmhSelectedItem,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: 'Chọn đề xuất mua hàng',
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              errorText: state.errorText,
            ),
          ),
          dropdownBuilder: (context, selectedItem) {
            String soPhieu =
                selectedItem == null ? '' : selectedItem.soPhieuAuto ?? '';
            // String title = selectedItem?.lyDoDeXuat ?? '(Không có nội dung)';
            return Text(soPhieu);
          },
          onChanged: (ShortDxmh? data) {
            if (data == null) {
              state.didChange(null);
            } else {
              state.didChange(data.idDeXuatMh);
            }
          },
          asyncItems: (filter) =>
              DanhMucService.dxmh_getShortList(maCongTy: _giayTamUng.maCongTy),
          compareFn: (i, s) => i.idDeXuatMh == s.idDeXuatMh,
          popupProps: PopupPropsMultiSelection.modalBottomSheet(
            showSearchBox: true,
            itemBuilder: (context, item, isSelected) => _buildPopupItemBuilder(
                context, item.lyDoDeXuat, item.soPhieuAuto, isSelected),
          ),
        );
      },
      validator: FormBuilderValidators.compose([]),
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
            headerBuilder: (BuildContext context, bool isExpanded) {
              return _buildHeaderTitle("1.Thông tin công ty", isExpanded);
            },
            body: Container(
              decoration: boxDecor,
              child: Padding(
                padding: bodyPadding,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      _buildCompanyLookup,
                      const SizedBox(
                        height: 10.0,
                      ),
                      UIHelper.formBuilderDateTimeField(
                        fieldName: 'ngayTamUng',
                        labelText: 'Ngày tạm ứng',
                        suffixCallback: null,
                      ),
                    ]),
              ),
            ),
            isExpanded: _panelViews[0]),
        ExpansionPanel(
            backgroundColor: _panelViews[1] ? theme.primaryColor : Colors.white,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return _buildHeaderTitle("2.Thông tin người đề nghị", isExpanded);
            },
            body: Container(
              decoration: boxDecor,
              child: Padding(
                padding: bodyPadding,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _giayTamUng.soPhieuAuto.isEmpty
                          ? const SizedBox(
                              height: 0.0,
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 0.0,
                                left: 10.0,
                              ),
                              child: Text(
                                'Số phiếu: ${_giayTamUng.soPhieuAuto}',
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
                            child: UIHelper.formBuilderTextField(
                                fieldName: 'nguoiTamUng',
                                labelText: 'Người đề nghị',
                                readOnly: true,
                                hasError: false,
                                suffixCallback: null),
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
                    ]),
              ),
            ),
            isExpanded: _panelViews[1]),
        ExpansionPanel(
            backgroundColor: _panelViews[2] ? theme.primaryColor : Colors.white,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return _buildHeaderTitle("3.Nội dung chi tiết", isExpanded);
            },
            body: Container(
              decoration: boxDecor,
              child: Padding(
                padding: bodyPadding,
                child: Column(children: [
                  Row(
                    children: [
                      SizedBox(width: 180, child: _buildKhcvLookup),
                      Expanded(child: _buildDxmhLookup),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 140,
                        child: FormBuilderTextField(
                          key: const ValueKey(
                              "frm_giaytamung_detail_page_tienTamUng"),
                          name: 'tienTamUng',
                          decoration: const InputDecoration(
                            labelText: 'Tiền tạm ứng',
                            errorStyle: TextStyle(height: 0, fontSize: 0.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            constraints: BoxConstraints(
                              maxWidth: 140,
                              minHeight: 40,
                            ),
                          ),
                          inputFormatters: [
                            CurrencyInputFormatter(
                                useSymbolPadding: false, mantissaLength: 2),
                          ],
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            ((value) {
                              var tienTamUng =
                                  _numberFormater.parse(value ?? '0');
                              if (tienTamUng > 0) {
                                return null;
                              }
                              return 'Tiền tạm ứng chưa nhập!';
                            })
                          ]),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      _buildCurrencyLookup,
                    ],
                  ),
                  const Divider(
                    height: 15.0,
                  ),
                  FormBuilderTextField(
                    name: 'lyDoTamUng',
                    decoration: InputDecoration(
                      labelText: 'Lý do',
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.primaryColor, width: 1.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 1.0),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      hintText: 'Nhập lý do',
                    ),
                    // initialValue: '',
                    keyboardType: TextInputType.multiline,
                    expands: false,
                    minLines: 3,
                    maxLines: 20,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    name: 'thoiHanThanhToan',
                    decoration: InputDecoration(
                      labelText: 'Thời hạn thanh toán',
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.primaryColor, width: 1.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 1.0),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      hintText: 'Nhập thời hạn thanh toán',
                    ),
                    // initialValue: '',
                    keyboardType: TextInputType.multiline,
                    expands: false,
                    minLines: 2,
                    maxLines: 10,
                    validator: FormBuilderValidators.compose([]),
                  ),
                ]),
              ),
            ),
            isExpanded: _panelViews[2]),
        ExpansionPanel(
            backgroundColor: _panelViews[3] ? theme.primaryColor : Colors.white,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return _buildHeaderTitle("4.Tập tin đính kèm", isExpanded);
            },
            body: Container(
              decoration: boxDecor,
              child: Padding(
                padding: bodyPadding,
                child: DocumentFileAttachView(
                    departmentName: DepartmentEnum.PhieuTamUng.name,
                    reportId: _giayTamUng.idTamUng),
              ),
            ),
            isExpanded: _panelViews[3]),
      ],
    );
  }

  Widget _buildPopupItemBuilder(
    BuildContext context,
    String? title,
    String? subtitle,
    bool isSelected,
  ) {
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
        title: Text(title ?? ''),
        subtitle: Text(subtitle ?? ''),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.file_copy_sharp),
        ),
      ),
    );
  }
}
