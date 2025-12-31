import 'dart:convert';

import 'package:dadaborkahouse/controller/base_url.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'dart:developer';

class ProductController{

  // show all products
  Future<List> fetchAllProducts() async{
    try{
      Uri url = Uri.parse('${GetBaseUrl.dadaBaseUrl}/api/products');
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

  // show single product Details
  Future<Map> fetchSingleProductDetails({required int productId}) async{
    try{
      Uri url = Uri.parse('${GetBaseUrl.dadaBaseUrl}/api/products/$productId');
      var response = await http.get(url);

      if(response.statusCode == 200){

        return jsonDecode(response.body)['data'];

      }else if(response.statusCode == 404){
        EasyLoading.showError('Product not found');
        return {};
      }else{
        EasyLoading.showError('${response.statusCode}');
        return {};
      }

    }catch(e){
      log('======$e========');
    }
    return {};
  }

}