import 'package:get/get.dart';

import '../Utils/ShWidgetConsts.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController
{

  
  


  bool isvalidatecontroll(String email,String password,BuildContext context){
    if(email==""||email==null)
    {
      print("enter password");
      showAlert("Please enter username",context);
      return false;
    }
    // else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}")
    //     .hasMatch(email.trim())) {
    //   showAlert("Please enter valid email");
    //   return false;
    // }
    else if(password==""||password==null)
    {
      showAlert("Please enter password",context);
      return false;
    }
    else
    {
      return true;
    }


    return false;
  }

}