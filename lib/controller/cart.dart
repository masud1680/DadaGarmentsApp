import 'dart:convert';
import 'dart:developer';

import 'package:dadaborkahouse/controller/base_url.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class CartController {
  // product add to cart
  Future<int> addToCat({required int productId, required int quantity}) async {
    try {
      log("========$productId======$quantity");
      Uri url = Uri.parse('${GetBaseUrl.dadaBaseUrl}/api/cart');
      var body = {
        'product_id': productId.toString(),
        'quantity': quantity.toString(),
      };
      final storage = FlutterSecureStorage();
      var token = await storage.read(key: 'token');
      var header = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var response = await http.post(url, body: body, headers: header);

      return response.statusCode;
    } catch (e) {
      log('======$e=====');
    }

    return 401;
  }

  // get cart products
  Future<List> fetchCartProducts() async {
    try {
      Uri url = Uri.parse('${GetBaseUrl.dadaBaseUrl}/api/cart');

      final storage = FlutterSecureStorage();

      var token = await storage.read(key: 'token');

      var header = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var response = await http.get(url, headers: header);

      if (response.statusCode == 200) {
        return jsonDecode(response.body)['data'];
      } else if (response.statusCode == 404) {
        EasyLoading.showError('Product Not Found!');
        return [];
      } else {
        EasyLoading.showError(" ${response.statusCode} something error!!");
        return [];
      }
    } catch (e) {
      log('======$e=====');
    }

    return [];
  }
}
