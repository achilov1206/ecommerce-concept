import 'package:intl/intl.dart';

class Currency {
  static String currencyAmountToDollarString(int amount) {
    final NumberFormat usCurrency = NumberFormat('#,##0', 'en_US');
    return ' \$${usCurrency.format(amount)}';
  }
}
