import 'package:bividpharma/ui/ui_helper.dart';
import 'package:flutter/material.dart';

class ImageViewerFromUrl extends StatelessWidget {
  const ImageViewerFromUrl(
      {Key? key, required this.url, required this.fileName})
      : super(key: key);
  final String url;
  final String fileName;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tài liệu đính kèm - $fileName"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: InteractiveViewer(
        child: Container(
          height: size.height - 20,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.blueGrey,
                offset: Offset(
                  5.0,
                  5.0,
                ), //Offset
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          child: Expanded(child: Image.network(url)),
        ),
      ),
    );
  }
}
