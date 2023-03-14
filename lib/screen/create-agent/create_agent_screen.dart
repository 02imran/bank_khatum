import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/create-agent/component/vat_drop_down.dart';
import 'package:wallet_merchant/screen/create-agent/controller/create_agent_controller.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'component/agent_service_list.dart';
import 'component/license_field.dart';
import 'component/name_field.dart';
import 'component/phone_code_field.dart';
import 'component/wallet_type.dart';

class CreateAgentScreen extends GetView<CreateAgentController> {
  const CreateAgentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<CreateAgentController>(
      () => CreateAgentController(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Create Agent"),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              width: SizeConfig.screenWidth,
              child: Form(
                key: controller.agentFromKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    SizedBox(height: getProportionateScreenHeight(20),),
                    const BuildNameFormField(),

                    SizedBox(height: getProportionateScreenHeight(20),),
                    const BuildPhoneCodeFormField(),

                    SizedBox(height: getProportionateScreenHeight(20),),
                    const BuildLicenseFormField(),

                    SizedBox(height: getProportionateScreenHeight(20),),
                    const Text("Select VAT/WHT Setting"),
                    const VatDropDown(),
                    SizedBox(height: getProportionateScreenHeight(20),),
                    const Text("Select Wallet Type"),
                    WalletTypeDropDown(),
                    Obx(() =>    controller.getAgentList.isNotEmpty ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: getProportionateScreenHeight(20),),
                        const Text("Select Parent Type"),
                        AgentServiceListDropDown(),
                      ],
                    ):const SizedBox(),),


                    SizedBox(height: getProportionateScreenHeight(30),),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            controller.phoneController.text="";
                            controller.nameController.text="";
                            controller.licenseController.text="";
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
                            controller.submit(context);
                            // controller.getAgentUpdate();
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
                ),
              ))),
    );
  }
}
