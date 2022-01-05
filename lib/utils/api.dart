import 'dart:convert';
import 'package:http/http.dart';

class Api {
  static Future<bool> login(String emailOrPhone, String password) async {
    Uri url = Uri.parse('http://192.168.102.216/NBB/view/login.php');
    Response response = await post(url, body: {'phoneOrEmail': emailOrPhone, 'password': password});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['result'] == true) return true;
      if (data['result'] == false) return false;
    }
    return false;
  }

  static Future<bool> register(String username, String password, String email, String phone) async {
    Uri url = Uri.parse('http://192.168.102.216/NBB/view/register.php');
    Response response = await post(
      url,
      body: {'username': username, 'password': password, 'email': email, 'phone': phone},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['result'] == true) return true;
      if (data['result'] == false) return false;
    }
    return false;
  }
}
