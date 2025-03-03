import 'package:bividpharma/ui/my_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// example widget for ota_update plugin
class EmptyFunctionPage extends StatefulWidget {
  const EmptyFunctionPage({Key? key}) : super(key: key);

  @override
  State<EmptyFunctionPage> createState() => _EmptyFunctionPageState();
}

class _EmptyFunctionPageState extends State<EmptyFunctionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
              color: Colors.white,
              onPressed: () {
                MyNavigation.back();
              }),
          elevation: 1,
          title: const Text('Tính năng đang phát triển'),
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            SizedBox(
              width: 220,
              height: 320,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/undraw_os_upgrade_re_r0qa.svg",
                  matchTextDirection: true,
                  color: Colors.transparent,
                  colorBlendMode: BlendMode.color,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Text(
                  'Vui lòng thử lại sau!',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Text(
                  "Cám ơn bạn đã quan tâm tính năng này, chúng tôi đang tích cực phát triển & sẽ sớm cập nhật trong thời gian tới.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
