import 'package:crypto_app/data/crypto_data.dart';
import 'package:crypto_app/dependency_injection.dart';

abstract class CryptoListViewContract {
  void onLoadCryptoComplete(List<Crypto> items);
  void onLoadCryptoError();
}

class CryptoListPresenter {
  CryptoListViewContract? _view;
  CrptoRepository? _repository;

  CryptoListPresenter.inj(this._view) {
    _repository = Injector().cryptoRepository;
  }

  void loadCurrencies() {
    _repository!
        .fetchCurrencies()
        .then((c) => _view!.onLoadCryptoComplete(c))
        .catchError((onError) => _view!.onLoadCryptoError());
  }
}
