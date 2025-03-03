import 'package:bividpharma/ui/my_navigation.dart';
import 'package:flutter/material.dart';

/// example widget for ota_update plugin
class PreviewImageFullPage extends StatefulWidget {
  const PreviewImageFullPage({Key? key, this.url, this.title})
      : super(key: key);
  final String? url;
  final String? title;

  @override
  State<PreviewImageFullPage> createState() => _PreviewImageFullPageState();
}

class _PreviewImageFullPageState extends State<PreviewImageFullPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageSrc = (widget.url ?? '');
    final previewImage = (imageSrc.isEmpty
        ? Image.asset(
            'assets/undraw_No_data_re_kwbl.png',
            scale: 0.5,
            width: 240,
            height: 240,
          )
        : Image.network(
            imageSrc,
            scale: 1.0,
            width: screenSize.width,
          ));
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
              color: Colors.white,
              onPressed: () {
                MyNavigation.back();
              }),
          elevation: 1,
          title: Text(widget.title ?? 'Xem hồ sơ'),
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
        ),
        body: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InteractiveViewer(
              panEnabled: true,
              clipBehavior:
                  Clip.hardEdge, // Set it to false to prevent panning.
              boundaryMargin: EdgeInsets.zero,
              minScale: 1.0,
              maxScale: 10.0,
              constrained: false,
              child: Container(
                color: Colors.white,
                child: SizedBox(
                    width: screenSize.width,
                    height: screenSize.height,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: previewImage.image,
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
