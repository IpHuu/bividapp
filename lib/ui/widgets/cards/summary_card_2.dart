import 'package:bividpharma/utils/extensions/double_extension.dart';
import 'package:flutter/material.dart';

class SummaryCard2 extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final double percent;
  const SummaryCard2(
      {Key? key,
      required this.icon,
      required this.value,
      required this.label,
      this.percent = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                // Icon(icon, size: 32, color: Colors.grey),
              ],
            ),
            Row(
              children: [
                Text("${percent.formatNumber()}%",
                    style: TextStyle(
                      fontSize: 20,
                      color: percent < 100 ? Colors.red : Colors.green,
                    )),
                Icon(
                  percent < 100 ? Icons.arrow_downward : Icons.arrow_upward,
                  size: 16,
                  color: percent < 100 ? Colors.red : Colors.green,
                ),
              ],
            ),
            Row(
              children: [
                Text(value,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(width: 4),
                const Text("-17.6M",
                    style: TextStyle(fontSize: 12, color: Colors.red)),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
