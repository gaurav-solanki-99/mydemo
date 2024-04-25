import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mydemo/Controller/LoginController.dart';

import '../NetWorksApi/loginapi.dart';
import '../Utils/AppCustomDialog.dart';
import '../Utils/ShColorConstants.dart';
import '../Utils/shImageConstants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isvisible= true;


  bool isvalidate(){
    if(emailController.text==""||emailController.text==null)
    {
      print("enter password");
      showAlert("Please enter username");
      return false;
    }
    // else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}")
    //     .hasMatch(emailController.text.trim())) {
    //   showAlert("Please enter valid email");
    //   return false;
    // }
    else if(passwordController.text==""||passwordController.text==null)
    {
      showAlert("Please enter password");
      return false;
    }
    else
    {
      return true;
    }


    return false;
  }

  LoginController controller = Get.put(LoginController());



  showAlert(String message)
  {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          CustomDialog(
            title: "Alert",
            description: message,
            buttonText: "Okay",
            image: ic_alert,
            onTap: () {
              Navigator.pop(context);
            },
            colors: Colors.red,
          ),
    );
  }


  @override
  void initState() {
    super.initState();

  //  loginapi(context, "", "");
  }


  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return Scaffold(

      body: Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: height*0.35,
                // child: Image.asset('assets/yoga.png',fit: BoxFit.fill,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ZenTech',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                    Text('Login in ZenTech',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal),),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),

              Text('Username',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal,color: sh_appColor),),
              SizedBox(height: 10.0,),

              TextFormField(
                keyboardType:TextInputType.text ,
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),

              Text('Password',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal,color: sh_appColor),),
              SizedBox(height: 10.0,),
              TextFormField(
                controller: passwordController,
                obscureText: isvisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: InkWell(
                      onTap: (){
                        if(isvisible)
                        {
                          setState(() {
                            isvisible=false;
                          });
                        }
                        else
                        {
                          setState(() {
                            isvisible=true;
                          });

                        }
                      },
                      child: isvisible?Icon(Icons.visibility_off):Icon(Icons.visibility)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: 30.0,),
               InkWell(
                      onTap: (){


                        if(controller.isvalidatecontroll(emailController.text, passwordController.text,context))

                        {
                          loginapi(
                              context, emailController.text, passwordController.text
                          )
                              .then((value)
                          {


                          });
                        }





                      },
                      child: Container(

                          child:  Container(
                            width: width,
                            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                            decoration: BoxDecoration(
                                color: sh_appColor,

                                borderRadius: BorderRadius.all(Radius.circular(10))),

                            child: Center(child: Text("LogIn", style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),)),
                          )
                      ),



                    ),


              SizedBox(height:20.0),
              // GestureDetector(
              //   onTap: (){
              //     //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
              //   },
              //   child: Text.rich(
              //     TextSpan(
              //         text: 'Don\'t have an account',
              //         children: [
              //           TextSpan(
              //             text: 'Signup',
              //             style: TextStyle(
              //                 color: Color(0xffEE7B23)
              //             ),
              //           ),
              //         ]
              //     ),
              //   ),
              // ),


            ],
          ),
        ),
      ),
    );



  }
}
