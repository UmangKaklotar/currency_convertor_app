import 'package:flutter/cupertino.dart';

import '../utils/currency_color.dart';

Widget currency({required String cn}) {
  return Text(
    cn,
    style: TextStyle(fontSize: 20, color: CurrencyColor.blue),
  );
}
