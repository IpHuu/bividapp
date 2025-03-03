import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/ui/widgets/empty_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshListWidget extends StatefulWidget {
  const RefreshListWidget(
      {Key? key,
      this.slideRemoveAction,
      required this.createItem,
      required this.loadPaged,
      required this.refreshController})
      : super(key: key);

  final DynamicVoidCallback? slideRemoveAction;
  final DynamicCreateCallback<Widget> createItem;
  final DynamicCallbackAsync<List<dynamic>> loadPaged;
  final RefreshController refreshController;

  @override
  State<RefreshListWidget> createState() => _RefreshListWidgetState();
}

class _RefreshListWidgetState extends State<RefreshListWidget> {
  final ScrollController _listController = ScrollController();

  final List<dynamic> _listSource = [];
  late bool _isLoading = false;
  late bool _firstLoading = true;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: const WaterDropHeader(),
      footer: CustomFooter(
        builder: (context, mode) => _buildListFooter(context, mode),
      ),
      controller: widget.refreshController,
      onRefresh: _onRefresh,
      // onLoading: _onLoading,
      child: _buildList(),
    );
  }

  @override
  void didUpdateWidget(covariant RefreshListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_firstLoading) {
      _onRefresh();
      _firstLoading = false;
    }
  }

  Widget _buildList() {
    final theme = Theme.of(context);
    final isEmpty = _listSource.isEmpty && !_isLoading;
    final Widget emptyWidget = (isEmpty)
        ? EmptyListWidget(
            emptyText: 'Không có dữ liệu',
            onRefresh: _onRefresh,
          )
        : Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.search_circle_fill,
                    size: 48,
                    color: theme.primaryColor,
                  ),
                ),
                DefaultTextStyle(
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Horizon',
                      color: theme.primaryColor),
                  child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                    TypewriterAnimatedText('Đang tải dữ liệu...'),
                    WavyAnimatedText('Đang tải dữ liệu...',
                        speed: const Duration(milliseconds: 100)),
                    TypewriterAnimatedText('Đang tải dữ liệu...'),
                  ]),
                ),
              ],
            ),
          );
    if (_listSource.isEmpty) {
      return Center(child: emptyWidget);
    } else {
      return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _listController,
              itemCount: _listSource.length + 1,
              itemBuilder: (context, index) {
                if (index == _listSource.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text('Không còn dữ liệu.'),
                    ),
                  );
                } else {
                  final item = _listSource[index];
                  return widget.createItem.call(item);
                }
              }));
    }
  }

  Widget _buildListFooter(BuildContext context, LoadStatus? mode) {
    Widget body;
    if (mode == LoadStatus.idle) {
      body = const Text("pull up load");
    } else if (mode == LoadStatus.loading) {
      body = const CupertinoActivityIndicator();
    } else if (mode == LoadStatus.failed) {
      body = const Text("Load Failed!Click retry!");
    } else if (mode == LoadStatus.canLoading) {
      body = const Text("release to load more");
    } else {
      body = const Text("Không còn dữ liệu");
    }
    return SizedBox(
      height: 55.0,
      child: Center(child: body),
    );
  }

  Future<void> _onRefresh() async {
    try {
      if (widget.refreshController.headerMode != null) {
        widget.refreshController.headerMode!.value = RefreshStatus.refreshing;
      }
      await _onLoading();
    } on Exception catch (_) {
    } finally {
      widget.refreshController.refreshCompleted();
    }
  }

  Future<void> _onLoading() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    await _refreshData();
    widget.refreshController.loadComplete();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshData() async {
    final newItems = await widget.loadPaged.call();
    if (mounted) {
      _listSource.clear();
      setState(() {
        _listSource.addAll(newItems);
      });
    }
  }

  // _onSlideRemoveItem(dynamic item) async {
  //   if (mounted) {
  //     widget.slideRemoveAction?.call(item);
  //   }
  // }
}
