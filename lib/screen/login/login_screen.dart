import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/component/loading_widget.dart';
import 'package:wallet_merchant/constants.dart';

import '../../size_config.dart';
import 'component/phone_field.dart';
import 'controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    return Scaffold(

        body: Container(
          decoration: const BoxDecoration(
              color: kColorPrimary,
              image: DecorationImage(image: AssetImage('assets/images/Sign_in_background.png'), fit: BoxFit.cover)
          ),
          child: ListView(
            children: [
              SizedBox(height: getProportionateScreenHeight(200)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset('assets/icons/Bank_Of_Khartoum.png',
                  width: getProportionateScreenWidth(150),
                  height: getProportionateScreenHeight(100),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                    key: controller.loginFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(140),
                        ),
                        const BuildPhoneFormField(),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                    Obx(()=>
                    controller.isLoading.value == 0?GestureDetector(
                          onTap: (){
                            // controller.checkLogin();
                            controller.validateLogin();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 5,right: 5),
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black
                            ),
                            child: const Center(child: Padding(padding: EdgeInsets.all(10),child:Text("Continue",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                          ),
                        ):LoadingWidget.buildLoadingWidget(),
                       )
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
