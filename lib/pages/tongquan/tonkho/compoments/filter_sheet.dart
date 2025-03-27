import 'package:bividpharma/model/dtos/company/m_company.dart';
import 'package:bividpharma/model/dtos/vattu/m_vattu.dart';
import 'package:bividpharma/services/providers/danhmuc_provider.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  final Function(
          DateTime? startDate, DateTime? endDate, MCompany? macty, String? mavt)
      onFilterApplied;
  final MCompany? selectedCompany;
  final List<MCompany>? listCompany;
  const FilterBottomSheet(
      {Key? key,
      required this.onFilterApplied,
      this.selectedCompany,
      this.listCompany})
      : super(key: key);

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String? selectedType;
  String? selectedUnit;
  String? selectedProduct;
  String? selectedCustomer;
  DateTime? startDate;
  DateTime? endDate;
  MVatTu? selectedVatTu;
  List<MVatTu> list = [];
  MCompany? selectedCompany;
  List<MCompany>? listCompany = [];
  Future<void> _pickDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // fetchDanhSachVatTu();
    // fetchDanhSachCongty();
    selectedCompany = widget.selectedCompany;
    listCompany = widget.listCompany;
  }

  void fetchDanhSachVatTu() async {
    final result = await DanhMucRepository.fetchDanhMucVatTu();
    result.fold((error) {}, (data) {
      print(data);
      if (mounted) {
        setState(() {
          list = data.data ?? [];
        });
      }
    });
  }

  void fetchDanhSachCongty() async {
    final result = await DanhMucRepository.fetchCompanyList();
    result.fold((error) {}, (data) {
      print(data);
      if (mounted) {
        setState(() {
          listCompany = data.data ?? [];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Lọc báo cáo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Dropdown: Loại
            // buildDropdown(
            //     "Loại",
            //     selectedType,
            //     ["Select...", "Option 1", "Option 2"],
            //     (value) => setState(() => selectedType = value)),

            // const SizedBox(height: 16),

            // Chọn ngày
            Row(
              children: [
                Expanded(
                    child: buildDateField(
                        "Từ ngày", startDate, () => _pickDate(context, true))),
                const SizedBox(width: 10),
                Expanded(
                    child: buildDateField(
                        "Đến ngày", endDate, () => _pickDate(context, false))),
              ],
            ),

            const SizedBox(height: 16),

            buildDropdownCompany("Đơn vị", selectedCompany, listCompany ?? [],
                (value) => setState(() => selectedCompany = value)),

            const SizedBox(height: 16),
            // buildDropdownProduct("Sản phẩm", selectedVatTu, list,
            //     (value) => setState(() => selectedVatTu = value)),
            // const SizedBox(height: 16),

            // Nút Xóa & Áp dụng
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedType = null;
                        selectedUnit = null;
                        selectedProduct = null;
                        selectedCustomer = null;
                        startDate = null;
                        endDate = null;
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black54,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Xóa"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onFilterApplied(
                        startDate,
                        endDate,
                        selectedCompany,
                        selectedVatTu?.maVt,
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Áp dụng"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(String label, String? value, List<String> items,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: value != null
                  ? Colors.blue
                  : Colors.grey.shade400, // Border xanh nếu có giá trị
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: DropdownButtonFormField<String>(
            value: value,
            decoration: const InputDecoration(border: InputBorder.none),
            items: items
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget buildDropdownCompany(String label, MCompany? value,
      List<MCompany> items, ValueChanged<MCompany?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: value != null
                  ? Colors.blue
                  : Colors.grey.shade400, // Border xanh nếu có giá trị
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DropdownButtonFormField<MCompany>(
            isExpanded: true,
            value: value,
            decoration: const InputDecoration(border: InputBorder.none),
            items: items
                .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e.tenCty ?? "",
                      overflow: TextOverflow.ellipsis,
                    )))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget buildDropdownProduct(String label, MVatTu? value, List<MVatTu> items,
      ValueChanged<MVatTu?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: value != null
                  ? Colors.blue
                  : Colors.grey.shade400, // Border xanh nếu có giá trị
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: DropdownButtonFormField<MVatTu>(
            value: value,
            decoration: const InputDecoration(border: InputBorder.none),
            items: items
                .map((e) =>
                    DropdownMenuItem(value: e, child: Text(e.tenVt ?? "")))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget buildDateField(String label, DateTime? date, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(
                color: date != null
                    ? Colors.blue
                    : Colors.grey.shade400, // Border xanh nếu có giá trị
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, size: 20, color: Colors.grey),
                const SizedBox(width: 10),
                Text(
                  date != null
                      ? "${date.day}/${date.month}/${date.year}"
                      : "Chọn ngày",
                  style: TextStyle(
                    color: date != null ? Colors.black : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
