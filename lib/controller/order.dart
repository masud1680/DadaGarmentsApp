import 'dart:convert';
import 'dart:developer';

import 'package:dadaborkahouse/controller/base_url.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
class OrderController{
  
  Future<int> addOrder({required Map orderData})async{

try{

  log("==Api===$orderData=========");

  Uri url = Uri.parse('${GetBaseUrl.dadaBaseUrl}/api/order');
  var body = jsonEncode(orderData);

  FlutterSecureStorage storage = FlutterSecureStorage();
  var token = await storage.read(key: 'token');
  var header = {
    'Accept' : 'application/json',
    'Content-Type' : 'application/json',
    'Authorization': 'Bearer $token'
  };

  var response = await http.post(url, body: body, headers:  header);

return response.statusCode;

}catch(e){
  log('=======$e=====');

}

    return 0;
  }


  Future<List> fetchOrder({required String userPhone})async{

    try{

      // log("==Api===$userPhone=========");

      Uri url = Uri.parse('${GetBaseUrl.dadaBaseUrl}/api/orders/$userPhone');


      // FlutterSecureStorage storage = FlutterSecureStorage();
      // var token = await storage.read(key: 'token');
      var header = {
        'Accept' : 'application/json',
        // 'Content-Type' : 'application/json',
        // 'Authorization': 'Bearer $token'
      };

      var response = await http.get(url,  headers:  header);

      if(response.statusCode == 200){
        // log("=======${jsonDecode(response.body)['data']}");
        return jsonDecode(response.body)['data'];
      }else{
        EasyLoading.showError('${response.statusCode}');
        return [];
      }

    }catch(e){
      log('=======$e=====');

    }

    return [];
  }

  Future<Map> fetchOrderDetails({required String orderId})async{

    try{

      log("==Api===$orderId=========");

      Uri url = Uri.parse('${GetBaseUrl.dadaBaseUrl}/api/order/details/$orderId');


      // FlutterSecureStorage storage = FlutterSecureStorage();
      // var token = await storage.read(key: 'token');
      var header = {
        'Accept' : 'application/json',
        // 'Content-Type' : 'application/json',
        // 'Authorization': 'Bearer $token'
      };

      var response = await http.get(url,  headers:  header);

      if(response.statusCode == 200){
        return jsonDecode(response.body)['data'];
      }else{
        EasyLoading.showError('${response.statusCode}');
        return {};
      }

    }catch(e){
      log('=======$e=====');

    }

    return {};
  }
}