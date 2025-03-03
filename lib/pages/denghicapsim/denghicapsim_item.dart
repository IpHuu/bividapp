import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/denghicapsim/de_nghi_cap_sim.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:styled_text/styled_text.dart';

class DeNghiCapSimItem extends StatelessWidget {
  const DeNghiCapSimItem(
      {Key? key, required this.deNghiCapSim, this.showAction = true})
      : super(key: key);
  final DeNghiCapSim deNghiCapSim;
  final bool showAction;

  @override
  Widget build(BuildContext context) {
    return _buildDeNghiCapSimItem(context: context, item: deNghiCapSim);
  }

  Widget _buildDeNghiCapSimItem(
      {required BuildContext context, required DeNghiCapSim item}) {
    // final ngayDeNghiText = DataHelper.formatDateVn(item.ngayDeNghi);
    final tienDeNghiText =
        DataHelper.formatNumberEN(item.soTienTuongUng.toString());

    return GestureDetector(
      onTap: () {
        MyNavigation.intentWithData(
          ScreenRouteName.previewDeNghiCapSimPage,
          arguments: DocumentArgs(
              maCongTy: item.maCongTy,
              reportId: item.idDeNghi,
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
                      "ĐỀ NGHỊ CẤP SIM",
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
                                "Gửi bởi: ${item.tenNguoiDeNghi} - ${item.tenBoPhanNguoiDeNghi}",
                                style: const TextStyle(
                                    color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReadMoreText(
                                '${item.lyDoDeNghi}. Mục đích sử dụng: ${item.mucDichSuDung}',
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
                                  text: 'Số tiền: <bold>$tienDeNghiText</bold>',
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
