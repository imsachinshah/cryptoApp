import 'package:crypto_app/dependency_injection.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() async {
  Injector.configure(Flavor.MOCK);
  //List currencies = await getCurrencies();
  // print(currencies);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final List currencies;
  // MyApp(this.currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
