import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../Screens/HomeScreen.dart';
import '../Utils/ShWidgetConsts.dart';
import '../Utils/shconstants.dart';
Future<String> loginapi(BuildContext
context, String contactno, String password
    ) async
{

  print("adminLoginApi>>>>>>>>>>>>>>>>>>");
  EasyLoading.show();



  var body=json.encode({
    "email": "eve.holt@reqres.in",
    "password": "cityslicka"
  });


  try{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://reqres.in/api/login'));
    request.body = json.encode({
      "email": contactno,
      "password": password
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      Get.offNamed('/third',);

      print(await response.stream.bytesToString());


    }
    else {

      var res = await http.Response.fromStream(response);

      print("addHotelApi >>>>"+res.body.toString());

      final responseData = jsonDecode(res.body);
      final message = responseData['error'];


      EasyLoading.dismiss();

      showAlert(message, context);

      print(response.reasonPhrase);
    }

  }
  catch(e)
  {
    return "";
    EasyLoading.dismiss();
  }
  return "";

}