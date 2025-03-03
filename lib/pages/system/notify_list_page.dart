// ignore_for_file: must_be_immutable
import 'dart:async';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/local_message.dart';
import 'package:bividpharma/model/dtos/common/user_notify.dart';
import 'package:bividpharma/model/main_page_model.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:bividpharma/services/local_message_service.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/ui/widgets/refresh_list_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotifyListPage extends StatefulWidget {
  NotifyListPage({Key? key, title = "", this.showTitle = true})
      : super(key: key);

  final bool showTitle;

  @protected
  late String title = '';
  late MainPageModel _mainPageModel;

  @override
  State createState() => NotifyListPageState();
}

class NotifyListPageState extends State<NotifyListPage>
    with SingleTickerProviderStateMixin {
  final RefreshController _rfSystemController =
      RefreshController(initialRefresh: false);
  final RefreshController _rfOrderController =
      RefreshController(initialRefresh: false);
  final RefreshController _rfSignedController =
      RefreshController(initialRefresh: false);
  final RefreshController _rfTimekeepingController =
      RefreshController(initialRefresh: false);

  late TabController _tabController;
  final List<TabInfo> _tabHeaders = <TabInfo>[];
  late StreamSubscription<LocalMessage> _localMessageSub;

  @override
  void initState() {
    _loadMyMessage();
    _tabHeaders.addAll([
      TabInfo(
          docType: Constants.notifySYSTEM,
          tab: const Tab(
            text: 'Hệ thống',
          ),
          refreshController: _rfSystemController),
      TabInfo(
          docType: Constants.notifySIGNED,
          tab: const Tab(
            text: 'Trình ký',
          ),
          refreshController: _rfSignedController),
      TabInfo(
          docType: Constants.notifyORDER,
          tab: const Tab(
            text: 'Đơn hàng',
          ),
          refreshController: _rfOrderController),
      TabInfo(
          docType: Constants.notifyTIMIEKEEPING,
          tab: const Tab(
            text: 'Chấm công',
          ),
          refreshController: _rfTimekeepingController)
    ]);

    widget._mainPageModel = context.read<MainPageModel>();
    _localMessageSub = widget._mainPageModel.localMessageStreamController.stream
        .listen(_onLocalMessageTrigger);
    _tabController = TabController(vsync: this, length: _tabHeaders.length);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _localMessageSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.zero,
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: TabBar(
                controller: _tabController,
                tabs: _tabHeaders.map((e) => e.tab).toList(),
                indicatorColor: Theme.of(context).focusColor,
                isScrollable: true,
              ),
            ),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  gradient: UIHelper.linearGradientBackground(context),
                ),
                child: TabBarView(
                  // physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: _tabHeaders.map((TabInfo tab) {
                    return _buildTabViewItem(tab);
                  }).toList(),
                )),
          ),
        ],
      ),
    );
  }

  void _loadMyMessage() async {
    //
    final model = context.read<MainPageModel>();
    final lst1 = await ApiCoreService.loadUserNotify(
        model.loginedUser.userName, Constants.notifySYSTEM);
    final lst2 = await ApiCoreService.loadUserNotify(
        model.loginedUser.userName, Constants.notifySIGNED);
    final lst3 = await ApiCoreService.loadUserNotify(
        model.loginedUser.userName, Constants.notifyORDER);
    final lst4 = await ApiCoreService.loadUserNotify(
        model.loginedUser.userName, Constants.notifyTIMIEKEEPING);

    List<UserNotify> newList = [];
    newList.addAll(lst1);
    newList.addAll(lst2);
    newList.addAll(lst3);
    newList.addAll(lst4);

    for (var item in newList) {
      if (item.body == null ||
          item.title == null ||
          item.notifyCode == null ||
          item.id == null) continue;
      LocalMessage newMsg = LocalMessage(
          docType: item.notifyCode!, title: item.title, body: item.body);

      newMsg.imageUrl = item.imageUrl;
      newMsg.cloudId = item.id!;
      newMsg.createDate = item.postDate ?? DateTime.now();

      LocalMessageService.addCloudMessageItem(newMsg);
    }
    setState(() {});
  }

  Widget _buildTabViewItem(TabInfo tab) {
    return RefreshListWidget(
      createItem: (item) {
        return _createListItem(item, tab);
      },
      loadPaged: ({item}) {
        return _loadPaged(tab.docType);
      },
      refreshController: tab.refreshController,
      slideRemoveAction: (item) {
        LocalMessageService.removdeMessage(item.id);
        UIHelper.showOk(context, 'Đã xóa một thông báo khỏi thiết bị.');
      },
    );
  }

  void _onLocalMessageTrigger(event) async {
    if (!mounted) return;
    final data = event as LocalMessage?;
    if (data == null) return;
    if (mounted) {
      _tabHeaders[_tabController.index].refreshController.requestRefresh();
    }
  }

  Widget _createListItem(LocalMessage item, TabInfo tab) {
    final bodyText = item.body ?? '';
    final titleText = item.title ?? '';
    final trailText = DataHelper.formatDateString(item.createDate);
    final theme = Theme.of(context);
    List<Widget> childs = [];
    childs.add(ListTile(
      title: Html(
        data: '<h3>$titleText</h3>',
        style: {
          "h3": Style(color: theme.primaryColor, fontWeight: FontWeight.bold)
        },
      ),
      subtitle: Html(
        data: bodyText,
      ),
      trailing: IconButton(
          onPressed: () {
            try {
              LocalMessageService.removdeMessage(item.id);
              tab.refreshController.requestRefresh();
              UIHelper.showOk(context, 'Đã xóa một thông báo khỏi thiết bị.');
            } catch (_) {
              //
            }
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          )),
    ));
    final imageUrl = item.imageUrl ?? '';
    if (imageUrl.isNotEmpty) {
      final imageBox = CachedNetworkImage(
        imageUrl: imageUrl,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
      childs.add(imageBox);
    }
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, right: 15, left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: theme.primaryColor.withOpacity(0.8),
            ),
            child: Text(
              trailText,
              style: const TextStyle(
                  color: UIHelper.BIVID_WHITE_TEXT_COLOR, fontSize: 11),
            ),
          ),
          Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            borderOnForeground: true,
            color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 100,
              ),
              padding:
                  const EdgeInsets.only(bottom: 3, left: 3, right: 3, top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  gradient: UIHelper.lineTopDownBackground(context)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: childs,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<LocalMessage>> _loadPaged(String docType) async {
    try {
      final list = LocalMessageService.readMessageDoctype(docType);
      debugPrint('LocalMessageService.readMessageDoctype: $docType');
      return Future.value(list);
    } on Exception catch (_, ex) {
      debugPrint(ex.toString());
    } finally {}
    return <LocalMessage>[];
  }
}

class TabInfo {
  final Tab tab;
  final RefreshController refreshController;
  final String docType;

  TabInfo(
      {required this.docType,
      required this.tab,
      required this.refreshController});
}
