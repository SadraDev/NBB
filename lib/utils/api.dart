import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:nbb/models/productModel.dart';
import 'package:nbb/utils/shared.dart';

class Api {
  static Future<String> login(String emailOrPhone, String password) async {
    Uri url = Uri.parse('https://phloxco.ir/test/view/login.php');
    try {
      Response response = await post(url, body: {'phone': emailOrPhone, 'password': password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['result'] == true) return "true";
        try {
          if (data['result'] == false) return data['error'];
        } catch (e) {
          if (data['result'] == false) return data['error'][0];
        }
      }
      return "false";
    } catch (e) {
      return "NETWORK_ERROR";
    }
  }

  static Future<String> register(String username, String password, String email, String phone) async {
    Uri url = Uri.parse('https://phloxco.ir/test/view/register.php');
    Response response = await post(
      url,
      body: {'username': username, 'password': password, 'email': email, 'phone': phone},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['result'] == true) return 'true';
      try {
        if (data['result'] == false) return data['error'];
      } catch (e) {
        if (data['result'] == false) return data['error'][0];
      }
    }
    return 'false';
  }

  static Future<bool> insertNewProduct(
      String productName,
      String productType,
      String productSubtype,
      String price,
      String minSize,
      String maxSize,
      String colors,
      File image,
      String description,
      String brand,
      String isHomeProduct) async {
    Uri url = Uri.parse('https://phloxco.ir/test/view/product.php');
    var request = MultipartRequest('POST', url)
      ..fields['apiType'] = 'insert'
      ..fields['product_name'] = productName
      ..fields['product_type'] = productType
      ..fields['product_subtype'] = productSubtype
      ..fields['price'] = price
      ..fields['min_size'] = minSize
      ..fields['max_size'] = maxSize
      ..fields['colors'] = colors
      ..fields['description'] = description
      ..fields['brand'] = brand
      ..fields['home_product'] = isHomeProduct
      ..fields['phone'] = Shared.getUserPhone()!
      ..fields['password'] = Shared.getUserPassword()!
      ..files.add(await MultipartFile.fromPath('image', image.path));

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(await response.stream.bytesToString());
      if (data['result'] == true) return true;
      if (data['result'] == false) return false;
    }
    return false;
  }

  static Future<List<dynamic>> selectAllProducts() async {
    Uri url = Uri.parse('https://phloxco.ir/test/view/product.php');
    Response response = await post(
      url,
      body: {'apiType': 'select_all', 'phone': Shared.getUserPhone()!, 'password': Shared.getUserPassword()!},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return [];
    }
  }

  static Future<List<dynamic>> selectAllProductsByType(String type) async {
    Uri url = Uri.parse('https://phloxco.ir/test/view/product.php');
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

  static Future<List<dynamic>> getBoughtProducts() async {
    Uri url = Uri.parse('https://phloxco.ir/test/view/product.php');
    Response response = await post(
      url,
      body: {'apiType': 'get_bought', 'phone': Shared.getUserPhone()!, 'password': Shared.getUserPassword()!},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return [];
    }
  }

  static Future<List<dynamic>> getSells() async {
    Uri url = Uri.parse('https://phloxco.ir/test/view/product.php');
    Response response = await post(
      url,
      body: {'apiType': 'get_all_bought', 'phone': Shared.getUserPhone()!, 'password': Shared.getUserPassword()!},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return [];
    }
  }

  static Future<List<dynamic>> getSellsCheckMarks() async {
    Uri url = Uri.parse('https://phloxco.ir/test/view/product.php');
    Response response = await post(
      url,
      body: {
        'apiType': 'get_all_bought_check_marks',
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

  static Future<void> updateSellsCheckMarks(int? check1, int? check2, int? check3, int? sellId, int? archived) async {
    Uri url = Uri.parse('https://phloxco.ir/test/view/product.php');
    await post(
      url,
      body: {
        'apiType': 'update_bought_check_marks',
        'phone': Shared.getUserPhone(),
        'password': Shared.getUserPassword(),
        'check_1': '$check1',
        'check_2': '$check2',
        'check_3': '$check3',
        'sell_id': '$sellId',
        'archived': '$archived'
      },
    );
  }

  static Future<bool> updateUserName() async {
    Uri url = Uri.parse('https://phloxco.ir/test/view/updateusername.php');
    Response response = await post(
      url,
      body: {'phone': Shared.getUserPhone()!, 'username': Shared.getUserName()!},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> delete(Product product) async {
    Uri url = Uri.parse('https://phloxco.ir/test/view/product.php');
    Response response = await post(
      url,
      body: {
        'apiType': 'delete',
        'product_id': '${product.id}',
        'product_type': product.productType,
        'product_subtype': product.productSubtype,
        'phone': Shared.getUserPhone()!,
        'password': Shared.getUserPassword()!
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['result'] == true) return true;
      return false;
    } else {
      return false;
    }
  }

  static Future<int> buy(String receiverName, String receiverPhone, String receiverAddress, String receiverPostalCode,
      String userDescription, Product product, String productSize, String productColor) async {
    Uri url = Uri.parse('https://phloxco.ir/test/view/product.php');
    Response response = await post(
      url,
      body: {
        'apiType': 'buy',
        'user_name': Shared.getUserName() ?? 'NAME_NOT_GIVEN',
        'user_phone': Shared.getUserPhone(),
        'receiver_name': receiverName,
        'receiver_phone': receiverPhone,
        'receiver_address': receiverAddress,
        'receiver_postal_code': receiverPostalCode,
        'user_description': userDescription,
        'product_id': '${product.id}',
        'product_name': product.productName,
        'product_brand': product.brand,
        'product_type': product.productType,
        'product_subtype': product.productSubtype,
        'product_size': productSize,
        'product_color': productColor,
        'product_price': product.price,
        'product_image': product.image,
        'phone': Shared.getUserPhone(),
        'password': Shared.getUserPassword(),
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['result'] == true) return data['sellId'];
      return -1;
    } else {
      return -1;
    }
  }
}
