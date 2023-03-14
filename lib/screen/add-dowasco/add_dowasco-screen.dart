import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../size_config.dart';
import 'component/account_number_field.dart';
import 'component/name_field.dart';
import 'controller/add_dowasco_controller.dart';

class AddDowascoScreen extends GetView<AddDowascoController>{
const AddDowascoScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    Get.lazyPut<AddDowascoController>(
          () => AddDowascoController(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text("Add Account"),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          width: SizeConfig.screenWidth,
          child: Form(
              key: controller.addDowascoFromKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),

                  const AccountNumberFormField(),

                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  const AccountNameField(),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.dowascoAccountController.text="";
                          controller.nameController.text="";
                        },
                        child: Container(
                          width: getProportionateScreenWidth(140),
                          height: getProportionateScreenHeight(50),
                          margin: const EdgeInsets.only(left: 5,right: 5),
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: colorOrange
                          ),
                          child: const Center(child: Center(child:Text("Clear",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.checkAccountDetails(context);
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Container(
                          width: getProportionateScreenWidth(140),
                          height: getProportionateScreenHeight(50),
                          margin: const EdgeInsets.only(left: 5,right: 5),
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kButtonColor
                          ),
                          child: const Center(child: Center(child:Text("Submit",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                        ),
                      )
                    ],
                  )
                ],
              ))

      ),
    );
  }




}