import 'package:flutter/material.dart';

class BiddingSummanyCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const BiddingSummanyCard(
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
            Row(
              children: [
                Text(label, style: const TextStyle(color: Colors.grey)),
                const Spacer(),
                Icon(icon, size: 32, color: Colors.grey),
              ],
            ),
            Row(
              children: [
                Text(value,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(width: 4),
              ],
            ),
            const Row(
              children: [
                Text("-17.6M", style: TextStyle(color: Colors.grey)),
                SizedBox(
                  width: 8,
                ),
                Text("1.24%",
                    style: TextStyle(fontSize: 16, color: Colors.red)),
                Icon(Icons.arrow_downward, size: 16, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BiddingSummanyCard2 extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const BiddingSummanyCard2(
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
            Row(
              children: [
                Text(label, style: const TextStyle(color: Colors.grey)),
                const Spacer(),
                Icon(icon, size: 32, color: Colors.grey),
              ],
            ),
            const Row(
              children: [
                Text("1.24%",
                    style: TextStyle(fontSize: 20, color: Colors.red)),
                Icon(Icons.arrow_downward, size: 16, color: Colors.red),
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

class BiddingSummayGroup extends StatelessWidget {
  const BiddingSummayGroup({Key? key}) : super(key: key);

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
          const BiddingSummanyCard(
              icon: Icons.bar_chart, value: "35K", label: "Total Sales"),
          const BiddingSummanyCard(
              icon: Icons.trending_up, value: "2,153", label: "Average Sales"),
          const BiddingSummanyCard(
              icon: Icons.bar_chart, value: "35K", label: "Total Sales"),
          const BiddingSummanyCard(
              icon: Icons.trending_up, value: "2,153", label: "Average Sales"),
        ],
      ),
    );
  }
}

class BiddingSummayGroup2 extends StatelessWidget {
  const BiddingSummayGroup2({Key? key}) : super(key: key);

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
          const BiddingSummanyCard2(
              icon: Icons.bar_chart, value: "35K", label: "Total Sales"),
          const BiddingSummanyCard2(
              icon: Icons.trending_up, value: "2,153", label: "Average Sales"),
          const BiddingSummanyCard2(
              icon: Icons.bar_chart, value: "35K", label: "Total Sales"),
          const BiddingSummanyCard2(
              icon: Icons.trending_up, value: "2,153", label: "Average Sales"),
        ],
      ),
    );
  }
}
