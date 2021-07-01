import 'dart:convert';

import 'package:crypto_app/data/crypto_data.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class ProdCryptoRepository implements CrptoRepository {
  @override
  Future<List<Crypto>> fetchCurrencies() async {
    // TODO: implement fetchCurrencies

    http.Response response = await http
        .get(Uri.parse("https://rest.coinapi.io/v1/assets"), headers: {
      "X-CoinAPI-Key": "D7A6D03B-0924-4572-B400-AFBE18EEF814",
    });
    final List responseBody = jsonDecode(response.body);
    final statusCode = response.statusCode;

    if (statusCode != 200) {
      throw FetchDataException("An Error occured: [Status Code: $statusCode]");
    }
    return responseBody.map((c) => Crypto.fromMap(c)).toList();
  }
}
