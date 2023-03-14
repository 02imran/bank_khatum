import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'component/phone_code_field.dart';
import '../../constants.dart';
import '../../size_config.dart';
import 'controller/create_customer_controller.dart';

class CreateCustomerScreen extends GetView<CreateCustomerController>{
  const CreateCustomerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.lazyPut<CreateCustomerController>(
          () => CreateCustomerController(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        title: const Text("Customer Registration",style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),

      body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          width: SizeConfig.screenWidth,
          child: Form(
              key: controller.createCustomerFromKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  const BuildPhoneCodeFormField(),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.phoneController.text="";
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
                          // Get.to(()=>CreateCustomerForm());
                          controller.checkCreateCustomer(context);
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Container(
                          width: getProportionateScreenWidth(140),
                          height: getProportionateScreenHeight(50),
                          margin: const EdgeInsets.only(left: 5,right: 5),
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: kButtonColor
                          ),
                          child: const Center(child: Center(child:Text("Confirm",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
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