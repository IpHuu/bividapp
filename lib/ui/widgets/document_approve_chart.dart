import 'dart:async';

import 'package:bividpharma/model/dtos/common/document_chart_data.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:bividpharma/ui/widgets/empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DocumentApproveChart extends StatefulWidget {
  const DocumentApproveChart(
      {Key? key,
      required this.documentCode,
      required this.titleText,
      required this.reportId})
      : super(key: key);

  final String? documentCode;
  final String? titleText;
  final int? reportId;

  @override
  State<DocumentApproveChart> createState() => _DocumentApproveChartState();
}

class _DocumentApproveChartState extends State<DocumentApproveChart> {
  final List<DocumentChartData> _documents = [];
  // ignore: unused_field
  late StreamSubscription<int> _documentChartSub;
  late String _documentCode = '';
  late int _reportId = 0;
  //late String _titleText = 'Không Tiêu Đề';

  @override
  void initState() {
    super.initState();
    _reportId = widget.reportId ?? 0;
    _documentCode = widget.documentCode ?? '';
    //_titleText = widget.titleText ?? 'Không Tiêu Đề';
    final mainModel = context.read<MainPageModel>();
    _documentChartSub = mainModel.documentChartStream.stream.listen((event) {
      if (event != _reportId) return;
      _loadData();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadData();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    late bool finished = false;

    List<Widget> chartItems = List<Widget>.generate(_documents.length, (index) {
      final dataItem = _documents[index];
      return Expanded(child: _buildChartItem(dataItem));
    });

    if (chartItems.isNotEmpty) {
      finished = _documents.last.approved;
      final indicatorColor = finished ? theme.primaryColor : Colors.black54;
      //header
      chartItems.insert(
          0,
          Expanded(
            child: TimelineTile(
              alignment: TimelineAlign.center,
              isLast: false,
              isFirst: true,
              beforeLineStyle: LineStyle(color: theme.primaryColor),
              afterLineStyle: LineStyle(color: theme.primaryColor),
              indicatorStyle: IndicatorStyle(
                drawGap: false,
                width: 240,
                height: 80,
                padding: const EdgeInsets.only(top: 0),
                indicator: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: IconButton(
                    iconSize: 32,
                    onPressed: _onRefreshPressed,
                    icon: const Icon(Icons.refresh),
                    color: theme.primaryColor,
                  ),
                ),
              ),
            ),
          ));
      //footer
      chartItems.add(Expanded(
        child: TimelineTile(
          alignment: TimelineAlign.center,
          isLast: true,
          isFirst: false,
          beforeLineStyle: LineStyle(color: indicatorColor),
          indicatorStyle: IndicatorStyle(
            width: 240,
            height: 80,
            padding: const EdgeInsets.all(2),
            color: indicatorColor,
            indicator: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      'Hoàn tất hồ sơ',
                      maxLines: 5,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ));
    } else {
      chartItems.add(Expanded(
        child: EmptyListWidget(
          onRefresh: _loadData,
          emptyText: 'Không có dữ liệu',
        ),
      ));
    }
    return Container(
      padding: const EdgeInsets.all(7),
      constraints: BoxConstraints(maxHeight: screenSize.height * 2),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.white24,
          Colors.blue,
        ],
      )),
      //child: const Text('Page 3'),
      child: Column(
        //shrinkWrap: true,
        mainAxisSize: MainAxisSize.max,
        children: chartItems,
      ),
    );
  }

  Widget _buildChartItem(DocumentChartData item) {
    final theme = Theme.of(context);
    final dateFmt = DateFormat('dd/MM/yyyy');
    final timeFmt = DateFormat('HH:mm');
    //final moneyFmt = NumberFormat("#,###", "en_US");
    final indicatorColor = item.approved ? theme.primaryColor : Colors.black54;
    final textColor = item.approved ? theme.primaryColor : Colors.black54;
    final String dateText =
        item.approvedDate != null ? dateFmt.format(item.approvedDate!) : '';
    final String timeText =
        item.approvedDate != null ? timeFmt.format(item.approvedDate!) : '';
    final rightTitle = Container(
        constraints: const BoxConstraints(minHeight: 120),
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.personName,
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
            ),
            Text(
              item.titleName,
              style: TextStyle(fontWeight: FontWeight.normal, color: textColor),
            )
          ],
        ));
    final leftTile = Container(
      padding: const EdgeInsets.all(0),
      color: Colors.transparent,
      constraints: const BoxConstraints(minHeight: 120),
      child: Container(
        padding: const EdgeInsets.all(2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Ký ngày $dateText',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 12,
              ),
            ),
            Text(
              'lúc $timeText',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
    return TimelineTile(
      alignment: TimelineAlign.center,
      isFirst: false,
      isLast: false,
      beforeLineStyle: LineStyle(color: textColor),
      indicatorStyle: IndicatorStyle(
        width: 24,
        color: indicatorColor,
        indicatorXY: 0.2,
        padding: const EdgeInsets.all(4),
      ),
      startChild: item.approved ? leftTile : const Text(''),
      endChild: rightTitle,
    );
  }

  void _onRefreshPressed() {
    _loadData();
  }

  void _loadData() {
    ApiCoreService.loadDocumentChart(_reportId, _documentCode).then((list) => {
          if (mounted)
            {
              setState(() {
                _documents.clear();
                _documents.addAll(list);
              })
            }
        });
  }
}
