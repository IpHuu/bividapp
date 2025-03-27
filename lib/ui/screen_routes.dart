import 'package:bividpharma/pages/Auth/view/login_page.dart';
import 'package:bividpharma/pages/Main/mainpage.dart';
import 'package:bividpharma/pages/banhang/dathang/booking_order.dart';
import 'package:bividpharma/pages/banhang/orders/create_order/views/create_order_page.dart';
import 'package:bividpharma/pages/banhang/orders/order_detail/view/order_detail.dart';
import 'package:bividpharma/pages/banhang/orders/order_list/view/orders_view.dart';
import 'package:bividpharma/pages/bophanthietke/yeucauthietke_list_page.dart';
import 'package:bividpharma/pages/bophanthietke/yeucauthietke_preview.dart';
import 'package:bividpharma/pages/bophantuyendung/tuyendung_main_page.dart';
import 'package:bividpharma/pages/chiphicongtac/chiphicongtac_list_page.dart';
import 'package:bividpharma/pages/chiphicongtac/chiphicongtac_preview.dart';
import 'package:bividpharma/pages/denghicapsim/denghicapsim_list_page.dart';
import 'package:bividpharma/pages/denghicapsim/denghicapsim_preview.dart';
import 'package:bividpharma/pages/denghicapvpp/denghicapvpp_list_page.dart';
import 'package:bividpharma/pages/denghicapvpp/denghicapvpp_preview.dart';
import 'package:bividpharma/pages/denghimuavpp/denghimuavpp_list_page.dart';
import 'package:bividpharma/pages/denghimuavpp/denghimuavpp_preview.dart';
import 'package:bividpharma/pages/dexuatmuahang/phieudexuatmuahang_list_page.dart';
import 'package:bividpharma/pages/dexuatmuahang/phieudexuatmuahang_preiview.dart';
import 'package:bividpharma/pages/giayracong/giayracong_list_page.dart';
import 'package:bividpharma/pages/giayracong/giayracong_preview.dart';
import 'package:bividpharma/pages/giaytamung/giaytamung_detail_page.dart';
import 'package:bividpharma/pages/giaytamung/giaytamung_list_page.dart';
import 'package:bividpharma/pages/giaytamung/giaytamung_preview.dart';
import 'package:bividpharma/pages/giayxinphep/giaynghiphep_detail_page.dart';
import 'package:bividpharma/pages/giayxinphep/giayxinphep_list_page.dart';
import 'package:bividpharma/pages/giayxinphep/giayxinphep_preview.dart';
import 'package:bividpharma/pages/kehoachcongtac/kehoachcongtac_list_page.dart';
import 'package:bividpharma/pages/kehoachcongtac/kehoachcongtac_preview.dart';
import 'package:bividpharma/pages/kehoachcongviec/kehoachcongviec_detail_page.dart';
import 'package:bividpharma/pages/kehoachcongviec/kehoachcongviec_list_page.dart';
import 'package:bividpharma/pages/kehoachcongviec/kehoachcongviec_preview.dart';
import 'package:bividpharma/pages/lenhcongtac/lenhcongtac_list_page.dart';
import 'package:bividpharma/pages/lenhcongtac/lenhcongtac_preview.dart';
import 'package:bividpharma/pages/riengtu/bangchamcong.dart';
import 'package:bividpharma/pages/riengtu/dienthoainoibo.dart';
import 'package:bividpharma/pages/system/about.dart';
import 'package:bividpharma/pages/system/empty_function_page.dart';
// import 'package:bividpharma/pages/system/document_file_attached_view.dart';
import 'package:bividpharma/pages/system/home_page.dart';
import 'package:bividpharma/pages/system/kyduyet_online_page.dart';
import 'package:bividpharma/pages/system/notify_list_page.dart';
import 'package:bividpharma/pages/system/profile_page.dart';
import 'package:bividpharma/pages/system/register_page.dart';
import 'package:bividpharma/pages/system/tracuu_hoso_page.dart';
import 'package:bividpharma/pages/thanhquyettoan/phieuthanhquyettoan_detail_page.dart';
import 'package:bividpharma/pages/thanhquyettoan/phieuthanhquyettoan_list_page.dart';
import 'package:bividpharma/pages/thanhquyettoan/phieuthanhquyettoan_preview.dart';
import 'package:bividpharma/pages/tongquan/banhang/view/order_report_page.dart';
import 'package:bividpharma/pages/tongquan/thau/view/bidding_report_page.dart';
import 'package:bividpharma/pages/tongquan/tonkho/view/inventory_detail.page.dart';
import 'package:bividpharma/pages/tongquan/tonkho/view/inventory_report_page.dart';
// import 'package:bividpharma/pages/system/upgrader_page.dart.bak';
import 'package:bividpharma/services/firebase/message_view.dart';
import 'package:flutter/widgets.dart';

