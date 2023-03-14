import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wallet_merchant/EnCryptHelper.dart';
import 'package:wallet_merchant/screen/my-qr-code/controller/my_qr_code_controller.dart';
import '../../constants.dart';
import '../../helper/NumericTextFormatter.dart';
import '../../size_config.dart';



class MyQrCodeScreen extends GetView<MyQrCodeController>{
  const MyQrCodeScreen( {required this.userType,required this.code,required this.fullName});
  final String userType;
  final String code;
  final String fullName;


  @override
  Widget build(BuildContext context) {
    Get.lazyPut<MyQrCodeController>(
          () => MyQrCodeController(),
    );
    controller.amountController.text = "";
    controller.amount.value = "";
    return Scaffold(
      backgroundColor: appBackGround,
      bottomNavigationBar: GestureDetector(
        onTap: (){

          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.only(left: 20,right: 10),
                  height: MediaQuery.of(context).size.height / 2 +
                      MediaQuery.of(context).viewInsets.bottom,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      SizedBox(height: getProportionateScreenHeight(10),),
                      TextFormField(
                        controller: controller.amountController,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly,NumericTextFormatter()],
                        style: const TextStyle(color: kTextColor, fontSize: 17),
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: const InputDecoration(
                          counterText: "",
                          labelText: "Amount",
                          labelStyle: TextStyle(color: kTextColor),
                          contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 0),
                          enabledBorder: UnderlineInputBorder(),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid, color: kColorPrimary)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid, color: kColorPrimary)),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(16),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: (){
                              controller.amountController.text="";
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
                              FocusScope.of(context).requestFocus(FocusNode());

                              controller.amount.value=controller.amountController.text;
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: getProportionateScreenWidth(140),
                              height: getProportionateScreenHeight(50),
                              margin: const EdgeInsets.only(left: 5,right: 5),
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: kButtonColor
                              ),
                              child: const Center(child: Center(child:Text("Submit",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                            ),
                          )
                        ],
                      )
                    ],

                  ),
                );
              });

        },
        child: Container(

          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.only(bottom: 15,top: 10,left: 10,right: 10),
          decoration: const BoxDecoration(
            color: kColorPrimary
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Text("Add Amount To QR Code",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
              Obx(() => controller.amount.value == "" ? const Icon(Icons.add,color: Colors.white,size: 20,):
              Text(controller.amount.value + " XCD", style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),),

            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        title: const Text("My Qr Code",style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      body: Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      width: SizeConfig.screenWidth,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(10),),
            userType=="Merchant"?const Text("Let the customer scan this QR code to \n pay!",textAlign: TextAlign.center,):const Text("Let the customer scan this QR code to \n Cash Out!",textAlign: TextAlign.center,),
            SizedBox(height: getProportionateScreenHeight(15),),
            Container(
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              child:Obx(() => QrImage(
                data: controller.amount.value.isEmpty?EnCryptHelper.enCryptWithOutAmount(userType,code,fullName):EnCryptHelper.enCryptWithAmount(userType,code,fullName,controller.amountController.text),
                version: QrVersions.auto,
                size: 200.0,
              ),)
            ),
            SizedBox(height: getProportionateScreenHeight(20),),
            userType=="Merchant"? Text("Or Enter Your Merchant Code \n $code",textAlign: TextAlign.center,): Text("Or Enter Your Agent Code \n $code",textAlign: TextAlign.center,),



          ],
        ),
      ),
      )
    );
  }





}