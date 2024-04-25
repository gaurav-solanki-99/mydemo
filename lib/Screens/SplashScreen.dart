import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/ShImageConstants.dart';
import 'LoginScreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Timer(Duration(seconds: 4), () {
     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

       Get.offNamed('/second');

    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return Container(
      height: height,
      width: width,
      child: Stack(


        children: [
          Image.asset(ic_splash,fit:BoxFit.fill,height: height,width: width,),
        ],
      ),
      

    );
  }
}
