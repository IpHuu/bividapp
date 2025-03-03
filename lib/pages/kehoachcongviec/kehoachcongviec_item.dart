import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/pages/kehoachcongviec/dtos/phieu_ke_hoach_cong_viec.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class KeHoachCongViecItem extends StatelessWidget {
  const KeHoachCongViecItem(
      {Key? key,
      required this.kehoachcongviec,
      this.showAction = true,
      this.commandCallback})
      : super(key: key);
  final KeHoachCongViec kehoachcongviec;
  final bool showAction;
  final DocumentActionCallback? commandCallback;

  @override
  Widget build(BuildContext context) {
    return _builKeHoachCongViecItem(context: context, item: kehoachcongviec);
  }

  Widget _builKeHoachCongViecItem(
      {required BuildContext context, required KeHoachCongViec item}) {
    //final dateFmt = DateFormat('dd/MM/yyyy');
    //final moneyFmt = NumberFormat("#,###", "en_US");

    return GestureDetector(
      onTap: () {
        MyNavigation.intentWithData(
          ScreenRouteName.previewKHCVPage,
          arguments: DocumentArgs(
              maCongTy: item.maCongTy,
              reportId: item.idKeHoachCongViec,
              tinhTrang: item.tinhTrang,
              showAction: showAction),
        );
      },
      child: Stack(
        children: [
          Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: UIHelper.BIVID_WHITE_BACKGROUND_COLOR,
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Text(
                      "KẾ HOẠCH CÔNG VIỆC",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: CachedNetworkImage(
                              progressIndicatorBuilder:
                                  (context, url, progress) => Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                              imageUrl: item.logoCongTy,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Người lập: ${item.tenNhanvien} - ${item.tenBoPhan}",
                                style: const TextStyle(
                                    color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Thời gian thực hiện: ${item.thoiGianThucHien}",
                                style: const TextStyle(
                                    color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReadMoreText(
                                "${item.veViec}",
                                trimLines: 3,
                                colorClickableText: Colors.red,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: ' xem thêm',
                                trimExpandedText: ' thu nhỏ',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18),
                                moreStyle: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic),
                                lessStyle: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: [
                              //     Text(
                              //       item.tinhTrangChu,
                              //       style: TextStyle(
                              //         color: Theme.of(context).primaryColor,
                              //         fontStyle: FontStyle.italic,
                              //         fontSize: 14,
                              //       ),
                              //     )
                              //   ],
                              // ),
                              const SizedBox(
                                height: 7,
                              ),
                              _buildFooter(context, item),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  (item.soPhieuAuto ?? ''),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: UIHelper.BIVID_BLACK_TEXT_COLOR.withOpacity(0.6),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, KeHoachCongViec item) {
    final theme = Theme.of(context);
    final childs = <Widget>[];

    childs.add(Text(
      (item.isHuy) ? 'Đã hủy' : item.tinhTrangChu,
      style: TextStyle(
        color: (item.isHuy) ? Colors.red : Theme.of(context).primaryColor,
        fontStyle: FontStyle.italic,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ));

    if (((item.tinhTrang == 0 && item.versionNo == 1) ||
            (item.tinhTrang == 1 && item.versionNo == 2)) &&
        !item.isHuy) {
      childs.add(const SizedBox(
        width: 15,
      ));
      childs.add(TextButton.icon(
        onPressed: () {
          commandCallback?.call(item);
        },
        icon: const Icon(Icons.list),
        label: const Text(''),
        style: TextButton.styleFrom(foregroundColor: theme.primaryColor),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: childs,
    );
  }
}
