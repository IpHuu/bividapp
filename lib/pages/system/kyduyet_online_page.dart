import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/chiphicongtac/chi_phi_cong_tac.dart';
import 'package:bividpharma/model/dtos/denghicapsim/de_nghi_cap_sim.dart';
import 'package:bividpharma/model/dtos/denghicapvpp/de_nghi_cap_vpp.dart';
import 'package:bividpharma/model/dtos/denghimuavpp/de_nghi_mua_vpp.dart';
import 'package:bividpharma/model/dtos/dexuatmuahang/phieu_de_xuat_mua_hang.dart';
import 'package:bividpharma/model/dtos/giayracong/giay_ra_cong.dart';
import 'package:bividpharma/model/dtos/giaytamung/giay_tam_ung.dart';
import 'package:bividpharma/model/dtos/giayxinphep/giayxinphep.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/model/dtos/kehoachcongtac/ke_hoach_cong_tac.dart';
import 'package:bividpharma/pages/kehoachcongviec/dtos/phieu_ke_hoach_cong_viec.dart';
import 'package:bividpharma/model/dtos/lenhcongtac/lenh_cong_tac.dart';
import 'package:bividpharma/model/dtos/thanhquyettoan/phieu_thanh_quyet_toan.dart';
import 'package:bividpharma/model/kyduyet_online_page_model.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/pages/chiphicongtac/chiphicongtac_item.dart';
import 'package:bividpharma/pages/denghicapsim/denghicapsim_item.dart';
import 'package:bividpharma/pages/denghicapvpp/denghicapvpp_item.dart';
import 'package:bividpharma/pages/denghimuavpp/denghimuavpp_item.dart';
import 'package:bividpharma/pages/dexuatmuahang/phieudexuatmuahang_item.dart';
import 'package:bividpharma/pages/giayracong/giayracong_item.dart';
import 'package:bividpharma/pages/giaytamung/giaytamung_item.dart';
import 'package:bividpharma/pages/giayxinphep/giayxinphep_item.dart';
import 'package:bividpharma/pages/kehoachcongtac/kehoachcongtac_item.dart';
import 'package:bividpharma/pages/kehoachcongviec/kehoachcongviec_item.dart';
import 'package:bividpharma/pages/lenhcongtac/lenhcongtac_item.dart';
import 'package:bividpharma/pages/thanhquyettoan/thanhquyettoan_item.dart';
import 'package:bividpharma/services/chiphicongtac_service.dart';
import 'package:bividpharma/services/denghicapsim_service.dart';
import 'package:bividpharma/services/denghicapvpp_service.dart';
import 'package:bividpharma/services/denghimuavpp_service.dart';
import 'package:bividpharma/services/dexuatmuahang_service.dart';
import 'package:bividpharma/services/giaynghiphep_service.dart';
import 'package:bividpharma/services/giayracong_service.dart';
import 'package:bividpharma/services/kehoachcongtac_service.dart';
import 'package:bividpharma/services/kehoachcongviec_service.dart';
import 'package:bividpharma/services/lenhcongtac_service.dart';
import 'package:bividpharma/services/phieutamung_service.dart';
import 'package:bividpharma/services/thanhquyettoan_service.dart';
import 'package:bividpharma/ui/widgets/button_toggle_widget.dart';
import 'package:bividpharma/ui/widgets/data_loading_card.dart';
import 'package:bividpharma/ui/widgets/empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:line_icons/line_icons.dart';
import 'package:expandable/expandable.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class KyDuyetOnlinePage extends StatefulWidget {
  const KyDuyetOnlinePage({Key? key}) : super(key: key);

  @override
  State<KyDuyetOnlinePage> createState() => _KyDuyetOnlinePageState();
}

class _KyDuyetOnlinePageState extends State<KyDuyetOnlinePage> {
  late MainPageModel _mainPageModel;
  late KyDuyetOnlinePageModel _kyDuyetPageModel;

  final ExpandableController _filterHeaderController = ExpandableController();
  final PagingController<int, IDocument> _pagingController =
      PagingController(firstPageKey: 1);
  late StreamSubscription<int> _giayXinPhepSub;
  late StreamSubscription<int> _giayTamUngSub;
  late StreamSubscription<int> _giayKHCVSub;
  late StreamSubscription<int> _giayTQTSub;
  late StreamSubscription<int> _giayDXMHSub;

