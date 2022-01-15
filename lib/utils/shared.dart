import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static SharedPreferences? _preferences;
  static const _userName = 'userName';
  static const _userPassword = 'userPassword';
  static const _userEmail = 'userEmail';
  static const _userPhone = 'userPhone';
  static const _likedProducts = 'likedProducts';

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setUserName(String userName) async =>
      await _preferences!.setString(_userName, userName);

  static String? getUserName() => _preferences!.getString(_userName);

  static Future setUserPassword(String password) async =>
      await _preferences!.setString(_userPassword, password);

  static String? getUserPassword() => _preferences!.getString(_userPassword);

  static Future setUserEmail(String userEmail) async =>
      await _preferences!.setString(_userEmail, userEmail);

  static String? getUserEmail() => _preferences!.getString(_userEmail);

  static Future setUserPhone(String userPhone) async =>
      await _preferences!.setString(_userPhone, userPhone);

  static String? getUserPhone() => _preferences!.getString(_userPhone);

  static Future setLikedProducts(List<String> likedProducts) async =>
      await _preferences!.setStringList(_likedProducts, likedProducts);

  static List<String>? getLikedProducts() => _preferences!.getStringList(_likedProducts);
}
