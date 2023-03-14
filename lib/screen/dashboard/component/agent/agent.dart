import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/balance-transfer/balance_transfer.dart';
import 'package:wallet_merchant/screen/create-agent/create_agent_screen.dart';
import 'package:wallet_merchant/screen/dashboard/controller/dashboard_controller.dart';
import 'package:wallet_merchant/screen/distributor-cashout/distributor_cashout.dart';
import 'package:wallet_merchant/screen/transaction-history/transaction_history_screen.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';

class AgentTab extends GetView<DashboardController> {
  const AgentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 25, left: 15, right: 15),
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [

            Obx(() =>
           controller.walletType.value==112?Container():controller.walletType.value==114?Container():GestureDetector(
              onTap: () {
                Get.to(const CreateAgentScreen());
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: stroke),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: [
                    const Icon(
                      Icons.create,
                      size: 40,
                      color: kColorPrimary,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Create Agent",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                          "Create Agent",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),),
            SizedBox(height: getProportionateScreenHeight(30),),
            GestureDetector(
              onTap: () {
                Get.to(const BalanceTransferScreen());
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: stroke),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_balance_wallet,
                      size: 40,
                      color: kColorPrimary,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Balance Transfer",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                          "Transfer Balance To Agent",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30),),
           Obx(() =>
            controller.walletType.value==112?Container():controller.walletType.value==114?Container():GestureDetector(
              onTap: () {
                Get.to(const DistributorCashOutScreen());
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: stroke),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      size: 40,
                      color: kColorPrimary,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Distributor Cash Out",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                          "Cash Out To Master Wallet",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
