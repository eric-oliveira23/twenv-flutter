import 'package:intl/intl.dart';

String priceFormatter(String value) {
  double valor = double.parse(value);

  String formattedValue = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  ).format(valor);

  return formattedValue;
}
