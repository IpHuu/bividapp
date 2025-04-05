import 'package:intl/intl.dart';

extension CurrencyFormat on num {
  String toCurrency({String locale = 'vi_VN', String symbol = '₫'}) {
    final format = NumberFormat.currency(locale: locale, symbol: symbol);
    return format.format(this);
  }
}

extension MoneyFormatter on double {
  String toShortMoneyFormat() {
    if (this >= 1e9) {
      return '${(this / 1e9).toStringAsFixed(1).replaceAll('.0', '')}B đ'; // 1B = 1 tỉ
    } else if (this >= 1e6) {
      return '${(this / 1e6).toStringAsFixed(1).replaceAll('.0', '')}M đ'; // 1M = 1 triệu
    } else if (this >= 1e3) {
      return '${(this / 1e3).toStringAsFixed(1).replaceAll('.0', '')}K đ'; // 1K = 1 ngàn
    } else {
      return toStringAsFixed(0); // Giữ nguyên nếu nhỏ hơn 1000
    }
  }

  String formatCurrency({int decimalDigits = 0}) {
    final formatter = NumberFormat("#,###${"0" * decimalDigits}", "en_US");
    return formatter.format(this);
  }

  String formatNumber({int decimalDigits = 0}) {
    final formatter = NumberFormat("#,###${"0" * decimalDigits}", "en_US");
    return formatter.format(this);
  }
}

extension DynamicToDouble on dynamic {
  double toDoubleSafe() {
    if (this == null) return 0.0;
    if (this is double) return this as double;
    if (this is int) return (this as int).toDouble();
    if (this is String) {
      return double.tryParse(this as String) ?? 0.0;
    }
    return 0.0; // Giá trị mặc định nếu không thể chuyển đổi
  }
}
