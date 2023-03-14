import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/balance/balance_screen.dart';
import 'package:wallet_merchant/screen/dashboard/controller/dashboard_controller.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';

class Balance extends GetView<DashboardController> {
  const Balance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 25, left: 15, right: 15),
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(const BalanceScreen());
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
                          "BALANCE CHECK",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                          "Check Your Balance",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
