

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/dashboard/controller/dashboard_controller.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../dashboard/component/agent_wallet_type/models/AgentWalletTypeResponseModel.dart';
import '../controller/create_agent_controller.dart';

class WalletTypeDropDown extends  GetView<CreateAgentController>{


  final dashboardController = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => dashboardController.hierarchyWalletType.isNotEmpty?Container(
        width: SizeConfig.screenWidth,
        height: getProportionateScreenHeight(54),
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.black))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenHeight(10)),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth! - 70,
                    height: getProportionateScreenHeight(30),
                    child: DropdownButton<WalletTypePayload>(
                      dropdownColor: Colors.white,
                      underline: Container(),
                      icon: const Visibility(visible: false, child: Icon(Icons.arrow_drop_down)),
                      value: controller.walletTypeSelect.value,
                      //elevation: 5,
                      style: const TextStyle(
                          color: kTextColor),
                      items: dashboardController.hierarchyWalletType.map<DropdownMenuItem<WalletTypePayload>>((value) {
                        return DropdownMenuItem<WalletTypePayload>(
                          value: value,
                          child: Text(value.walletName!),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.walletTypeSelect.value=value!;
                        controller.getAgentServiceList();
                      },
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: kTextColor,
                  )
                ],
              ),
            ),
          ],
        )):Container());
  }

}