import 'package:bividpharma/common/utils.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/pages/system/preview_image_full_page.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:bividpharma/ui/widgets/document_approve_chart.dart';
// import 'package:bividpharma/ui/widgets/image_viewer_from_url.dart';
import 'package:flutter/material.dart';
// import 'package:mime/mime.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:http/http.dart' as http;

class DocumentPreviewer extends StatefulWidget {
  const DocumentPreviewer(
      {Key? key,
      required this.title,
      required this.documents,
      required this.onDocumentLoad,
      required this.previewUrl,
      required this.showCommandMenu,
      this.otherMenuWidget,
      required this.sheetMenu,
      this.documentCode = '',
      this.reportId = 0})
      : super(key: key);
  final Widget? otherMenuWidget;
  final List<AttachDocument> documents;
  final String? previewUrl;
  final bool showCommandMenu;
  final Widget sheetMenu;
  final String title;
  final String documentCode;
  final int reportId;

  final Future<String> Function(int reportId, int documentId) onDocumentLoad;

  @override
  State<DocumentPreviewer> createState() => _DocumentPreviewerState();
}

class _DocumentPreviewerState extends State<DocumentPreviewer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _extImages = [".jpg", ".png", ".jpeg"];
  //final List<String> _extOffices = [".xlsx", ".xls", ".doc", ".docx"];
  late BuildContext _context;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    final theme = Theme.of(_context);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 10,
        backgroundColor: theme.colorScheme.background,
      ),
      body: SafeArea(
          child: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(5.0),
        onInteractionEnd: (ScaleEndDetails endDetails) {
          setState(() {});
        },
        child: SingleChildScrollView(
          child: Container(
            color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPreview(),
                Center(child: _buildTabDetailView()),
                SizedBox(
                  height: screenSize.height,
                  width: screenSize.width,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildAttachedFilesView(),
                      _buildDocumentChart(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildPreview() {
    final theme = Theme.of(_context);
    if (widget.previewUrl != null && widget.previewUrl!.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Center(
            child: SizedBox(
              height: 100,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const CircularProgressIndicator(),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Đang tải dữ liệu...",
                  style: TextStyle(
                    color: theme.primaryColor,
                  ),
                ),
              ]),
            ),
          ),
        ),
      );
    }
    final ButtonStyle roundButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
      backgroundColor: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
      shadowColor: Colors.transparent,
      minimumSize: const Size(100, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );

    // ignore: unused_local_variable
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.black87,
      backgroundColor: Colors.grey[300],
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    final screenSize = MediaQuery.of(context).size;
    Widget menuView = (widget.showCommandMenu)
        ? Container(
            color: Colors.transparent,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceBetween,
              children: [
                widget.otherMenuWidget == null
                    ? Container()
                    : widget.otherMenuWidget!,
                SizedBox(
                  width: 40,
                  child: IconButton(
                    style: roundButtonStyle,
                    onPressed: () {
                      _showBottomMenu();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: theme.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          )
        : Container();

    final imageSrc = (widget.previewUrl ?? '');
    final previewImage = (imageSrc.isEmpty
        ? Image.asset(
            'assets/undraw_No_data_re_kwbl.png',
            scale: 0.5,
            width: 240,
            height: 240,
          )
        : Image.network(imageSrc));

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            constraints: BoxConstraints(maxHeight: screenSize.height * 0.4),
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.white, Colors.white],
                  stops: <double>[0.0, 1.0],
                ),
                border: Border.all(width: 0, color: theme.primaryColor)),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: screenSize.height * 0.4,
                      child: ListView(
                        shrinkWrap: false,
                        children: [
                          previewImage,
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () => _onOpenZoomPage(imageSrc),
                          icon: Icon(
                            Icons.zoom_in,
                            color: theme.primaryColor,
                          )),
                      // const Spacer(),
                      menuView,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onOpenZoomPage(imageSrc) {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (_) => PreviewImageFullPage(
          url: imageSrc,
          title: widget.title,
        ),
      ),
    );
  }

  Widget _buildAttachedFilesView() {
    final theme = Theme.of(_context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.white, Colors.white],
            stops: <double>[0.0, 1.0],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(_context).size.height / 2,
                child: widget.documents.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Không có tập tin đính kèm.',
                          style:
                              TextStyle(color: Theme.of(_context).primaryColor),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: false,
                        itemCount: widget.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          AttachDocument item = widget.documents[index];
                          return GestureDetector(
                            onTap: () {
                              _openFile(item);
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.note,
                                color: theme.primaryColor,
                              ),
                              title: Text(
                                "${item.fileName ?? ""}${item.extension}",
                                style: const TextStyle(
                                    color: UIHelper.BIVID_BLACK_TEXT_COLOR),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentChart() {
    //return const Text('page 1');
    return DocumentApproveChart(
      documentCode: widget.documentCode,
      reportId: widget.reportId,
      titleText: widget.title,
    );
  }

  Widget _buildTabDetailView() {
    final theme = Theme.of(context);
    List<Tab> myTabs = <Tab>[
      Tab(
        height: 48,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.attach_file,
              color: theme.primaryColor,
            ),
            const SizedBox(width: 8),
            const Text('Tập tin đính kèm'),
          ],
        ),
      ),
      Tab(
        height: 48,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.dashboard_customize_outlined,
              color: theme.primaryColor,
            ),
            const SizedBox(width: 8),
            const Text('Sơ đồ duyệt'),
          ],
        ),
      ),
    ];
    return TabBar(
      labelColor: theme.primaryColor,
      isScrollable: true,
      controller: _tabController,
      tabs: myTabs,
    );
  }

  void _showBottomMenu() {
    showMaterialModalBottomSheet(
      expand: false,
      context: _context,
      backgroundColor: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
      builder: (con) => widget.sheetMenu,
    ).then((value) => _closeMenu(value));
  }

  void _openFile(AttachDocument item) {
    final String? extName = item.extension?.toLowerCase();
    if (_extImages.contains(extName)) {
      _openUrlImageFile(item);
    } else if (extName == ".pdf") {
      _openUrlPdfFile(item);
    } else {
      _openUrlOtherFile(item);
    }
  }

  void _closeMenu(value) {
    // ignore: avoid_print
    print(value);
  }

  Future<void> _openUrlPdfFile(AttachDocument document) async {
    String documentUrl =
        await widget.onDocumentLoad(int.parse(document.code!), document.id!);
    final title = "${document.fileName ?? ""}${document.extension}";
    if (!mounted) return;
    final uri = Uri.parse(documentUrl);
    // final fileExt = lookupMimeType('test.html');

    final result = await http.get(uri);
    var fileIsAnImage = false;
    if (result.statusCode == 200) {
      final data = result.headers;
      final conType = data['content-type'];
      fileIsAnImage = conType == null ? false : checkIfImage(conType);
    }
    if (fileIsAnImage) {
      if (!mounted) return;
      UIHelper.openUrlImageFile(_context, documentUrl, title);
    } else {
      if (!mounted) return;
      UIHelper.openUrlPdfFile(_context, documentUrl, title);
    }
  }

  Future<void> _openUrlImageFile(AttachDocument document) async {
    String documentUrl =
        await widget.onDocumentLoad(int.parse(document.code!), document.id!);
    final title = "${document.fileName ?? ""}${document.extension}";
    if (!mounted) return;
    UIHelper.openUrlImageFile(_context, documentUrl, title);
  }

  Future<void> _openUrlOtherFile(AttachDocument document) async {
    String documentUrl =
        await widget.onDocumentLoad(int.parse(document.code!), document.id!);
    if (!mounted) return;
    UIHelper.launchInBrowser(_context, documentUrl);
  }
}
