import 'package:bividpharma/model/enums/type_thau.dart';
import 'package:bividpharma/pages/tongquan/thau/view/bidding_detail_page.dart';
import 'package:bividpharma/pages/tongquan/thau/viewmodel/bidding_report_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BiddingOptionsGrid extends StatelessWidget {
  const BiddingOptionsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {"title": "Chi Nhánh"},
      {"title": "Nhóm khách hàng"},
      {"title": "Nhóm sản phẩm"},
      {"title": "Nhân viên"},
      {"title": "Khách hàng"},
      {"title": "Sản phẩm"},
      {"title": "Tồn thầu"},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            shrinkWrap: true, // Thêm vào để tránh lỗi
            physics:
                const NeverScrollableScrollPhysics(), // Ngăn cuộn bên trong GridView
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return OptionCard(
                title: items[index]["title"]!,
                index: index,
              );
            },
          );
        },
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String title;
  final int index;
  const OptionCard({Key? key, required this.title, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final viewModel = context.read<BiddingReportViewmodel>();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider.value(
              value: viewModel,
              child: BiddingDetailPage(
                typeThau: TypeThauExtension.fromValue(index + 1),
              ),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.bar_chart,
              size: 30,
              color: Colors.black54,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
