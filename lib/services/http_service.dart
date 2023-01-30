import 'dart:convert';

import 'package:currency_convertor_app/utils/api_string.dart';
import 'package:http/http.dart';

Future getCurrencyResponse() async {
  Response res = await get(Uri.parse(ApiUtils.BASE_URL + ApiUtils.to + ApiUtils.toCurrency + ApiUtils.from + ApiUtils.fromCurrency + ApiUtils.amount + ApiUtils.totalAmount + ApiUtils.apiKey));
  if(res.statusCode == 200) {
    var data = jsonDecode(res.body);
    return data;
    print(data);
  } else {
    throw "No Data Found !";
  }
}
