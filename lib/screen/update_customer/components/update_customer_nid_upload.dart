
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../controller/update_customer_controller.dart';

class UpdateCustomerNidUpload extends GetView<UpdateCustomerController> {
  const UpdateCustomerNidUpload({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<UpdateCustomerController>(
          () => UpdateCustomerController(),
    );
    return Obx(() => Row(
      children: [
        Container(
          width: SizeConfig.screenWidth! * 0.43,
          decoration: BoxDecoration(
              border: Border.all()
          ),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(5)),
              RichText(
                text: const TextSpan(
                  text: 'ID CARD',

                  style: TextStyle(fontSize: 16, color: kTextColor ),
                  children: <TextSpan>[
                    TextSpan(
                        text: '  *\n', style: TextStyle(color: kColorPrimary)),
                    TextSpan(text: 'FRONT SIDE'),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(5)),
              GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text('Camera'),
                              onTap: () {
                                Navigator.pop(context);
                                controller.getFromCamera();
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo),
                              title: const Text('Gallery'),
                              onTap: () {
                                Navigator.pop(context);
                                controller.getFromGallery();
                              },
                            ),
                          ],
                        );
                      });

                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    controller.nidFront.value.isEmpty
                        ? Container(
                      height: getProportionateScreenHeight(100),
                      width: getProportionateScreenWidth(100),
                      color: Colors.black38,
                    ): Container(
                      height: getProportionateScreenHeight(100),
                      width: getProportionateScreenWidth(100),

                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: MemoryImage(controller.nidFront.value),
                            fit: BoxFit.cover
                          )
                      ),
                    ),

                    Positioned(
                      right: -15,
                      bottom: 0,
                      child: Container(
                        padding:const EdgeInsets.all(3),
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: kColorPrimary),
                        child: const Icon(Icons.arrow_upward_sharp, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(5)),
            ],
          ),
        ),
        const Spacer(),
        Container(
          width: SizeConfig.screenWidth! * 0.43,
          decoration: BoxDecoration(
              border: Border.all()
          ),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(5)),
              RichText(
                text: const TextSpan(
                  text: 'FACE PHOTO',

                  style: TextStyle(fontSize: 16, color: kTextColor ),
                  children: <TextSpan>[
                    TextSpan(
                        text: '  *\n', style: TextStyle(color: kColorPrimary)),

                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(5)),
              GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text('Camera'),
                              onTap: () {
                                Navigator.pop(context);
                                controller.getFromCamera1();
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo),
                              title: const Text('Gallery'),
                              onTap: () {
                                Navigator.pop(context);
                                controller.getFromGallery1();
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    controller.nidBack.value.isEmpty
                        ? Container(
                      height: getProportionateScreenHeight(100),
                      width: getProportionateScreenWidth(100),
                      color: Colors.black38,
                    ): Container(
                      height: getProportionateScreenHeight(100),
                      width: getProportionateScreenWidth(100),

                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: MemoryImage(controller.nidBack.value),
                              fit: BoxFit.cover
                          )
                      ),
                    ),

                    Positioned(
                      right: -15,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: kColorPrimary),
                        child: const Icon(Icons.arrow_upward_sharp, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(5)),
            ],
          ),
        )
      ],
    ));
  }
}