import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/size_config.dart';
import '../../constants.dart';
import 'component/custom_list_body.dart';
import 'controller/my_message_controller.dart';
import 'package:wallet_merchant/model/response/my-message/MyMessageResponse.dart';

class MyMessageScreen extends GetView<MyMessageController>{
  const MyMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<MyMessageController>(
          () => MyMessageController(),
    );
    return Scaffold(

      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text("My Message"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Obx(() =>
            Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: SizeConfig.screenWidth,
              color: stroke,

              child: controller.myMessageResponseData.value.userMessageList !=null ?buildList(controller.myMessageResponseData.value.userMessageList):Container(),
            )
        )

          ],
        ),
      ),



    );
  }


  Widget buildList(List<UserMessageList>? userMessageList) {
    return  Column(
        children: [
          ...List.generate(userMessageList!.length, (index) {
            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: CustomListBody(userMessageList: userMessageList[index],),

            );
          }),
        ],

    );
  }



}