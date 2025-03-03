import 'package:bividpharma/ui/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyListWidget extends StatefulWidget {
  const EmptyListWidget(
      {Key? key, required this.onRefresh, this.emptyText = ''})
      : super(key: key);
  final VoidCallback onRefresh;
  final String emptyText;

  @override
  State<EmptyListWidget> createState() => _EmptyListWidgetState();
}

class _EmptyListWidgetState extends State<EmptyListWidget>
    with TickerProviderStateMixin {
  late bool _processing = false;
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.stop();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
      backgroundColor: Theme.of(context).primaryColor,
      minimumSize: const Size(100, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
    final titleText = widget.emptyText.isEmpty
        ? 'Không có hồ sơ cần ký duyệt.'
        : widget.emptyText;
    final screenW = MediaQuery.of(context).size.width;
    //final screenH = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 100,
      ),
      child: Center(
        heightFactor: 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/undraw_no_data_re_kwbl.svg",
                  color: UIHelper.BIVID_THIRD_COLOR,
                  fit: BoxFit.scaleDown,
                  matchTextDirection: true,
                ),
              ),
            ),
            Center(
              heightFactor: 1.2,
              child: Text(
                titleText,
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 18),
              ),
            ),
            Center(
              heightFactor: 1.2,
              child: _processing
                  ? SizedBox(
                      width: screenW * 0.6,
                      child: LinearProgressIndicator(
                        value: controller.value,
                        semanticsLabel: 'Đang tải dữ liệu...',
                      ),
                    )
                  : SizedBox(
                      width: 140,
                      child: ElevatedButton(
                        style: raisedButtonStyle,
                        onPressed: () async {
                          debugPrint('test ElevatedButton');
                          setState(() {
                            _processing = true;
                          });
                          Future.sync(() => widget.onRefresh()).then((value) {
                            if (!mounted) return;
                            setState(() {
                              _processing = false;
                            });
                          });
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.refresh,
                                color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
                              ),
                              Text("Tải lại"),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
