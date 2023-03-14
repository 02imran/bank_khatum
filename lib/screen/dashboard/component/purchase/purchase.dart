import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:wallet_merchant/component/loading_widget.dart';
import 'package:wallet_merchant/model/response/get-customer-menu/GetCustomerMenuResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';
import 'package:wallet_merchant/screen/dashboard/component/purchase/qr_view.dart';
import 'package:wallet_merchant/screen/dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/dynamic-merchantlist/dynamic_merchant_list_screen.dart';

import '../../../../EnCryptHelper.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../coming-soon/coming_soon_screen.dart';
import '../../../local-merchantlist/local_merchant_list_screen.dart';
import '../../../merchant-payment/merchant_payment.dart';

class Purchase extends  GetView<DashboardController> {
  const Purchase({Key? key}) : super(key: key);


  //Text(controller.getCustomerMenuResponseFromApi.value.responseData!.tabs![1].menuItems![0].itemName!) without 5007 5011

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appBackGround,
        title: const Text("Mlajan",style: TextStyle(color: kColorPrimary),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          Get.to(()=>const QRViewExample());
        },
        backgroundColor: Colors.white,
        child: Image.asset('assets/icons/qrcode.png',  height: 30, width: 30),
      ),
      body: SafeArea(
        child: Obx(() => (controller.getCustomerMenuResponseFromApi.value.responseCode ?? 0)==100?SizedBox(
            height: SizeConfig.screenHeight,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [

                   SizedBox(height: getProportionateScreenHeight(20),),
                  (controller.getCustomerMenuResponseFromApi.value.responseData?.tabs ?? []).length == 1 ?
                  (controller.getCustomerMenuResponseFromApi.value.responseData?.tabs?[0].offerImages ?? []).isNotEmpty?Container(
                    margin: const EdgeInsets.only(left: 15,right: 15),
                    child: ImageSlideshow(
                      width: double.infinity,
                      height: 170,
                      initialPage: 0,
                      indicatorColor: Colors.blue,
                      indicatorBackgroundColor: Colors.grey,
                      children: [
                        ...List.generate(
                          (controller.getCustomerMenuResponseFromApi.value.responseData?.tabs?[0].offerImages ?? []).length,
                              (index) {
                              return  Image.network(
                                AppRepository.imageBaseUrl+(controller.getCustomerMenuResponseFromApi.value.responseData?.tabs?[0].offerImages?[index].link ?? "") ,
                                fit: BoxFit.fill,
                              );// here by default width and height is 0
                          },
                        ),
                      ],
                      onPageChanged: (value) {
                        print('Page changed: $value');
                      },
                      autoPlayInterval: 3000,
                      isLoop: true,
                    ),
                  ):Container(): Container(),


                   SizedBox(height: getProportionateScreenHeight(30),),
                  (controller.getCustomerMenuResponseFromApi.value.responseData?.tabs ?? []).length == 2 ?
                  _buildProductWidget((controller.getCustomerMenuResponseFromApi.value.responseData?.tabs?[1].menuItems ?? [])): Container()
                ],
              ),
            )
        ):SizedBox(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: Center(child: LoadingWidget.buildLoadingWidget())
        ))
      ),
    );
  }

  Widget _buildProductWidget(List<MenuItems>? menuItems,) {
    return Container(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            childAspectRatio: 0.76,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 25.0,
            physics: const ScrollPhysics(),
            children: [
              ...List.generate(
                menuItems!.length,
                    (index) {
                  return menuCard(menuItems[index].itemName ?? "" ,getDashBoardIcon(menuItems[index].itemId ?? ""),menuItems[index].itemId ?? "");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget menuCard(String? menuName,String? image,String? itemId){

    return GestureDetector(
      onTap: (){
        if(itemId=="5011"){
          Get.to( LocalMerchantListScreen());

        }
        else if(itemId=="5007"){
          Get.to( const ComingSoonScreen());
        }
        else{
          Get.to(const DynamicMerchantListScreen(),arguments: [itemId]);
          print('itemId ----------$itemId');
        }

      },
      child: Column(
        children: [
          Image.asset(image ?? "",height: 30,width: 30,),
          const SizedBox(height: 3,),
          Text(menuName ?? "",style: const TextStyle(color: Colors.black,fontSize: 10,),textAlign: TextAlign.center,)
        ],
      ),
    );

  }

  String? getDashBoardIcon(String menuID){

    if(menuID=="5000"){
      return "assets/images/outline_phone_iphone_black_24dp.png";
    }
    else if(menuID=="5001"){
      return "assets/images/outline_eat_menu_black_24dp.png";
    }
    else if(menuID=="5002"){
      return "assets/images/outline_restaurant_menu_black_24dp.png";
    }
    else if(menuID=="5003"){
      return "assets/images/outline_local_taxi_black_24dp.jpg";
    }
    else if(menuID=="5004"){
      return "assets/images/outline_movie_black_24dp.png";
    }
    else if(menuID=="5005"){
      return "assets/images/baseline_fitness_center_black_24dp.png";
    }
    else if(menuID=="5006"){
      return "assets/images/outline_assignment_ind_black_24dp.png";
    }
    else if(menuID=="5007"){
      return "assets/images/outline_account_balance_black_24dp.png";
    }
    else if(menuID=="5008"){
      return "assets/images/outline_local_library_black_24dp.jpeg";
    }
    else if(menuID=="5009"){
      return "assets/images/baseline_local_airport_black_24dp.png";
    }
    else if(menuID=="5010"){
      return "assets/images/outline_business_center_black_24dp.jpeg";
    }
    else if(menuID=="5011"){
      return "assets/images/outline_router_black_24dp.png";
    }
    else if(menuID=="5012"){
      return "assets/images/outline_shopping_bag_black_24dp.png";
    }
    else{
      return "assets/images/ico_transaction_successful.png";
    }




  }

  Future<void> _scan() async {

    String barcodeScan = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", false, ScanMode.DEFAULT);
    print("Log From Qr Code Scanner::"+barcodeScan);
    var output=EnCryptHelper.extractPayload(barcodeScan);
    print("Log After Decode::"+output);

    var data=output.split(",");
    // co
    if(data[0]=="Merchant"){
      if(data.length==3){
        Get.to(const MerchantPaymentScreen(),arguments: [data[2],data[1],"",""]);
      }else{
        if(data[3].contains(".")){
          Get.to(const MerchantPaymentScreen(),arguments: [data[2],data[1],data[3].replaceAll(RegExp(r'\.[^0-9]'),''),""]);
        }else{
          Get.to(const MerchantPaymentScreen(),arguments: [data[2],data[1],data[3].replaceAll(RegExp(r'[^0-9]'),''),""]);
        }
      }
    }


  }





}


