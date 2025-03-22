import 'package:intl/intl.dart';

extension CurrencyFormat on num {
  String toCurrency({String locale = 'vi_VN', String symbol = '₫'}) {
    final format = NumberFormat.currency(locale: locale, symbol: symbol);
    return format.format(this);
  }
}
