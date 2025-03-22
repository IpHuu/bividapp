import 'package:bividpharma/model/dtos/common/order_status.dart';
import 'package:flutter/material.dart';

class OrderStatusDropdown extends StatefulWidget {
  final int orderStatusId;
  final ValueChanged<Status>? onStatusChanged;

  const OrderStatusDropdown(
      {Key? key, required this.orderStatusId, this.onStatusChanged})
      : super(key: key);

  @override
  OrderStatusDropdownState createState() => OrderStatusDropdownState();
}

class OrderStatusDropdownState extends State<OrderStatusDropdown> {
  late Status selectedStatus;

  @override
  void initState() {
    super.initState();
    selectedStatus = StatusOrder.getById(widget.orderStatusId);
  }

  @override
  void didUpdateWidget(covariant OrderStatusDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.orderStatusId != widget.orderStatusId) {
      setState(() {
        selectedStatus = StatusOrder.getById(widget.orderStatusId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Status>(
      initialValue: selectedStatus,
      onSelected: (Status newValue) {
        setState(() {
          selectedStatus = newValue;
        });
        if (widget.onStatusChanged != null) {
          widget.onStatusChanged?.call(selectedStatus);
        }
      },
      itemBuilder: (BuildContext context) {
        return Status.values.map((Status status) {
          return PopupMenuItem<Status>(
            value: status,
            child: Text(status.name),
          );
        }).toList();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selectedStatus.backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selectedStatus.name,
              style: TextStyle(
                color: selectedStatus.textColor,
                fontSize: 12,
              ),
            ),
            const Icon(Icons.arrow_drop_down, size: 16, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
