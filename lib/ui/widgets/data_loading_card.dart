// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DataLoadingCard extends StatelessWidget {
  DataLoadingCard({Key? key, required this.visibled, this.progressText})
      : super(key: key);
  final bool visibled;
  late String? progressText;

  @override
  Widget build(BuildContext context) {
    if (!visibled) return Container();
    return Row(mainAxisSize: MainAxisSize.min, children: [
      const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(strokeWidth: 2)),
      const SizedBox(
        width: 5,
      ),
      Text(
        progressText ?? "Đang tải dữ liệu...",
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
    ]);
  }
}
