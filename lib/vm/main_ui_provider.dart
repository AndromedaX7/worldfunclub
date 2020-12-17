import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/local_cache.dart';

class MainUiProvider extends BaseProvider {
  MainState _state = MainState.MAIN;

  MainState get state => _state;

  final LocalCache _lc;
  MainUiProvider(this._lc);


  set state(MainState state) {
    this._state = state;
    notifyListeners();
  }

  void loadCache(){
    if(_lc.hasUser()){
      _lc.restoreUserInfoWithPhone();
      _state=MainState.MAIN;
    }else{
      _lc.restoreUserInfoWithPhone();
      _state=MainState.Login ;
    }
  }
}

enum MainState {
  MAIN,
  Login ,
  Phone,
}
