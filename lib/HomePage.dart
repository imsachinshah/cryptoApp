import 'package:crypto_app/modules/crypto_presenter.dart';
import 'package:flutter/material.dart';

import 'data/crypto_data.dart';

class HomePage extends StatefulWidget {
  // final List currencies;
  // HomePage(this.currencies);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements CryptoListViewContract {
  late CryptoListPresenter _presenter;
  List<Crypto> _currencies = [];
  bool _isLoading = false ;

  final List<MaterialColor> _colors = [Colors.blue, Colors.red, Colors.indigo];
  TextEditingController controller = TextEditingController();

  _HomePageState() {
    _presenter = CryptoListPresenter.inj(this);
  }

  @override 
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter.loadCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto App'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: _isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
      child: Column(
        children: [
          Flexible(
              child: ListView.builder(
                  itemCount: _currencies.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Crypto currency = _currencies[index];
                    final MaterialColor color = _colors[index % _colors.length];
                    return _getListItemUi(currency, color);
                  })),
        ],
      ),
    );
  }

  ListTile _getListItemUi(Crypto currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency.name![0]),
      ),
      title: Text(
        currency.name!,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitleText(currency.price_usd, currency.volume_1hrs_usd),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(var priceUSD, var percentChange1h) {
    TextSpan getPriceWidget =
        TextSpan(text: "\$$priceUSD\n", style: TextStyle(color: Colors.black));
    String percentageChangeText = '1 hour: $percentChange1h';
    TextSpan percentageChangeTextWidget;

    if (percentChange1h! > 0) {
      percentageChangeTextWidget = TextSpan(
          text: percentageChangeText, style: TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = TextSpan(
          text: percentageChangeText, style: TextStyle(color: Colors.red));
    }
    return RichText(
      text: TextSpan(children: [getPriceWidget, percentageChangeTextWidget]),
    );
  }

  @override
  void onLoadCryptoComplete(List<Crypto> items) {
    // TODO: implement onLoadCryptoComplete
    setState(() {
      _currencies = items;
      _isLoading = true;
    });
  }

  @override
  void onLoadCryptoError() {
    // TODO: implement onLoadCryptoError
  }
}
