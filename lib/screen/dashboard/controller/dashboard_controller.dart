import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:wallet_merchant/model/body/get-customer-menu/GetCustomerMenuBody.dart';
import 'package:wallet_merchant/model/body/getmenu/GetMenuBody.dart';
import 'package:wallet_merchant/model/response/get-customer-menu/GetCustomerMenuResponse.dart';
import 'package:wallet_merchant/model/response/getmenu/GetMenuResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';
import 'package:wallet_merchant/screen/create-agent/controller/create_agent_controller.dart';
import 'package:wallet_merchant/screen/otp/otp_screen.dart';
import 'package:wallet_merchant/screen/update-pin/update-pin.dart';

import '../../../../DialogHelper.dart';
import '../../../../app_and_device_info.dart';
import '../../../../shared_prefs_helper.dart';
import '../../../global.dart';
import '../../../model/response/message-token/MessageTokenResponse.dart';
import '../component/agent_wallet_type/models/AgentWalletTypeResponseModel.dart';

class DashboardController extends GetxController with StateMixin{

  PageController pageControllerMerchant = PageController();
  PageController pageControllerAgent = PageController();
  var selectedIndexMerchant=0.obs;
  var selectedIndexAgent=0.obs;

  final advancedDrawerController = AdvancedDrawerController();

  final AppRepository _appRepository=AppRepository();

  var fullNameFromResponse="".obs;
  var walletId="".obs;
  var accountCode="".obs;
  var isCashOut=false.obs;

  var userType="".obs;
  var walletType=0.obs;

  var isCustomerCreate=false.obs;
  var latitude=0.0.obs;
  var longitude=0.0.obs;

  var getCustomerMenuResponseFromApi=GetCustomerMenuResponse(responseCode: 10).obs;

  var agentWalletType = ''.obs;

  RxList<WalletTypePayload> hierarchyWalletType = <WalletTypePayload>[].obs;
  var isShowAgentCreate = false.obs;



  List<Map<String, dynamic>> agentMenuList = [
    {'title': 'Cash In', 'sub_title': 'Sent Money To Customer', 'img': 'assets/icons/Cash_In.png'},
    {'title': 'Non Member Cash Out', 'sub_title': 'Cash Out Using Security Code', 'img': 'assets/icons/non-member-cash-out.png'},
    {'title': 'Merchant Cash Out', 'sub_title': 'Receive Cash Out From Merchant', 'img': 'assets/icons/merchant-cash-out.png'},
    {'title': 'Customer Registration', 'sub_title': 'Customer Registration', 'img': 'assets/icons/customer-registration.png'},
    {'title': 'Update Customer Information', 'sub_title': 'Update Customer Account', 'img': 'assets/icons/update-cutomer-information.png'},
    {'title': 'BALANCE CHECK', 'sub_title': 'Check Your Balance', 'img': 'assets/icons/balance-check.png'},
    {'title': 'TRANSACTION', 'sub_title': 'View Transaction History', 'img': 'assets/icons/transaction.png'},
    {'title': 'Create Agent', 'sub_title': 'Create Agent', 'img': 'assets/icons/Create Agent.png'},
    {'title': 'Balance Transfer', 'sub_title': 'Transfer Balance To Agent', 'img': 'assets/icons/balance_Transfer.png'},
    {'title': 'Distributor Cash Out', 'sub_title': 'Cash Out To Master Wallet', 'img': 'assets/icons/Distributor_cash_out.png'},
  ];

