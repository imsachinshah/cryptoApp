class Crypto {
  String? name;
  String? price_usd;
  String? volume_1hrs_usd;

  Crypto({this.name, this.price_usd, this.volume_1hrs_usd});

  Crypto.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        price_usd = map['price_usd'],
        volume_1hrs_usd = map['volume_1hrs_usd'];
}

abstract class CrptoRepository {
  Future<List<Crypto>> fetchCurrencies();
}

class FetchDataException implements Exception {
  final dynamic message;

  FetchDataException([this.message]);

  String toString() {
    Object? message = this.message;
    if (message == null) return 'Exception';
    return "Exception: $message";
  }
}
