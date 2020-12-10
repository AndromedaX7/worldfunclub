import 'package:shared_preferences/shared_preferences.dart';
import 'package:worldfunclub/extensions/string_extension.dart';
import 'package:worldfunclub/main.dart';

class LocalCache {
  final SharedPreferences _sp;

  static const String kBindPhone = "kBindPhone";
  static const String kUserId = "kUserId";
  static const String kNickName = "kNickName";
  static const String kToken = "kToken";
  static const String kAvatar = "kAvatar";
  static const String kUserType = "kUserType";
  static const String kMobile="kMobile";

  LocalCache(this._sp);

  void writeUserInfo(String userId, String nickName, String avatar,
      String token, String userType, bool bindPhone) {
    _sp
      ..setBool(kBindPhone, bindPhone)
      ..setString(kUserId, userId)
      ..setString(kNickName, nickName)
      ..setString(kToken, token)
      ..setString(kAvatar, avatar)
      ..setString(kUserType, userType);
  }

  void writeCurrent(){
    _sp
      ..setBool(kBindPhone, bindPhone)
      ..setString(kUserId, userId)
      ..setString(kNickName, nickName)
      ..setString(kToken, token)
      ..setString(kAvatar, avatar)
      ..setString(kMobile, mobile)
      ..setString(kUserType, userType);
  }
  void writeUserInfoWithPhone(String userId, String nickName, String avatar,
      String token, String userType, bool bindPhone,String phone) {
    _sp
      ..setBool(kBindPhone, bindPhone)
      ..setString(kUserId, userId)
      ..setString(kNickName, nickName)
      ..setString(kToken, token)
      ..setString(kAvatar, avatar)
      ..setString(kMobile, phone)
      ..setString(kUserType, userType);
  }
  void restoreUserInfoWithPhone() {
    userId = _sp.getString(kUserId);
    token = _sp.getString(kToken);
    avatar = _sp.getString(kAvatar);
    nickName = _sp.getString(kNickName);
    bindPhone = _sp.getBool(kBindPhone);
    mobile=_sp.getString(kMobile);
  }

  bool hasUser() {
    var token = _sp.getString(kToken);
    return !isEmpty(token);
  }

  void logout() {
    _sp
      ..setBool(kBindPhone, false)
      ..setString(kUserId, "")
      ..setString(kNickName, "")
      ..setString(kToken, "")
      ..setString(kAvatar, "")
      ..setString(kUserType, "");
    restoreUserInfoWithPhone();
  }
}
