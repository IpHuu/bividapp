import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/kehoachcongtac/ke_hoach_cong_tac.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
// import 'package:styled_text/styled_text.dart';

class KeHoachCongTacItem extends StatelessWidget {
  const KeHoachCongTacItem(
      {Key? key, required this.keHoachCongTac, this.showAction = true})
      : super(key: key);
  final KeHoachCongTac keHoachCongTac;
  final bool showAction;

  @override
  Widget build(BuildContext context) {
    return _builKeHoachCongTacItem(context: context, item: keHoachCongTac);
  }

  Widget _builKeHoachCongTacItem(
      {required BuildContext context, required KeHoachCongTac item}) {
    // final dateFmt = DateFormat('dd/MM/yyyy');
    // final moneyFmt = NumberFormat("#,###", "en_US");

    // final tuNgayText = item.tuNgay == null ? '' : dateFmt.format(item.tuNgay!);
    // final denNgayText = item.denNgay == null ? '' : dateFmt.format(item.denNgay!);
    // final tienDeXuatText = moneyFmt.format(item.tongTien);
    return GestureDetector(
      onTap: () {
        MyNavigation.intentWithData(
          ScreenRouteName.previewKeHoachCongTacPage,
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
                      "KẾ HOẠCH ĐI CÔNG TÁC",
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
                          width: 7,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Người lập: ${item.tenNguoiLamDon} - ${item.tenBoPhan}",
                                style: const TextStyle(
                                    color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                                    fontWeight: FontWeight.bold),
                              ),
                              ReadMoreText(
                                item.mucDichNguoi1,
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
                    fontSize: 10,
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
