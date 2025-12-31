


import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

import 'package:dadaborkahouse/controller/base_url.dart';

class CategoryController{


  // fetch category
  Future<List> fetchCategories() async{

    try{
      Uri url = Uri.parse('${GetBaseUrl.dadaBaseUrl}/api/categories');
      final storage = FlutterSecureStorage();
      var token = await storage.read(key: 'token');
      var header = {
        // 'Authorization' : 'Bearer $token',
        'Accept' : 'application/json'
      };
      var response = await http.get(url, headers: header);

      if(response.statusCode == 200){

        return jsonDecode(response.body)['data'];
      }else if(response.statusCode == 404){
        EasyLoading.showError('Categories Not Found!!');
        return [];
      }else{
        EasyLoading.showError('${response.statusCode}');
      }
    }catch(e){
      log('==========$e========');
      return [];
    }
    return [];
  }

  // show Single categories  all products
  Future<List> fetchSingleCategoryProducts({required int catId }) async{
    try{
      Uri url = Uri.parse('${GetBaseUrl.dadaBaseUrl}/api/products/category/$catId');
      var response = await http.get(url);

      if(response.statusCode == 200){

        return jsonDecode(response.body)['data'];

      }else if(response.statusCode == 404){
        EasyLoading.showError('Product not found');
        return [];
      }else{
        EasyLoading.showError('${response.statusCode}');
        return [];
      }

    }catch(e){
      log('======$e========');
    }
    return [];
  }


  // show Single key categories  all products
  Future<List> fetchSingleKeyCategoryProducts({required String catNameKey}) async {
    try {
      Uri url = Uri.parse('${GetBaseUrl.dadaBaseUrl}/api/home-products');
      final storage = FlutterSecureStorage();
      var token = await storage.read(key: 'token');
      var header = {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      };
      var response = await http.get(url, headers: header);

      if (response.statusCode == 200) {

        return jsonDecode(response.body)['data'][catNameKey];

      } else if (response.statusCode == 404) {
        EasyLoading.showError('Product Not Found!!');
        return [];
      } else {
        EasyLoading.showError('${response.statusCode}');
      }
    } catch (e) {
      log('==========$e========');
      return [];
    }
    return [];
  }
}