import 'package:bividpharma/pages/tongquan/thau/viewmodel/bidding_report_viewmodel.dart';
import 'package:bividpharma/utils/extensions/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SummaryPage1 extends StatelessWidget {
  const SummaryPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<BiddingReportViewmodel>();
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
          StatsCard(
              icon: Icons.bar_chart,
              value: (viewModel.listSummary?.first.slMoiThau ?? 0)
                  .toShortMoneyFormat(),
              label: "SL Mời Thầu"),
          BiddingSummanyCard2(
              icon: Icons.bar_chart,
              value: "",
              percent:
                  (viewModel.listSummary?.first.tlSlTrungThau ?? 0).toString(),
              label: "TLSL Trúng Thầu"),
          StatsCard(
              icon: Icons.bar_chart,
              value: (viewModel.listSummary?.first.giaTriMoiThau ?? 0)
                  .toShortMoneyFormat(),
              label: "GT Mời Thầu"),
          BiddingSummanyCard2(
              icon: Icons.bar_chart,
              percent:
                  (viewModel.listSummary?.first.tlGtTrungThau ?? 0).toString(),
              value: "",
              label: "TLGT Trúng Thầu"),
        ],
      ),
    );
  }
}

class SummaryPage2 extends StatelessWidget {
  const SummaryPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<BiddingReportViewmodel>();
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
          BiddingSummanyCard2(
              icon: Icons.bar_chart,
              value: "",
              percent: (viewModel.listSummary?.first.moiThauTTCungKy ?? 0)
                  .toString(),
              label: "Mời Thầu TT Cùng Kỳ"),
          StatsCard(
            icon: Icons.bar_chart,
            value: (viewModel.listSummary?.first.slTrungThau ?? 0)
                .toShortMoneyFormat(),
            label: "SL Trúng Thầu Trong Kỳ",
          ),
          BiddingSummanyCard2(
            icon: Icons.bar_chart,
            value: "",
            percent:
                (viewModel.listSummary?.first.moiThauTTCungKy ?? 0).toString(),
            label: "Mời thầu TT Cùng Kỳ",
          ),
          StatsCard(
            icon: Icons.bar_chart,
            value: (viewModel.listSummary?.first.giaTriTrungThau ?? 0)
                .toShortMoneyFormat(),
            label: "GT Trúng Thầu Trong Kỳ",
          ),
        ],
      ),
    );
  }
}

class SummaryPage3 extends StatelessWidget {
  const SummaryPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<BiddingReportViewmodel>();
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
          BiddingSummanyCard2(
              icon: Icons.bar_chart,
              value: "",
              percent: (viewModel.listSummary?.first.trungThauTTCungKy ?? 0)
                  .toString(),
              label: "Trúng Thầu TT Cùng Kỳ"),
          StatsCard(
            icon: Icons.bar_chart,
            value: (viewModel.listSummary?.first.slThauCungKy ?? 0)
                .toShortMoneyFormat(),
            label: "Số Lượng Thầu Cuối Kỳ",
          ),
          BiddingSummanyCard2(
            icon: Icons.bar_chart,
            value: "",
            percent: (viewModel.listSummary?.first.trungThauTTNamTruoc ?? 0)
                .toString(),
            label: "Trúng Thầu TT Năm Trước",
          ),
          StatsCard(
            icon: Icons.bar_chart,
            value: (viewModel.listSummary?.first.giaTriThauCuoiKy ?? 0)
                .toShortMoneyFormat(),
            label: "GT Trúng Thầu Cuối Kỳ",
          ),
        ],
      ),
    );
  }
}

class SummaryPage4 extends StatelessWidget {
  const SummaryPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<BiddingReportViewmodel>();
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
          BiddingSummanyCard2(
              icon: Icons.bar_chart,
              value: "",
              percent:
                  (viewModel.listSummary?.first.gtThauTTCungKy ?? 0).toString(),
              label: "GT Thầu TT Cùng Kỳ"),
          StatsCard(
            icon: Icons.bar_chart,
            value: (viewModel.listSummary?.first.slThucHien ?? 0).toString(),
            label: "Số Lượng Thực Hiện",
          ),
          BiddingSummanyCard2(
            icon: Icons.bar_chart,
            value: "",
            percent:
                (viewModel.listSummary?.first.gtThauTTNamTruoc ?? 0).toString(),
            label: "GT Thầu TT Năm Trước",
          ),
          StatsCard(
            icon: Icons.bar_chart,
            value: (viewModel.listSummary?.first.gtThucHien ?? 0).toString(),
            label: "Giá Trị Thực Hiện",
          ),
        ],
      ),
    );
  }
}