  @override
  void onInit() {
    super.onInit();
    pageControllerMerchant = PageController(initialPage: 0);
    pageControllerAgent = PageController(initialPage: 0);
    

    getAppVersion().then((appVersion) => {
      getDeviceId().then((deviceId) => {
        getFlag().then((flag) => {
          getFullName().then((fullName) => {
            getOsVersion().then((osVersion) => {
              getPhoneBrand().then((phoneBrand) => {
                SharedPrefsHelper.getMsisdn().then((msisdn) => {
                 SharedPrefsHelper.getBasicToken().then((token) => {
                  getOs().then((os)  async {
                    if (kDebugMode) {
                      print("App Version:"+appVersion+","+"Device Id:"+deviceId+","+"flag:"+flag+","+"FullName:"+fullName!+","+"Os Version:"+osVersion!+","+"phone Brand:"+phoneBrand!+","+"Os:"+os!);
                    }
                    var getMenuBody=GetMenuBody(appVersion: appVersion, deviceId: deviceId,  fullName: fullName!, msisdn: msisdn, osVersion: osVersion!, phoneBrand: phoneBrand!, phoneOs: os!);
                    print("Body::"+getMenuBody.toJson().toString());
                    DialogHelper.showLoading("Please Wait");
                    GetMenuResponse  response= await _appRepository.getMenu(getMenuBody,token);
                    print("Response::"+response.toJson().toString());
                    if(response.responseCode==100){
                      DialogHelper.hideLoading();

                      accountCodeGlobal=response.accCode!;
                      accountNameGlobal=response.userFullName!;
                      accountNumberGlobal=response.msisdn!;

                      fullNameFromResponse.value=response.userFullName!;
                      walletId.value=response.msisdn!;
                      accountCode.value=response.accCode!;
                      isCashOut.value=response.isCashOut!;
                      userType.value=response.userType!;
                      walletType.value=response.walletType!;
                      print('wlallet type ::::::::: ${walletType.value}');
                      isCustomerCreate.value=response.isCustomerCreate!;
                      // if(response.latitude!.isNotEmpty){
                      //   latitude.value=double.parse(response.latitude!);
                      //   longitude.value=double.parse(response.longitude!);
                      // }
                      getAgentWalletType();
                      if(response.isSecurityQuestionSet==false){
                        Get.offAll(const UpdatePin(isOpenFromMenu: false,));
                      }


                      var customerMenuBody=GetCustomerMenuBody(msisdn: msisdn,deviceId: deviceId,phoneBrand: phoneBrand,phoneOs: os,osVersion: osVersion,fullName: fullName,appVersion: appVersion);
                      print("Body Customer Menu::"+customerMenuBody.toJson().toString());
                      GetCustomerMenuResponse menuResponse= await _appRepository.getCustomerMenu(customerMenuBody, token);

                      if(menuResponse.responseCode==100){

                        getCustomerMenuResponseFromApi.value=menuResponse;
                        printInfo(info: "Get customer menu response ${getCustomerMenuResponseFromApi.value.toJson().toString()}");
                        // print("Customer Menu Response::"+getCustomerMenuResponseFromApi.toJson().toString());

                      }else{
                        Fluttertoast.showToast(
                            backgroundColor: Colors.red,
                            msg: menuResponse.responseDescription!,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM);
                      }


                    }else{
                      Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          msg: response.responseDescription!,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM);
                    }


                    MessageTokenResponse  responseToken= await _appRepository.getMessageToken();
                    if(responseToken.issuccess!){

                      SharedPrefsHelper.storeServiceToken(responseToken.payload!.token!);

                    }
                    
                  })
                })
                })
              })
            })
          })
        })
      })
    });

    currentlatlong();


  }


  getAgentWalletType() async {
    AgentWalletTypeResponseModel response = await _appRepository.getAgentWalletType();
    if (kDebugMode) {
      printInfo(info: "Response::" + response.toJson().toString());
    }
    // print(response.payload![0].walletName);
    DialogHelper.showLoading();
    if (response.statusCode == 200) {
      DialogHelper.hideLoading();
      print('wlallet type ::::::::: ${walletType.value}');
     List<WalletTypePayload> walletTypeList = response.payload ?? [];
      walletTypeList.sort((a, b) => a.hierarchy!.compareTo(b.hierarchy!));
      walletTypeList.forEach((element) {
        print(element.walletName);
      });
      // print('Wallet type ------- $');

    hierarchyWalletType.value = walletTypeList;

    if(walletTypeList[0].walletId == walletType.value){
      isShowAgentCreate.value = true;
    }else{
      isShowAgentCreate.value = false;
    }
      hierarchyWalletType.removeAt(0);
    } else {
      DialogHelper.hideLoading();
    }
  }


  Future<LatLng?> currentlatlong() async {
    Location location =  Location();
    LocationData _locationData = await location.getLocation();

    latitude.value = _locationData.latitude!;
    longitude.value = _locationData.longitude!;

    return LatLng(
        _locationData.latitude ?? 0.0, _locationData.longitude ?? 0.0);
  }

  void handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }

  @override
  void onClose() {
    super.onClose();
   // pageControllerMerchant.dispose();
    //pageControllerAgent.dispose();
  }
}