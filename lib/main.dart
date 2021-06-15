import 'dart:convert';

import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'package:http/http.dart' as http;

void main() async {
  List currencies = await getCurrencies();
  print(currencies);
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List currencies;
  MyApp(this.currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(currencies),
    );
  }
}

Future<List> getCurrencies() async {

  http.Response response =
      await http.get(Uri.parse("https://rest.coinapi.io/v1/assets"), headers: {
    "X-CoinAPI-Key" : "D7A6D03B-0924-4572-B400-AFBE18EEF814",
  });
  return jsonDecode(response.body);
}