class SummaryPage5 extends StatelessWidget {
  const SummaryPage5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<BiddingReportViewmodel>();
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
          BiddingSummanyCard2(
              icon: Icons.bar_chart,
              value: "",
              percent: (viewModel.listSummary?.first.gtThucHienTTCungKy ?? 0)
                  .toString(),
              label: "GT Thực Hiện TT Cùng Kỳ"),
          StatsCard(
            icon: Icons.bar_chart,
            value: (viewModel.listSummary?.first.slTonThau ?? 0)
                .toShortMoneyFormat(),
            label: "Số Lượng Tồn Thầu Cuối Kỳ",
          ),
          BiddingSummanyCard2(
            icon: Icons.bar_chart,
            value: "",
            percent: (viewModel.listSummary?.first.gtThucHienTTNamTruoc ?? 0)
                .toString(),
            label: "GT Thực Hiện TT Năm Trước",
          ),
          StatsCard(
            icon: Icons.bar_chart,
            value: (viewModel.listSummary?.first.gtTonThauCuoiKy ?? 0)
                .toShortMoneyFormat(),
            label: "GT Tồn Thầu Cuối Kỳ",
          ),
        ],
      ),
    );
  }
}

class SummaryPage6 extends StatelessWidget {
  const SummaryPage6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<BiddingReportViewmodel>();
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
          BiddingSummanyCard2(
              icon: Icons.bar_chart,
              value: "",
              percent: (viewModel.listSummary?.first.gtTonThauTTCungKy ?? 0)
                  .toString(),
              label: "Giá Trị Tồn Thầu TT Cùng Kỳ"),
          StatsCard(
            icon: Icons.bar_chart,
            value: (viewModel.listSummary?.first.slBoThau ?? 0)
                .toShortMoneyFormat(),
            label: "Số Lượng Bỏ Thầu",
          ),
          BiddingSummanyCard2(
            icon: Icons.bar_chart,
            value: "",
            percent: (viewModel.listSummary?.first.gtTonThauTTNamTruoc ?? 0)
                .toString(),
            label: "Giá Trị Tồn Thầu TT Năm Trước",
          ),
          StatsCard(
            icon: Icons.bar_chart,
            value: (viewModel.listSummary?.first.gtBoThau ?? 0)
                .toShortMoneyFormat(),
            label: "GT Bỏ Thầu",
          ),
        ],
      ),
    );
  }
}

class SummaryPage7 extends StatelessWidget {
  const SummaryPage7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<BiddingReportViewmodel>();
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
          BiddingSummanyCard2(
              icon: Icons.bar_chart,
              value: "",
              percent: (viewModel.listSummary?.first.gtTBoThauTTCungKy ?? 0)
                  .toString(),
              label: "Giá Trị Bỏ Thầu TT Cùng Kỳ"),
          BiddingSummanyCard2(
            icon: Icons.bar_chart,
            value: "",
            percent: (viewModel.listSummary?.first.gtTBoThauNamTruoc ?? 0)
                .toString(),
            label: "Giá Trị Bỏ Thầu TT Năm Trước",
          ),
        ],
      ),
    );
  }
}

class BiddingSummanyCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final String? percent;
  const BiddingSummanyCard(
      {Key? key,
      required this.icon,
      required this.value,
      required this.label,
      this.percent})
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
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ),
                // Icon(icon, size: 20, color: Colors.grey),
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
            Row(
              children: [
                const Text("-17.6M", style: TextStyle(color: Colors.grey)),
                const SizedBox(
                  width: 8,
                ),
                Text("$percent%",
                    style: const TextStyle(fontSize: 16, color: Colors.red)),
                const Icon(Icons.arrow_downward, size: 16, color: Colors.red),
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

class BiddingSummanyCard2 extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final String? percent;
  const BiddingSummanyCard2(
      {Key? key,
      required this.icon,
      required this.value,
      required this.label,
      this.percent})
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
                Text("${percent ?? 0}%",
                    style: const TextStyle(fontSize: 20, color: Colors.red)),
                const Icon(Icons.arrow_downward, size: 16, color: Colors.red),
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

class BiddingSummaryGroup extends StatelessWidget {
  const BiddingSummaryGroup({Key? key}) : super(key: key);

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

class BiddingSummaryGroup2 extends StatelessWidget {
  const BiddingSummaryGroup2({Key? key}) : super(key: key);

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
                Icon(icon, size: 20, color: Colors.grey),
              ],
            ),
            // Icon(icon, size: 32, color: Colors.grey),
            Text(value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            // const Text("", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
