import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/giayracong/giay_ra_cong.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:styled_text/styled_text.dart';

class GiayRaCongItem extends StatelessWidget {
  const GiayRaCongItem(
      {Key? key, required this.giayRaCong, this.showAction = true})
      : super(key: key);
  final GiayRaCong giayRaCong;
  final bool showAction;

  @override
  Widget build(BuildContext context) {
    return _buildGiayRaCongItem(context: context, item: giayRaCong);
  }

  Widget _buildGiayRaCongItem(
      {required BuildContext context, required GiayRaCong item}) {
    final dateFmt = DateFormat('dd/MM/yyyy');
    final denNgayText =
        item.denNgay == null ? "" : dateFmt.format(item.denNgay!);
    final tuNgayText = item.tuNgay == null ? "" : dateFmt.format(item.tuNgay!);

    return GestureDetector(
      onTap: () {
        MyNavigation.intentWithData(
          ScreenRouteName.previewGiayRaCongPage,
          arguments: DocumentArgs(
              maCongTy: item.maCongTy,
              reportId: item.idGiayXinPhep,
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
                      "GIẤY RA CỔNG",
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
                                "Gửi bởi: ${item.tenNguoiLamDon} - ${item.boPhanNhanVien}",
                                style: const TextStyle(
                                    color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReadMoreText(
                                item.lyDo,
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
                              StyledText(
                                  text:
                                      'Thời gian từ: $tuNgayText đến $denNgayText <bold>(${item.tongThoiGian} giờ)</bold>',
                                  tags: {
                                    'bold': StyledTextTag(
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  },
                                  style: const TextStyle(
                                    color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                                  )),
                              const SizedBox(
                                height: 7,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    item.tinhTrangChu,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              )
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
}
