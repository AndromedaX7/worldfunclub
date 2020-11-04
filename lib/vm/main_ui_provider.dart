import 'package:worldfunclub/providers.dart';

class MainUiProvider extends BaseProvider {
  MainState _state = MainState.MAIN;

  MainState get state => _state;

  set state(MainState state) {
    this._state = state;
    notifyListeners();
  }
}

enum MainState {
  MAIN,
  LoginWechat,
  Phone,
}