  late StreamSubscription<int> _giayGRCSub;
  late StreamSubscription<int> _giayDNCapSimSub;

  late bool _filterNghiPhep = true;
  late bool _filterTamUng = true;
  late bool _filterKHCV = true;
  late bool _filterTQT = true;
  late bool _filterDNMH = true;

  late bool _filterGRC = true;
  late bool _filterDNCapSim = true;

  final List<IDocument> _giayNghiPheps = <IDocument>[];
  final List<IDocument> _giayTamUngs = <IDocument>[];
  final List<IDocument> _giayKHCVs = <IDocument>[];
  final List<IDocument> _giayTQTs = <IDocument>[];
  final List<IDocument> _giayDNMHs = <IDocument>[];

  final List<IDocument> _giayRaCongs = <IDocument>[];
  final List<IDocument> _giayDNCapSims = <IDocument>[];

  late bool _filterDNMuaVpp = true;
  late StreamSubscription<int> _giayDNMuaVppSub;
  final List<IDocument> _giayDNMuaVpps = <IDocument>[];

  late bool _filterLenhCongTac = true;
  late StreamSubscription<int> _giayLenhCongTacSub;
  final List<IDocument> _giayLenhCongTacs = <IDocument>[];

  late bool _filterKeHoachCongTac = true;
  late StreamSubscription<int> _giayKeHoachCongTacSub;
  final List<IDocument> _giayKeHoachCongTacs = <IDocument>[];

  late bool _filterDeNghiCapVpp = true;
  late StreamSubscription<int> _giayDeNghiCapVppSub;
  final List<IDocument> _giayDeNghiCapVpps = <IDocument>[];

  late bool _filterChiPhiCongTac = true;
  late StreamSubscription<int> _giayChiPhiCongTacSub;
  final List<IDocument> _giayChiPhiCongTacs = <IDocument>[];

