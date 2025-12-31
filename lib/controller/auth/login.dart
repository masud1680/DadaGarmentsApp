import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class LoginController{
  Future<bool> loginAccount({required Map data})async{

    try{
      Uri url = Uri.parse('https://b4.coderangon.com/api/login');
      var body = data;
      var header = { "Application" : "application/json"};
      var response = await http.post(url, body: body, headers: header);


      if(response.statusCode == 200){


        var t = jsonDecode(response.body)['token'];
        final storage = FlutterSecureStorage();
        storage.write(key: 'token', value: t);

        EasyLoading.showSuccess("Login Successfully");

        return true;
      }else if(response.statusCode == 422){
        EasyLoading.showError('Invalid Credential!!');
        return false;
      }else{
        var errors = jsonDecode(response.body);
        EasyLoading.showError("${errors['message']}");
        return false;
      }
    }catch(e){
      // EasyLoading.showError("Catch Error!!");
      EasyLoading.showError('Invalid Credential !!');
      return false;
    }
    return false;
  }
}