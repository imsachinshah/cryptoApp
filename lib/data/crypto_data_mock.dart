import 'package:crypto_app/data/crypto_data.dart';

class MockCryptoRepository extends CrptoRepository {
  Future<List<Crypto>> fetchCurrencies() {
    return Future.value(currencies);
  }
}

var currencies = <Crypto>[
  Crypto(name: 'Bitcoin', price_usd: '2300', volume_1hrs_usd: '+2.3'),
  Crypto(name: 'Etherem', price_usd: '1000', volume_1hrs_usd: '+3.3'),
  Crypto(name: 'Ripple', price_usd: '1.2', volume_1hrs_usd: '-20.3'),
];
