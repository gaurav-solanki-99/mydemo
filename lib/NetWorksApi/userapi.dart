import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../Utils/shconstants.dart';



Future<String> getUserApi(BuildContext context) async
{

  print("getUserApi >>");

  EasyLoading.show();




  try {
    //https://hotelbooking.linustechnomancy.com/api/login

    // https://hotelbooking.toools.website/api/admin_login
    final response = await http.get(
      Uri.parse(BASE_URL+"/api/users"),
      // body: formData,
      // headers: headers,
    );

    print("getBookingListAminApi >>r"+response.body);
    print("getBookingListAminApi >>s"+response.statusCode.toString());


    if (response.statusCode == 200) {
      final responseBody = response.body;
      print(responseBody);
      EasyLoading.dismiss(
      );
      return response.body;
    } else {
      print("Else Login" + response.body);
      final responseBody = response.body;
      // print(responseData);

      final responseData = jsonDecode(responseBody);
      final message = responseData['message'];
      final status = responseData['status'];

      if(status=="success")
      {
        EasyLoading.dismiss();
        return responseBody;
      }
      else {

        EasyLoading.dismiss();
        return "";

      }


    }
  } catch (e) {
    print("getBookingListAminApi >> Exception $e");

    print(e);

    EasyLoading.dismiss();
    return "";
  }
}