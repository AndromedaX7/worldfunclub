import 'package:worldfunclub/providers.dart';

class WithdrawPageProvider extends BaseProvider{
  int _selectCard=0;
  int get selectCard=>_selectCard;
  set selectCard(int idx){
    _selectCard=idx;
    notifyListeners();
  }

  int _cardCount=2;
  int get cardCount=>_cardCount;
  set cardCount(int idx){
    _cardCount=idx;
    notifyListeners();
  }
  void loadList() {

  }

}