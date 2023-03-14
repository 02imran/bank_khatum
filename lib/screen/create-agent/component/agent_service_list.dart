

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/dashboard/controller/dashboard_controller.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../dashboard/component/agent_wallet_type/models/AgentServiceListResponseModel.dart';
import '../../dashboard/component/agent_wallet_type/models/AgentWalletTypeResponseModel.dart';
import '../controller/create_agent_controller.dart';

class AgentServiceListDropDown extends  GetView<CreateAgentController>{


  // final dashboardController = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.getAgentList.isNotEmpty?Container(
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
                    child: DropdownButton<AgentServicePayload>(
                      dropdownColor: Colors.white,
                      underline: Container(),
                      icon: const Visibility(visible: false, child: Icon(Icons.arrow_drop_down)),
                      value: controller.agentServiceListSelect.value ,
                      //elevation: 5,
                      style: const TextStyle(
                          color: kTextColor),
                      items: controller.getAgentList.map<DropdownMenuItem<AgentServicePayload>>((value) {
                        return DropdownMenuItem<AgentServicePayload>(
                          value: value,
                          child: Text('${value.agentName}'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.agentServiceListSelect.value=value!;

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