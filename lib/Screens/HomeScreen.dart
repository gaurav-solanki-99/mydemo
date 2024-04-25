import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mydemo/Controller/ProductController.dart';


import '../Model/UserModel.dart';
import '../NetWorksApi/userapi.dart';
import '../Utils/ShColorConstants.dart';
import 'LoginScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  List<Datum> userlist=[];
  ProductController controller = Get.put(ProductController());
  @override
  void initState() {
    super.initState();



    controller.loadData(context);
    getUserApi(context,).then((value) {

      if(value!="")
      {
        setState(() {
          userlist=usersFromJson(value).data;

          print("listrooms >>>>>>"+userlist.length.toString());
        });

      }



    });
  }


  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = InkWell(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          decoration: BoxDecoration(
            color: Color(0xffEE7B23),
            borderRadius: BorderRadius.circular(10),
          ),

          child: Text("Cancel")),
      onTap:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = Container(

      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xffEE7B23),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        child: Text("ok"),
        onTap:  () {

          // prefs.setBool(sp_login,false);
          // print("sp_login>>>>>>>>>>>>>>>>>>>>>>>> 1 "+prefs.getBool(sp_login).toString());
          // Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));


          // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> LoginScreen()));
          // Navigator.pop(context);
          
          
          Get.offNamed('/second');
        },
      ),
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Log-out",style: TextStyle(fontWeight: FontWeight.bold),),
      content: Text("Are you sure you want to Log-out?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Container(
          width: width,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height*0.3,
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 50,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Icon(Icons.menu,color: Colors.white,),
                          InkWell(

                            onTap: (){
                              showAlertDialog(context);
                            },
                              child: Icon(Icons.login,color: Colors.white,)),
                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    Text("Home",style: TextStyle(color: Colors.white,fontSize: 30),),

                    SizedBox(height: 15,),
                    Text("Welcome in ZenTech",style: TextStyle(color: Colors.white,fontSize: 20),)
                  ],
                ),

              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Verbettersuggestive",style: TextStyle(color: Colors.black,fontSize: 20),),
                    Icon(Icons.add_circle,color: Colors.lightBlueAccent,size: 30,)

                  ],
                ),
              ),
        

              GetX<ProductController>(
                init: ProductController(),
                builder: (controller) {
                  if (controller.rxProducts2.toList().isEmpty) {
                    return Center(
                      child: Container(),
                    );
                  } else {
                    return  Container(
                      width: width,
                      height: height*0.6,
                      child: Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.rxProducts2.toList().length,

                            itemBuilder: (context,index){

                              return  Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    height: height*0.3,

                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.lightBlueAccent,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          height: 70,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                            children: [

                                              Row(

                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(

                                                    width: 50.0,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color:  Color(0xff7c94b6),
                                                      image: DecorationImage(
                                                        image: NetworkImage(controller.rxProducts2.toList()[index].avatar!=""?controller.rxProducts2.toList()[index].avatar!
                                                            :'http://i.imgur.com/QSev0hg.jpg'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      borderRadius: BorderRadius.all( Radius.circular(50.0)),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                  ),

                                                  SizedBox(width: 10,),

                                                  Container(
                                                    margin: EdgeInsets.only(top: 15),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(controller.rxProducts2.toList()[index].firstName,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                                        Text(controller.rxProducts2.toList()[index].email,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.normal),)
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )



                                            ],



                                          ),
                                        )
                                        ,

                                        SizedBox(height: 10,),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,

                                            children: [
                                              Text("Start Date",style: TextStyle(color: Colors.blueGrey),),

                                              SizedBox(width: 25,),
                                              Text("End Date",style: TextStyle(color: Colors.blueGrey),)
                                            ],

                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,

                                            children: [
                                              Text("01-02-2021",style: TextStyle(fontSize: 18),),

                                              SizedBox(width: 25,),
                                              Text("12-11-2021",style: TextStyle(fontSize: 18),)
                                            ],

                                          ),
                                        ),

                                        SizedBox(height: 10,),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,

                                            children: [
                                              Text("Status"),

                                              SizedBox(width: 25,),
                                              Text("ok",style: TextStyle(fontSize: 18),)
                                            ],

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                    );
                  }
                },
              ),


            ],



          ),
        ),
      ),
    );
  }
}
