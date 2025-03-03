import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/common/document_args.dart';
import 'package:bividpharma/model/dtos/thanhquyettoan/phieu_thanh_quyet_toan.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/ui/ui_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PhieuThanhQuyetToanItem extends StatelessWidget {
  const PhieuThanhQuyetToanItem(
      {Key? key,
      required this.phieuThanhQuyetToan,
      this.showAction = true,
      this.commandCallback})
      : super(key: key);
  final PhieuThanhQuyetToan phieuThanhQuyetToan;
  final bool showAction;
  final DocumentActionCallback? commandCallback;

  @override
  Widget build(BuildContext context) {
    return _builPhieuThanhQuyetToanItem(
        context: context, item: phieuThanhQuyetToan);
  }

  Widget _builPhieuThanhQuyetToanItem(
      {required BuildContext context, required PhieuThanhQuyetToan item}) {
    final dateFmt = DateFormat('dd/MM/yyyy');
    final ngayTrinhKyText = item.ngayTrinhKy == null
        ? "Ngày …. tháng … năm …"
        : dateFmt.format(item.ngayTrinhKy!);

    return GestureDetector(
      onTap: () {
        MyNavigation.intentWithData(
          ScreenRouteName.previewTQTPage,
          arguments: DocumentArgs(
              maCongTy: item.maCongTy,
              reportId: item.idThanhQuyetToan,
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
                      "ĐỀ NGHỊ THANH TOÁN",
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
                                "Người lập: ${item.tenNhanvien} - ${item.tenBoPhan}",
                                style: const TextStyle(
                                    color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Ngày trình ký: ',
                                  style: const TextStyle(
                                      color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ngayTrinhKyText,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Hình thức: ',
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: item.tenHinhThucTt,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                "Người thụ hưởng: ${item.nguoiHuongThu} ",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Số tài khoản: ${item.soTk} - ${item.nganHang}",
                                style: const TextStyle(
                                    color: UIHelper.BIVID_BLACK_TEXT_COLOR,
                                    fontWeight: FontWeight.normal),
                              ),
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

  Widget _buildFooter(BuildContext context, PhieuThanhQuyetToan item) {
    final theme = Theme.of(context);
    final childs = <Widget>[];
    final isDeleted = item.isHuy ?? false;

    childs.add(Text(
      (isDeleted) ? 'Đã hủy' : item.tinhTrangChu,
      style: TextStyle(
        color: (isDeleted) ? Colors.red : Theme.of(context).primaryColor,
        fontStyle: FontStyle.italic,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ));
    if (item.tinhTrang == 0 && !(isDeleted)) {
      childs.add(const SizedBox(
        width: 15,
      ));
      childs.add(TextButton.icon(
        onPressed: () => commandCallback?.call(item),
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
