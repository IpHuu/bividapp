import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PDFViewerFromUrl extends StatelessWidget {
  const PDFViewerFromUrl({Key? key, required this.url, required this.fileName})
      : super(key: key);
  final String url;
  final String fileName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tài liệu đính kèm - $fileName"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: const PDF().fromUrl(
        url,
        placeholder: (double progress) =>
            Center(child: Text('Đang tải $progress %')),
        errorWidget: (dynamic error) =>
            Center(child: Text('Không thể tải tập tin: $fileName')),
      ),
    );
  }
}
