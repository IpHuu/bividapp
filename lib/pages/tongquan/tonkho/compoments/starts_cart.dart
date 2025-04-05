import 'package:flutter/material.dart';

class SummaryCardGroup extends StatelessWidget {
  const SummaryCardGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.count(
        crossAxisCount: 2, // 2 cột
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5, // Căn chỉnh kích thước
        physics:
            const NeverScrollableScrollPhysics(), // Không scroll vì dùng PageView
        children: [
          const StatsCard(
              icon: Icons.bar_chart, value: "35K", label: "Total Sales"),
          const StatsCard(
              icon: Icons.trending_up, value: "2,153", label: "Average Sales"),
          const StatsCard(
              icon: Icons.bar_chart, value: "35K", label: "Total Sales"),
          const StatsCard(
              icon: Icons.trending_up, value: "2,153", label: "Average Sales"),
        ],
      ),
    );
  }
}

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.count(
        crossAxisCount: 2, // 2 cột
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5, // Căn chỉnh kích thước
        physics:
            const NeverScrollableScrollPhysics(), // Không scroll vì dùng PageView
        children: [
          const StatsCard(
              icon: Icons.bar_chart, value: "35K", label: "Total Sales"),
          const StatsCard(
              icon: Icons.trending_up, value: "2,153", label: "Average Sales"),
          const StatsCard(
              icon: Icons.bar_chart, value: "35K", label: "Total Sales"),
          const StatsCard(
              icon: Icons.trending_up, value: "2,153", label: "Average Sales"),
        ],
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const StatsCard(
      {Key? key, required this.icon, required this.value, required this.label})
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
            Icon(icon, size: 32, color: Colors.grey),
            Text(value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
