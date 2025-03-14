import 'package:flutter/material.dart';

class EditProductPopup extends StatefulWidget {
  final String title;
  final int initialQuantity;
  final double initialPrice;
  final Function(int, double) onSave;

  const EditProductPopup({
    this.title = "Sản phẩm",
    required this.initialQuantity,
    required this.initialPrice,
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  _EditProductPopupState createState() => _EditProductPopupState();
}

class _EditProductPopupState extends State<EditProductPopup> {
  late TextEditingController quantityController;
  late TextEditingController priceController;
  late String title;
  @override
  void initState() {
    super.initState();
    title = widget.title;
    quantityController =
        TextEditingController(text: widget.initialQuantity.toString());
    priceController =
        TextEditingController(text: widget.initialPrice.toString());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Chỉnh sửa $title",
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Số lượng"),
          ),
          TextField(
            controller: priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Giá bán"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Hủy"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor, // Màu nền xanh
          ),
          onPressed: () {
            int updatedQuantity =
                int.tryParse(quantityController.text) ?? widget.initialQuantity;
            double updatedPrice =
                double.tryParse(priceController.text) ?? widget.initialPrice;
            widget.onSave(updatedQuantity, updatedPrice);
            Navigator.pop(context);
          },
          child: const Text("Lưu", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
