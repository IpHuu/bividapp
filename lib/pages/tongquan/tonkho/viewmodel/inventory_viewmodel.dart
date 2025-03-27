import 'package:bividpharma/model/dtos/company/m_company.dart';
import 'package:bividpharma/model/dtos/tonkho/m_inventory.dart';
import 'package:bividpharma/model/dtos/tonkho/m_inventory_chart.dart';
import 'package:bividpharma/model/dtos/vattu/m_vattu.dart';
import 'package:bividpharma/pages/tongquan/tonkho/view/inventory_detail.page.dart';
import 'package:bividpharma/services/providers/danhmuc_provider.dart';
import 'package:bividpharma/services/providers/tonkho_provider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class InventoryViewmodel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setErrorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  void closeDialog() {
    _errorMessage = null;
    notifyListeners();
  }

  List<List<String>>? data;
  List<MInventory>? listData;
  List<MInventoryChart>? listChartData;
  MVatTu? selectedVatTu;
  List<MVatTu> list = [];
  MCompany? selectedCompany;
  List<MCompany> listCompany = [];
  String _fromDate = "${DateTime.now().year}-01-01";
  String _toDate = "${DateTime.now().year}-12-31";

  String get fromDate => _fromDate;
  String get toDate => _toDate;

  void setFromDate(String date) {
    _fromDate = date;
    notifyListeners();
  }

  void setToDate(String date) {
    _toDate = date;
    notifyListeners();
  }

  void fetchInventory() async {
    setIsLoading(true);
    final result = await DanhMucRepository.fetchCompanyList();
    result.fold((error) {
      setIsLoading(false);
    }, (data) {
      print(data);
      listCompany = data.data ?? [];
      selectedCompany = listCompany.first;
      fetchBaoCao(selectedCompany?.maCty ?? "", _fromDate, _toDate);
    });
  }

  List<Map<String, dynamic>>? dataReport;
  Map<String, dynamic>? summaryReport;
  void filterData() async {
    String maCty = selectedCompany?.maCty ?? "";
    fetchBaoCao(maCty, _fromDate, _toDate);
  }

  void fetchBaoCao(String macty, String fromDate, String toDate) async {
    setIsLoading(true);
    final response = await TonkhoProvider.baoCaoTonKho(
      macty: macty,
      from: fromDate,
      to: toDate,
    );
    response.fold((error) {
      setIsLoading(false);
      setErrorMessage("⚠️ Lỗi khi lấy dữ liệu: $error");
    }, (data) {
      setIsLoading(false);
      try {
        if (data.data == null || data.data!.isEmpty) {
          this.listChartData = [];
          this.listData = [];
        }

        List<MInventory> listData = _parseInventoryData(data.data![1]);
        this.listData = listData;

        List<MInventoryChart> listChartData =
            _parseInventoryChartData(data.data![0]);

        print(this.listData);

        // Sắp xếp danh sách theo tháng
        listChartData.sort((a, b) {
          int thangA = int.tryParse(a.thang) ?? 0;
          int thangB = int.tryParse(b.thang) ?? 0;
          return thangA.compareTo(thangB);
        });

        // In kết quả sau khi sắp xếp
        for (var item in listChartData) {
          print('Tháng: ${item.thang}, Tiền: ${item.tien_nhap}');
        }
        this.listChartData = listChartData;
        summaryReport = getFilteredAndSummedList();
      } catch (e, stackTrace) {
        setErrorMessage("⚠️ Lỗi xử lý dữ liệu: $e");
        print(stackTrace);
      }
    });
  }

  List<MInventory> _parseInventoryData(List<dynamic> rawData) {
    List<String> keys = List<String>.from(rawData[0] ?? []);
    List<List<String>> valuesList = List<List<String>>.from(rawData ?? []);
    if (valuesList.isNotEmpty) {
      valuesList.removeAt(0);
    }
    List<Map<String, dynamic>> jsonList = valuesList.map((values) {
      if (keys.length != values.length) {
        throw Exception(
            "Số lượng phần tử không khớp: keys=${keys.length}, values=${values.length}");
      }
      return Map.fromIterables(keys, values);
    }).toList();
    return jsonList.map((json) => MInventory.fromJson(json)).toList();
  }

  List<MInventoryChart> _parseInventoryChartData(List<dynamic> rawData) {
    List<String> keys = List<String>.from(rawData[0] ?? []);
    List<List<String>> valuesList = List<List<String>>.from(rawData ?? []);
    if (valuesList.isNotEmpty) {
      valuesList.removeAt(0);
    }
    List<Map<String, dynamic>> jsonList = valuesList.map((values) {
      if (keys.length != values.length) {
        throw Exception(
            "Số lượng phần tử không khớp: keys=${keys.length}, values=${values.length}");
      }
      return Map.fromIterables(keys, values);
    }).toList();
    return jsonList.map((json) => MInventoryChart.fromJson(json)).toList();
  }

  void tonKhoBy(TonKhoEnum type) {
    if (listData != null && listData!.isNotEmpty) {
      dataReport = groupAndSumBy(listData!, type);
    } else {
      dataReport = [];
    }
  }

  List<Map<String, dynamic>> groupAndSumBy(
      List<MInventory> list, TonKhoEnum type) {
    if (type == TonKhoEnum.sanpham) {
      List<Map<String, dynamic>> listMap =
          list.map((item) => item.toJson()).toList();
      return listMap;
    }
    if (type == TonKhoEnum.lo) {
      List<Map<String, dynamic>> listMap = list
          .where((item) =>
              item.ma_lo.isNotEmpty) // Lọc những item có ma_lo không rỗng
          .map((item) => item.toJson()) // Chuyển object về dạng Map
          .toList();
      return listMap;
    }
    return groupBy(list, (MInventory item) {
      switch (type) {
        case TonKhoEnum.kenh:
          return item.Loai;
        case TonKhoEnum.chinhanh:
          return item.ten_chinhanh;
        case TonKhoEnum.nhomsanpham:
          return item.ten_nhvt;
        case TonKhoEnum.nhomkho:
          return item.ten_nhkho;
        case TonKhoEnum.kho:
          return item.ten_kho;
        case TonKhoEnum.handung:
          return item.han_dung;
        case TonKhoEnum.nhasanxuat:
          return item.ten_plvt2;

        default:
          return item.Loai;
      }
    }).entries.map((entry) {
      String name = entry.key;
      List<MInventory> items = entry.value;

      // Tính tổng so_luong
      double tongSoLuong = items.fold(0.0, (sum, item) {
        return sum + (double.tryParse(item.so_luong) ?? 0.0);
      });

      // Tính tổng don_gia
      double tongDonGia = items.fold(0.0, (sum, item) {
        return sum + (double.tryParse(item.don_gia) ?? 0.0);
      });

      double slBivid = items.fold(0.0, (sum, item) {
        return sum + (double.tryParse(item.so_luong_bv) ?? 0.0);
      });

      double giatriBivid = items.fold(0.0, (sum, item) {
        return sum + (double.tryParse(item.tien_bv) ?? 0.0);
      });

      double slUyThac = items.fold(0.0, (sum, item) {
        return sum + (double.tryParse(item.so_luong_ut) ?? 0.0);
      });

      double gtriUyThac = items.fold(0.0, (sum, item) {
        return sum + (double.tryParse(item.tien_ut) ?? 0.0);
      });

      return {
        'name': name,
        'tongSoLuong': tongSoLuong,
        'tongDonGia': tongDonGia,
        'slBIVID': slBivid,
        'gTriBIVID': giatriBivid,
        'slUyThac': slUyThac,
        'gtriUyThac': gtriUyThac,
        'ttrong': 0.0,
      };
    }).toList();
  }

  Map<String, dynamic> getFilteredAndSummedList() {
    if (listData != null) {
      double totalSoLuong = listData!
          .fold(0, (sum, item) => sum + (double.tryParse(item.so_luong) ?? 0));
      double totalTien = listData!
          .fold(0, (sum, item) => sum + (double.tryParse(item.tien) ?? 0));
      double totalSoLuongBV = listData!.fold(
          0, (sum, item) => sum + (double.tryParse(item.so_luong_bv) ?? 0));
      double totalTienBV = listData!
          .fold(0, (sum, item) => sum + (double.tryParse(item.tien_bv) ?? 0));
      double totalSoLuongUT = listData!.fold(
          0, (sum, item) => sum + (double.tryParse(item.so_luong_ut) ?? 0));
      double totalTienUT = listData!
          .fold(0, (sum, item) => sum + (double.tryParse(item.tien_ut) ?? 0));

      Map<String, dynamic> result = {
        "so_luong": totalSoLuong,
        "tien": totalTien,
        "so_luong_bv": totalSoLuongBV,
        "tien_bv": totalTienBV,
        "so_luong_ut": totalSoLuongUT,
        "tien_ut": totalTienUT,
      };

      return result;
    } else {
      Map<String, dynamic> result = {
        "so_luong": 0.0,
        "tien": 0.0,
        "so_luong_bv": 0.0,
        "tien_bv": 0.0,
        "so_luong_ut": 0.0,
        "tien_ut": 0.0,
      };

      return result;
    }
  }

  void fetchDanhSachVatTu() async {
    final result = await DanhMucRepository.fetchDanhMucVatTu();
    result.fold((error) {}, (data) {
      print(data);
      list = data.data ?? [];
      selectedVatTu = list.first;
    });
  }

  void fetchDanhSachCongty() async {
    final result = await DanhMucRepository.fetchCompanyList();
    result.fold((error) {}, (data) {
      print(data);
      listCompany = data.data ?? [];
      selectedCompany = listCompany.first;
    });
  }
}