  @override
  void initState() {
    super.initState();

    _mainPageModel = context.read<MainPageModel>();
    _kyDuyetPageModel = context.read<KyDuyetOnlinePageModel>();

    _giayXinPhepSub =
        _mainPageModel.giayPhepStream.stream.listen(_onChangedGiayXinPhep);
    _giayTamUngSub =
        _mainPageModel.giayTamUngStream.stream.listen(_onchangedGiayTamUng);

    _giayKHCVSub = _mainPageModel.giayKHCVStream.stream.listen(_onchangedKHCV);
    _giayTQTSub = _mainPageModel.giayTQTStream.stream.listen(_onchangeTQT);
    _giayDXMHSub = _mainPageModel.giayDXMHStream.stream.listen(_onchangeDXMH);

    _giayGRCSub = _mainPageModel.giayRaCongStream.stream.listen(_onchangeGRC);
    _giayDNCapSimSub =
        _mainPageModel.giayDNCapSimStream.stream.listen(_onchangeDNCapSim);
    _giayDNMuaVppSub =
        _mainPageModel.giayDNMuaVppStream.stream.listen(_onchangeDNMuaVpp);

    _giayLenhCongTacSub = _mainPageModel.giayLenhCongTacStream.stream
        .listen(_onchangeLenhCongTac);

    _giayKeHoachCongTacSub = _mainPageModel.giayKeHoachCongTacStream.stream
        .listen(_onchangeKeHoachCongTac);

    _giayDeNghiCapVppSub = _mainPageModel.giayDeNghiCapVppStream.stream
        .listen(_onchangeDeNghiCapVpp);

    _giayChiPhiCongTacSub = _mainPageModel.giayChiPhiCongTacStream.stream
        .listen(_onchangeChiPhiCongTac);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _pagingController.addPageRequestListener((pageKey) {
        _fetchPage(pageKey);
      });
      _fetchPage(1);
    });

    _filterHeaderController.expanded = false;
  }

  void _onchangeChiPhiCongTac(int id) {
    _changedDocument(DataHelper.chiPhiCongTacName, id,
        ChiPhiCongTacService.instance.loadOne);
  }

  void _onchangeDeNghiCapVpp(int id) {
    _changedDocument(
        DataHelper.deNghiCapVppName, id, DeNghiCapVppService.instance.loadOne);
  }

  void _onchangeKeHoachCongTac(int id) {
    _changedDocument(DataHelper.keHoachCongTacName, id,
        KeHoachCongTacService.instance.loadOne);
  }

  void _onChangedGiayXinPhep(int id) {
    if (_pagingController.itemList == null) return;
    IDocument? item = _pagingController.itemList!.firstWhereOrNull((element) {
      return element.getId() == id &&
          element.getType() == DataHelper.giayPhepName;
    });

    if (item == null) return;

    GiayNghiPhepService.giayNghiPhep_LoadOne(id).then((value) {
      if (value == null) return;
      _setStateOnMount(() {
        _pagingController.itemList!.remove(item);
        _pagingController.itemList!.insert(0, value);
      });
    });
  }

  void _onchangeTQT(int id) {
    if (_pagingController.itemList == null) return;
    IDocument? item = _pagingController.itemList!.firstWhereOrNull((element) {
      return element.getId() == id && element.getType() == DataHelper.tqtName;
    });

    if (item == null) return;

    PhieuThanhQuyetToanService.phieuThanhQuyetToan_LoadOne(id).then((value) {
      if (value == null) return;
      _setStateOnMount(() {
        _pagingController.itemList!.remove(item);
        _pagingController.itemList!.insert(0, value);
      });
    });
  }

  void _onchangedGiayTamUng(int id) {
    if (_pagingController.itemList == null) return;
    IDocument? item = _pagingController.itemList!.firstWhereOrNull((element) {
      return element.getId() == id &&
          element.getType() == DataHelper.tamUngName;
    });

    if (item == null) return;

    GiayTamUngService.giayTamUng_LoadOne(id).then((value) {
      if (value == null) return;
      _setStateOnMount(() {
        _pagingController.itemList!.remove(item);
        _pagingController.itemList!.insert(0, value);
      });
    });
  }

  void _onchangedKHCV(int id) {
    if (_pagingController.itemList == null) return;
    IDocument? item = _pagingController.itemList!.firstWhereOrNull((element) {
      return element.getId() == id && element.getType() == DataHelper.khcvName;
    });

    if (item == null) return;

    KeHoachCongViecService.keHoachCongViec_LoadOne(id).then((value) {
      if (value == null) return;
      _setStateOnMount(() {
        _pagingController.itemList!.remove(item);
        _pagingController.itemList!.insert(0, value);
      });
    });
  }

  void _onchangeDXMH(int id) {
    if (_pagingController.itemList == null) return;
    IDocument? item = _pagingController.itemList!.firstWhereOrNull((element) {
      return element.getId() == id &&
          element.getType() == DataHelper.deXuatMuaHangName;
    });

    if (item == null) return;

    PhieuDeXuatMuaHangService.phieuDeXuatMuaHang_LoadOne(id).then((value) {
      if (value == null) return;
      _setStateOnMount(() {
        _pagingController.itemList!.remove(item);
        _pagingController.itemList!.insert(0, value);
      });
    });
  }

  void _onchangeGRC(int id) {
    if (_pagingController.itemList == null) return;
    IDocument? item = _pagingController.itemList!.firstWhereOrNull((element) {
      return element.getId() == id &&
          element.getType() == DataHelper.giayRaCongName;
    });

    if (item == null) return;

    GiayRaCongService.giayRaCong_LoadOne(id).then((value) {
      if (value == null) return;
      _setStateOnMount(() {
        _pagingController.itemList!.remove(item);
        _pagingController.itemList!.insert(0, value);
      });
    });
  }

  void _onchangeDNCapSim(int id) {
    if (_pagingController.itemList == null) return;
    IDocument? item = _pagingController.itemList!.firstWhereOrNull((element) {
      return element.getId() == id &&
          element.getType() == DataHelper.deNghiCapSimName;
    });

    if (item == null) return;

    DeNghiCapSimService.deNghiCapSim_LoadOne(id).then((value) {
      if (value == null) return;
      _setStateOnMount(() {
        _pagingController.itemList!.remove(item);
        _pagingController.itemList!.insert(0, value);
      });
    });
  }

  void _onchangeDNMuaVpp(int id) {
    _changedDocument(
        DataHelper.deNghiCapVppName, id, DeNghiMuaVppService.instance.loadOne);
  }

  void _onchangeLenhCongTac(int id) {
    _changedDocument(
        DataHelper.lenhCongTacName, id, LenhCongTacService.instance.loadOne);
  }

  void _changedDocument(String docTypeName, int id,
      Future<IDocument?> Function(int) loadOneCallback) {
    if (_pagingController.itemList == null) return;
    IDocument? item = _pagingController.itemList!.firstWhereOrNull((element) {
      return element.getId() == id && element.getType() == docTypeName;
    });

    if (item == null) return;

    loadOneCallback(id).then((value) {
      if (value == null) return;
      _setStateOnMount(() {
        _pagingController.itemList!.remove(item);
        _pagingController.itemList!.insert(0, value);
      });
    });
  }

  final int _pageSize = 10;
  Future<void> _fetchPage(int pageKey) async {
    _pagingController.error = null;
    if (!mounted) return;

    try {
      if (_pagingController.itemList != null) {
        _pagingController.itemList!.clear();
      }

      await _loadTamUngData();
      await _loadGiayNghiPhepData();
      await _loadKHCVData();
      await _loadThanhQuyetToanData();
      await _loadDXMHData();

      await _loadGiayRaCongData();
      await _loadDeNghiCapSimData();
      await _loadDeNghiMuaVppData();

      await _loadLenhCongTacData();
      await _loadKeHoachCongTacData();
      await _loadDeNghiCapVppData();

      await _loadChiPhiCongTacData();

      _pagingController.appendLastPage(<IDocument>[]);
    } catch (error) {
      _pagingController.error = error;
    }
  }

  Future<void> _loadChiPhiCongTacData() async {
    if (_filterChiPhiCongTac) {
      await _addDocuments(
          _giayChiPhiCongTacs, ChiPhiCongTacService.instance.loadPaged,
          (value) {
        setState(() {
          _kyDuyetPageModel.loadingChiPhiCongTac = value;
        });
      });
    } else {
      _removeDocuments(_giayChiPhiCongTacs, DataHelper.chiPhiCongTacName);
    }
  }

  Future<void> _loadKeHoachCongTacData() async {
    if (_filterKeHoachCongTac) {
      await _addDocuments(
          _giayKeHoachCongTacs, KeHoachCongTacService.instance.loadPaged,
          (value) {
        setState(() {
          _kyDuyetPageModel.loadingKeHoachCongTac = value;
        });
      });
    } else {
      _removeDocuments(_giayKeHoachCongTacs, DataHelper.keHoachCongTacName);
    }
  }

  Future<void> _loadTamUngData() async {
    if (_filterTamUng) {
      await _addDocuments(
          _giayTamUngs, GiayTamUngService.giayTamUng_LoadPagedData, (value) {
        setState(() {
          _kyDuyetPageModel.loadingTamUng = value;
        });
      }, filterType: 0);
    } else {
      _removeDocuments(_giayTamUngs, DataHelper.tamUngName);
    }
  }

  Future<void> _loadGiayNghiPhepData() async {
    if (_filterNghiPhep) {
      await _addDocuments(
          _giayNghiPheps, GiayNghiPhepService.giaynghiphep_LoadPagedData,
          (value) {
        setState(() {
          _kyDuyetPageModel.loadingNghiPhep = value;
        });
      }, filterType: 0);
    } else {
      _removeDocuments(_giayNghiPheps, DataHelper.giayPhepName);
    }
  }

  Future<void> _loadKHCVData() async {
    if (_filterKHCV) {
      await _addDocuments(
          _giayKHCVs, KeHoachCongViecService.keHoachCongViec_LoadPagedData,
          (value) {
        setState(() {
          _kyDuyetPageModel.loadingKHCV = value;
        });
      });
    } else {
      _removeDocuments(_giayKHCVs, DataHelper.khcvName);
    }
  }

  Future<void> _loadThanhQuyetToanData() async {
    if (_filterTQT) {
      await _addDocuments(_giayTQTs,
          PhieuThanhQuyetToanService.phieuThanhQuyetToan_LoadPagedData,
          (value) {
        setState(() {
          _kyDuyetPageModel.loadingTQT = value;
        });
      }, filterType: 0);
    } else {
      _removeDocuments(_giayTQTs, DataHelper.tqtName);
    }
  }

  Future<void> _loadGiayRaCongData() async {
    if (_filterGRC) {
      await _addDocuments(
          _giayRaCongs, GiayRaCongService.giayRaCong_LoadPagedData, (value) {
        setState(() {
          _kyDuyetPageModel.loadingGiayRaCong = value;
        });
      });
    } else {
      _removeDocuments(_giayRaCongs, DataHelper.giayRaCongName);
    }
  }

  Future<void> _loadDXMHData() async {
    if (_filterDNMH) {
      await _addDocuments(_giayDNMHs,
          PhieuDeXuatMuaHangService.phieuDeXuatMuaHang_LoadPagedData, (value) {
        setState(() {
          _kyDuyetPageModel.loadingDXMH = value;
        });
      });
    } else {
      _removeDocuments(_giayDNMHs, DataHelper.deXuatMuaHangName);
    }
  }

  Future<void> _loadDeNghiCapSimData() async {
    if (_filterDNCapSim) {
      await _addDocuments(
          _giayDNCapSims, DeNghiCapSimService.deNghiCapSim_LoadPagedData,
          (value) {
        setState(() {
          _kyDuyetPageModel.loadingDeNghiCapSim = value;
        });
      });
    } else {
      _removeDocuments(_giayDNCapSims, DataHelper.deNghiCapSimName);
    }
  }

  Future<void> _loadDeNghiMuaVppData() async {
    if (_filterDNMuaVpp) {
      await _addDocuments(
          _giayDNMuaVpps, DeNghiMuaVppService.instance.loadPaged, (value) {
        setState(() {
          _kyDuyetPageModel.loadingDeNghiMuaVpp = value;
        });
      });
    } else {
      _removeDocuments(_giayDNMuaVpps, DataHelper.deNghiMuaVppName);
    }
  }

  Future<void> _loadLenhCongTacData() async {
    if (_filterLenhCongTac) {
      await _addDocuments(
          _giayLenhCongTacs, LenhCongTacService.instance.loadPaged, (value) {
        setState(() {
          _kyDuyetPageModel.loadingLenhCongTac = value;
        });
      });
    } else {
      _removeDocuments(_giayLenhCongTacs, DataHelper.lenhCongTacName);
    }
  }

  Future<void> _loadDeNghiCapVppData() async {
    if (_filterDeNghiCapVpp) {
      await _addDocuments(
          _giayDeNghiCapVpps, DeNghiCapVppService.instance.loadPaged, (value) {
        setState(() {
          _kyDuyetPageModel.loadingDeNghiCapVpp = value;
        });
      });
    } else {
      _removeDocuments(_giayDeNghiCapVpps, DataHelper.deNghiCapVppName);
    }
  }

  Future<void> _addDocuments(
      List<IDocument> sourceList,
      DocumentFetchPagedCallback loadDataCallback,
      ChangeStateCallback stateCallback,
      {int filterType = 2}) async {
    sourceList.clear();
    stateCallback.call(true);
    try {
      final dataList =
          await loadDataCallback(1, _pageSize, false, filterType, '');
      sourceList.addAll(dataList);
      setState(() {
        _pagingController.appendLastPage(sourceList);
      });
    } finally {
      stateCallback.call(false);
    }
  }

  void _removeDocuments(List<IDocument> list, String docTypeName) {
    if (_pagingController.itemList == null) return;
    for (var item in list) {
      final IDocument found = _pagingController.itemList!.firstWhere(
          (element) =>
              item.getId() == element.getId() &&
              item.getType() == element.getType(),
          orElse: () => EmptyDocument());
      if (found is EmptyDocument) continue;
      _pagingController.itemList!.remove(found);
      // debugPrint('Item is found: $found');
    }

    _pagingController.itemList!
        .removeWhere((element) => element.getType() == docTypeName);
  }

  void _setStateOnMount(VoidCallback fn) {
    if (!mounted) {
      fn.call();
    } else {
      setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    return Consumer<KyDuyetOnlinePageModel>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("HỒ SƠ CHỜ KÝ DUYỆT"),
            elevation: 10,
            backgroundColor: Theme.of(context).colorScheme.background,
            actions: <Widget>[
              IconButton(
                icon: const Icon(LineIcons.filter),
                tooltip: 'Lọc dữ liệu',
                onPressed: () {
                  // handle the press
                  _filterHeaderController.toggle();
                },
              ),
            ],
          ),
          body: Column(
            children: [
              ExpandablePanel(
                controller: _filterHeaderController,
                collapsed: Container(),
                expanded: Container(
                  margin: const EdgeInsets.only(
                    left: 1,
                    right: 1,
                  ),
                  constraints: BoxConstraints(minWidth: screenSize.width),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: theme.primaryColor)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 7,
                      right: 7,
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 3.0,
                      children: [
                        ButtonToggle(
                          title: 'Nghỉ phép',
                          state: _filterNghiPhep,
                          onPressed: _kyDuyetPageModel.loadingNghiPhep
                              ? null
                              : (value) {
                                  setState(() {
                                    _filterNghiPhep = value;
                                  });
                                  _loadGiayNghiPhepData();
                                },
                        ),
                        ButtonToggle(
                          title: "Tạm ứng",
                          state: _filterTamUng,
                          onPressed: _kyDuyetPageModel.loadingTamUng
                              ? null
                              : (value) {
                                  setState(() {
                                    _filterTamUng = value;
                                  });
                                  _loadTamUngData();
                                },
                        ),
                        ButtonToggle(
                          title: "Thanh quyết toán",
                          state: _filterTQT,
                          onPressed: _kyDuyetPageModel.loadingTQT
                              ? null
                              : (value) {
                                  setState(() {
                                    _filterTQT = value;
                                  });
                                  _loadThanhQuyetToanData();
                                },
                        ),
                        ButtonToggle(
                          title: "Kế hoạch công việc",
                          state: _filterKHCV,
                          onPressed: _kyDuyetPageModel.loadingKHCV
                              ? null
                              : (value) {
                                  setState(() {
                                    _filterKHCV = value;
                                  });
                                  _loadKHCVData();
                                },
                        ),
                        ButtonToggle(
                          title: "Đề nghị mua hàng",
                          state: _filterDNMH,
                          onPressed: _kyDuyetPageModel.loadingDXMH
                              ? null
                              : (value) {
                                  setState(() {
                                    _filterDNMH = value;
                                  });
                                  _loadDXMHData();
                                },
                        ),
                        ButtonToggle(
                          title: "Giấy ra cổng",
                          state: _filterGRC,
                          onPressed: _kyDuyetPageModel.loadingGiayRaCong
                              ? null
                              : (value) {
                                  setState(() {
                                    _filterGRC = value;
                                  });
                                  _loadGiayRaCongData();
                                },
                        ),
                        ButtonToggle(
                          title: "Đề nghị cấp SIM",
                          state: _filterDNCapSim,
                          onPressed: _kyDuyetPageModel.loadingDeNghiCapSim
                              ? null
                              : (value) {
                                  setState(() {
                                    _filterDNCapSim = value;
                                  });
                                  _loadDeNghiCapSimData();
                                },
                        ),
                        ButtonToggle(
                          title: "Đề nghị mua VPP",
                          state: _filterDNMuaVpp,
                          onPressed: _kyDuyetPageModel.loadingDeNghiMuaVpp
                              ? null
                              : (value) {
                                  setState(() {
                                    _filterDNMuaVpp = value;
                                  });
                                  _loadDeNghiMuaVppData();
                                },
                        ),
                        ButtonToggle(
                          title: "Đề nghị cấp VPP",
                          state: _filterDeNghiCapVpp,
                          onPressed: _kyDuyetPageModel.loadingDeNghiCapVpp
                              ? null
                              : (value) {
                                  setState(() {
                                    _filterDeNghiCapVpp = value;
                                  });
                                  _loadDeNghiCapVppData();
                                },
                        ),
                        ButtonToggle(
                          title: "Lệnh công tác",
                          state: _filterLenhCongTac,
                          onPressed: _kyDuyetPageModel.loadingLenhCongTac
                              ? null
                              : (value) {
                                  setState(() {
                                    _filterLenhCongTac = value;
                                  });
                                  _loadLenhCongTacData();
                                },
                        ),
                        ButtonToggle(
                          title: "Kế hoạch công tác",
                          state: _filterKeHoachCongTac,
                          onPressed: _kyDuyetPageModel.loadingKeHoachCongTac
                              ? null
                              : (value) {
                                  setState(() {
                                    _filterKeHoachCongTac = value;
                                  });
                                  _loadKeHoachCongTacData();
                                },
                        ),
                        ButtonToggle(
                          title: "Chi phí công tác",
                          state: _filterChiPhiCongTac,
                          onPressed: _kyDuyetPageModel.loadingChiPhiCongTac
                              ? null
                              : (value) {
                                  setState(() {
                                    _filterChiPhiCongTac = value;
                                  });
                                  _loadChiPhiCongTacData();
                                },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(child: _buildRefreshList()),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNoItemsFoundIndicator(BuildContext context) {
    final theme = Theme.of(context);
    final kyDuyetPageModel = context.read<KyDuyetOnlinePageModel>();
    if (kyDuyetPageModel.loadingNghiPhep ||
        kyDuyetPageModel.loadingTamUng ||
        kyDuyetPageModel.loadingTQT ||
        kyDuyetPageModel.loadingKHCV ||
        kyDuyetPageModel.loadingGiayRaCong ||
        kyDuyetPageModel.loadingDXMH ||
        kyDuyetPageModel.loadingDeNghiCapSim ||
        kyDuyetPageModel.loadingDeNghiMuaVpp ||
        kyDuyetPageModel.loadingLenhCongTac ||
        kyDuyetPageModel.loadingKeHoachCongTac ||
        kyDuyetPageModel.loadingDeNghiCapVpp ||
        kyDuyetPageModel.loadingChiPhiCongTac) {
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: 16.0, fontFamily: 'Horizon', color: theme.primaryColor),
          child: AnimatedTextKit(repeatForever: true, animatedTexts: [
            TypewriterAnimatedText('Đang tải dữ liệu...'),
            WavyAnimatedText('Đang tải dữ liệu...',
                speed: const Duration(milliseconds: 100)),
            TypewriterAnimatedText('Đang tải dữ liệu...'),
          ]),
        ),
      );
    }
    return EmptyListWidget(onRefresh: () {
      _pagingController.refresh();
    });
  }

  Widget _buildNoMoreItemsIndicator(BuildContext context) {
    final kyDuyetPageModel = context.read<KyDuyetOnlinePageModel>();
    List<Widget> progressView = [];
    if (kyDuyetPageModel.loadingNghiPhep) {
      progressView.add(DataLoadingCard(
        visibled: true,
        progressText: 'Đang tải giấy nghỉ phép...',
      ));
    }
    if (kyDuyetPageModel.loadingKHCV) {
      progressView.add(DataLoadingCard(
        visibled: true,
        progressText: 'Đang tải kế hoạch công việc...',
      ));
    }
    if (kyDuyetPageModel.loadingTamUng) {
      progressView.add(DataLoadingCard(
        visibled: true,
        progressText: 'Đang tải giấy tạm ứng...',
      ));
    }
    if (kyDuyetPageModel.loadingTQT) {
      progressView.add(DataLoadingCard(
        visibled: true,
        progressText: 'Đang tải thanh quyết toán..',
      ));
    }

    if (kyDuyetPageModel.loadingGiayRaCong) {
      progressView.add(DataLoadingCard(
        visibled: true,
        progressText: 'Đang tải giấy ra cổng..',
      ));
    }
    if (kyDuyetPageModel.loadingDXMH) {
      progressView.add(DataLoadingCard(
        visibled: true,
        progressText: 'Đang tải đề xuất mua hàng...',
      ));
    }
    if (kyDuyetPageModel.loadingDeNghiCapVpp) {
      progressView.add(DataLoadingCard(
        visibled: true,
        progressText: 'Đang tải đề nghị cấp VPP...',
      ));
    }
    if (kyDuyetPageModel.loadingChiPhiCongTac) {
      progressView.add(DataLoadingCard(
        visibled: true,
        progressText: 'Đang tải chi phí công tác...',
      ));
    }
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: (progressView.isNotEmpty)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: progressView,
            )
          : Center(
              child: Text(
              "Không còn dữ liệu để xem.",
              style: TextStyle(color: Theme.of(context).disabledColor),
            )),
    );
  }

  Widget _buildRefreshList() {
    return RefreshIndicator(
        onRefresh: () => Future.sync(
              () => _pagingController.refresh(),
            ),
        child: PagedListView<int, IDocument>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<IDocument>(
            itemBuilder: (context, item, index) {
              Widget newItem;
              if (item.getType() == DataHelper.tamUngName) {
                newItem = GiayTamUngItem(
                  giaytamung: item as GiayTamUng,
                );
              } else if (item.getType() == DataHelper.giayPhepName) {
                newItem = GiayXinPhepItem(
                  giayNghiPhep: item as GiayXinPhep,
                );
              } else if (item.getType() == DataHelper.khcvName) {
                newItem = KeHoachCongViecItem(
                    kehoachcongviec: item as KeHoachCongViec);
              } else if (item.getType() == DataHelper.tqtName) {
                newItem = PhieuThanhQuyetToanItem(
                    phieuThanhQuyetToan: item as PhieuThanhQuyetToan);
              } else if (item.getType() == DataHelper.giayRaCongName) {
                newItem = GiayRaCongItem(giayRaCong: item as GiayRaCong);
              } else if (item.getType() == DataHelper.deNghiCapSimName) {
                newItem = DeNghiCapSimItem(deNghiCapSim: item as DeNghiCapSim);
              } else if (item.getType() == DataHelper.deXuatMuaHangName) {
                newItem = PhieuDeXuatMuaHangItem(
                    phieuDXMH: item as PhieuDeXuatMuaHang);
              } else if (item.getType() == DataHelper.deNghiMuaVppName) {
                newItem = DeNghiMuaVppItem(deNghiMuaVpp: item as DeNghiMuaVpp);
              } else if (item.getType() == DataHelper.lenhCongTacName) {
                newItem = LenhCongTacItem(lenhCongTac: item as LenhCongTac);
              } else if (item.getType() == DataHelper.keHoachCongTacName) {
                newItem =
                    KeHoachCongTacItem(keHoachCongTac: item as KeHoachCongTac);
              } else if (item.getType() == DataHelper.deNghiCapVppName) {
                newItem = DeNghiCapVppItem(deNghiCapVpp: item as DeNghiCapVpp);
              } else if (item.getType() == DataHelper.chiPhiCongTacName) {
                newItem =
                    ChiPhiCongTacItem(chiPhiCongTac: item as ChiPhiCongTac);
              } else {
                return const Text('Không có dữ liệu chi tiết');
              }
              return newItem;
            },
            newPageProgressIndicatorBuilder: (_) =>
                const Text("Đang tải dữ liệu."),
            noItemsFoundIndicatorBuilder: _buildNoItemsFoundIndicator,
            noMoreItemsIndicatorBuilder: _buildNoMoreItemsIndicator,
          ),
        ));
  }

  @override
  void dispose() {
    _giayTamUngSub.cancel();
    _giayXinPhepSub.cancel();
    _giayKHCVSub.cancel();
    _giayTQTSub.cancel();
    _giayDXMHSub.cancel();
    _giayGRCSub.cancel();
    _giayDNCapSimSub.cancel();
    _giayDNMuaVppSub.cancel();
    _giayLenhCongTacSub.cancel();
    _giayKeHoachCongTacSub.cancel();
    _giayDeNghiCapVppSub.cancel();
    _giayChiPhiCongTacSub.cancel();

    super.dispose();
  }
}
