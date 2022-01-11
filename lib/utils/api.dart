import 'dart:convert';
import 'package:http/http.dart';
import 'package:nbb/utils/shared.dart';

class Api {
  static Future<bool> login(String emailOrPhone, String password) async {
    Uri url = Uri.parse('http://192.168.136.216/NBB/view/login.php');
    Response response = await post(url, body: {'phoneOrEmail': emailOrPhone, 'password': password});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['result'] == true) return true;
      if (data['result'] == false) return false;
    }
    return false;
  }

  static Future<bool> register(String username, String password, String email, String phone) async {
    Uri url = Uri.parse('http://192.168.136.216/NBB/view/register.php');
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

  static Future<bool> insertNewProduct(
    String productName,
    String productType,
    String productSubtype,
    String price,
    String minSize,
    String maxSize,
    String colors,
    String image,
    String description,
  ) async {
    Uri url = Uri.parse('http://192.168.136.216/NBB/view/product.php');
    var request = MultipartRequest('POST', url)
      ..fields['apiType'] = 'insert'
      ..fields['product_name'] = productName
      ..fields['product_type'] = productType
      ..fields['product_subtype'] = productSubtype
      ..fields['price'] = price
      ..fields['min_size'] = minSize
      ..fields['max_size'] = maxSize
      ..fields['colors'] = colors
      ..fields['image'] = image
      ..fields['description'] = description
      ..fields['phone'] = Shared.getUserPhone()!
      ..fields['password'] = Shared.getUserPassword()!;
    //..files.add(await MultipartFile.fromPath('image', image));

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(await response.stream.bytesToString());
      if (data['result'] == true) return true;
      if (data['result'] == false) return false;
    }
    return false;
  }

  static Future<List<dynamic>> selectAllProducts() async {
    Uri url = Uri.parse('http://192.168.136.216/NBB/view/product.php');
    Response response = await post(
      url,
      body: {
        'apiType': 'select_all',
        'phone': Shared.getUserPhone()!,
        'password': Shared.getUserPassword()!
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return [];
    }
  }

  static Future<List<dynamic>> selectAllProductsByType(String type) async {
    Uri url = Uri.parse('http://192.168.136.216/NBB/view/product.php');
    Response response = await post(
      url,
      body: {
        'apiType': 'select_by_type',
        'product_type': type,
        'phone': Shared.getUserPhone()!,
        'password': Shared.getUserPassword()!
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return [];
    }
  }
}