import '../pages/banhang/khachhang/customer_page.dart';
import '../pages/banhang/listproduct/view/product_list.dart';

class ScreenRouteName {
  static const String mainPage = "main";
  static const String homePage = "home";
  static const String loginPage = "login";
  static const String registerPage = "register";
  static const String profilePage = "profile";
  static const String aboutPage = "about";
  static const String newDocumentPage = "document_new_document";

  static const String previewGiayXinPhepPage = "giayxinphep_preview_document";
  static const String previewTamUngPage = "giaytamung_preview_document";
  static const String previewKHCVPage = "kehoachcongviec_preview_document";
  static const String previewTQTPage = "thanhquyettoan_preview_document";
  static const String previewDXMHPage = "dexuatmuahang_preview_document";
  static const String previewGiayRaCongPage = "giayracong_preview_document";
  static const String previewDeNghiCapSimPage = "denghicapsim_preview_document";
  static const String previewDeNghiMuaVppPage = "denghimuavpp_preview_document";

  static const String traCuuHoSoPage = "tracuuhoso_page";
  static const String giayXinPhepPage = "giayxinphep_page";
  static const String giayXinPhepDetailPage = "giayxinphepDetail_page";

  static const String phieuTamUngPage = "phieutamung_page";
  static const String phieuTamUngDetailPage = "phieuTamUngDetail_page";

  static const String phieuTQTPage = "phieutqt_page";
  static const String phieuTqtDetailPage = "phieuTqtDetail_page";

  static const String phieuKHCVPage = "phieukhcv_page";
  static const String phieuKHCVDetailPage = "phieukhcvDetail_page";

  static const String phieuDeXuatMuaHangPage = "phieuDeXuatMuaHang_page";
  static const String giayRaCongPage = "giayRaCong_page";
  static const String deNghiCapSimPage = "denghicapsim_page";
  static const String deNghiMuaVppPage = "denghimuavpp_page";

  static const String lenhCongTacPage = "lenhcongtac_page";
  static const String previewLenhCongTacPage = "lenhcongtac_preview_document";

  static const String keHoachCongTacPage = "kehoachcongtac_page";
  static const String previewKeHoachCongTacPage =
      "kehoachcongtac_preview_document";

  static const String deNghiCapVppPage = "denghicapvpp_page";
  static const String previewDeNghiCapVppPage = "denghicapvpp_preview_document";

  static const String chiPhiCongTacPage = "chiphicongtac_page";
  static const String previewChiPhiCongTacPage =
      "chiphicongtac_preview_document";

  static const String boPhanThietKeListPage = "bophanthietke_list_page";
  static const String previewYeuCauThietKePage =
      "bophanthietke_preview_document";

  static const String boPhanTuyenDungMainPage = "bophantuyendung_main_page";
  static const String previewBoPhanTuyenDungPage =
      "bophantuyendung_preview_document";

  static const String documentFileAttachPage = "document_fileAttach_page";

  static const String upgraderPage = "upgrader_page";
  static const String notifyPage = "notify_page";
  static const String emptyFunctionPage = "empty_function_page";

  static const String messageViewPage = "message_view_page";

  static const String bangChamCongPage = "bang_cham_cong_page";
  static const String traCuuDienThoaiPage = "tra_cuu_dien_thoai_page";

  static const String bookingOrderPage = "booking_order";
  static const String ordersView = "order_view";
  static const String createOrderView = "create_order_view";
  static const String productListView = "product_list_view";
  static const String customerListView = "customer_list_view";
  static const String orderDetail = "order_detail_view";

  static const String tongquantonkho = "tongquantonkho";
  static const String inventory_detail = "inventory_detail";
  static const String orderReport = "orderReport";
  static const String biddingReportView = "BiddingReportView";

