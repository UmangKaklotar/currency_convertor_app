import 'dart:convert';

import 'package:currency_convertor_app/utils/api_string.dart';
import 'package:http/http.dart';

Future getCurrencyResponse() async {
  Response res = await get(Uri.parse(ApiUtils.BASE_URL + ApiUtils.to + ApiUtils.toCurrency + ApiUtils.from + ApiUtils.fromCurrency + ApiUtils.amount + ApiUtils.totalAmount + ApiUtils.apiKey));
  if(res.statusCode == 200) {
    var data = jsonDecode(res.body);
    print(data);
    return data;
  } else {
    print(res.body);
    throw "No Data Found !";
  }
}
