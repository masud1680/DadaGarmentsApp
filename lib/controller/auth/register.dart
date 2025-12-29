import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'dart:developer';

class RegController{
  
  Future<bool> createAccountFun(  { required  Map<String,dynamic> data}) async{
    try{
      Uri url = Uri.parse('https://b4.coderangon.com/api/register');
      var body = data;
      var header = { "Accept" : "Application/json"};
      var response = await http.post(url, body: body, headers: header);

      if(response.statusCode == 201){
          EasyLoading.showSuccess("Register Successful");
          return true;
      }else if(response.statusCode == 422){
        // EasyLoading.showError("Register Unsuccessfully!!");
        var error = jsonDecode(response.body);
        // EasyLoading.showError("${error['message']}");
        // log('======$data=====');
        // log("======${error['message']}");


        if(error['errors']['phone'] != null){
          EasyLoading.showError("Phone already taken!!");
          // log('======Phone already taken=======');
        }else if(error['errors']['email'] != null){
          EasyLoading.showError("Email already taken!!");
          // log('======email already taken=======');
        }
        return false;
      }
    }catch(e){
      log("=======$e======");
    }
    return false;
  }
}