  static Map<String, WidgetBuilder> get mainRouter {
    return {
      // Module Main
      ScreenRouteName.mainPage: (context) => const MainPage(),
      ScreenRouteName.homePage: (context) => const HomePage(),
      ScreenRouteName.loginPage: (context) => const LoginPage(),
      ScreenRouteName.registerPage: (context) => const RegisterPage(),
      ScreenRouteName.profilePage: (context) => const ProfilePage(),
      ScreenRouteName.aboutPage: (context) => const AboutePage(),

      // Module Hành chính
      ScreenRouteName.newDocumentPage: (context) => const KyDuyetOnlinePage(),
      ScreenRouteName.traCuuHoSoPage: (context) => const TraCuuHoSoPage(),
      ScreenRouteName.giayXinPhepPage: (context) => GiayXinPhepListPage(),
      ScreenRouteName.giayXinPhepDetailPage: (context) =>
          GiayXinPhepDetailPage(),

      ScreenRouteName.phieuTamUngPage: (context) => GiayTamUngListPage(),
      ScreenRouteName.phieuTamUngDetailPage: (context) =>
          const GiayTamUngDetailPage(),

      ScreenRouteName.phieuTQTPage: (context) => PhieuThanhQuyetToanListPage(),
      ScreenRouteName.phieuTqtDetailPage: (context) =>
          const PhieuThanhQuyetToanDetailPage(),

      ScreenRouteName.phieuKHCVPage: (context) => KeHoachCongViecListPage(),
      ScreenRouteName.phieuKHCVDetailPage: (context) =>
          KeHoachCongViecDetailPage(),

      ScreenRouteName.phieuDeXuatMuaHangPage: (context) =>
          PhieuDeXuatMuaHangListPage(),
      ScreenRouteName.giayRaCongPage: (context) => GiayRaCongListPage(),
      ScreenRouteName.deNghiCapSimPage: (context) => DeNghiCapSimListPage(),
      ScreenRouteName.previewGiayXinPhepPage: (context) =>
          const GiayXinPhepPreviewPage(),
      ScreenRouteName.previewTamUngPage: (context) =>
          const GiayTamUngPreviewPage(),
      ScreenRouteName.previewKHCVPage: (context) =>
          const KeHoachCongViecPreviewPage(),
      ScreenRouteName.previewTQTPage: (context) =>
          const PhieuThanhQuyetToanPreviewPage(),
      ScreenRouteName.previewDXMHPage: (context) =>
          const PhieuDeXuatMuaHangPreviewPage(),
      ScreenRouteName.previewGiayRaCongPage: (context) =>
          const GiayRaCongPreviewPage(),
      ScreenRouteName.previewDeNghiCapSimPage: (context) =>
          const DeNghiCapSimPreviewPage(),
      ScreenRouteName.deNghiMuaVppPage: (context) => DeNghiMuaVppListPage(),
      ScreenRouteName.previewDeNghiMuaVppPage: (context) =>
          const DeNghiMuaVppPreviewPage(),
      ScreenRouteName.lenhCongTacPage: (context) => LenhCongTacListPage(),
      ScreenRouteName.previewLenhCongTacPage: (context) =>
          const LenhCongTacPreviewPage(),
      ScreenRouteName.keHoachCongTacPage: (context) => KeHoachCongTacListPage(),
      ScreenRouteName.previewKeHoachCongTacPage: (context) =>
          const KeHoachCongTacPreviewPage(),
      ScreenRouteName.deNghiCapVppPage: (context) => DeNghiCapVppListPage(),
      ScreenRouteName.previewDeNghiCapVppPage: (context) =>
          const DeNghiCapVppPreviewPage(),
      ScreenRouteName.chiPhiCongTacPage: (context) => ChiPhiCongTacListPage(),
      ScreenRouteName.previewChiPhiCongTacPage: (context) =>
          const ChiPhiCongTacPreviewPage(),

// Module Thiết kế & Marketting
      ScreenRouteName.boPhanThietKeListPage: (context) =>
          YeuCauThietKeListPage(),
      ScreenRouteName.previewYeuCauThietKePage: (context) =>
          const YeuCauThietKePreviewPage(),

// Module tuyển dụng
      ScreenRouteName.boPhanTuyenDungMainPage: (context) =>
          const TuyenDungMainPage(),

// Module Rieng tu
      ScreenRouteName.bangChamCongPage: (context) => BangChamCongPage(),
      ScreenRouteName.traCuuDienThoaiPage: (context) => TraCuuDienThoaiPage(),

// Module hệ thống
      ScreenRouteName.upgraderPage: (context) => const EmptyFunctionPage(),
      ScreenRouteName.notifyPage: (context) => NotifyListPage(
            title: 'Thông báo',
          ),
      ScreenRouteName.emptyFunctionPage: (context) => const EmptyFunctionPage(),
      ScreenRouteName.messageViewPage: (context) => const MessageView(),
      // ScreenRouteName.documentFileAttachPage: (context) =>
      //     const DocumentFileAttachPage(),

      ScreenRouteName.bookingOrderPage: (context) => const InvoicePage(),
      ScreenRouteName.ordersView: (context) => const OrdersView(),
      ScreenRouteName.createOrderView: (context) => const CreateOrderPage(),
      ScreenRouteName.productListView: (context) => const ProductView(),
      ScreenRouteName.customerListView: (context) => const CustomerView(),
      ScreenRouteName.orderDetail: (context) => const OrderDetailPage(),

      ScreenRouteName.tongquantonkho: (context) => const InventoryReportView(),
      ScreenRouteName.inventory_detail: (context) => const InventoryDetail(
            tonKhoEnum: TonKhoEnum.kenh,
          ),
      ScreenRouteName.orderReport: (context) => const OrderReportView(),
      ScreenRouteName.biddingReportView: (context) => const BiddingReportView(),
    };
  }
}
