

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/response/UserDiscountVoucherResponse/UserDiscountVoucherResponse.dart';
import 'package:wallet_merchant/screen/redeem_points/components/success_screen.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../main.dart';
import '../../../model/body/user_discount_voucher/UserDiscountVoucherBody.dart';
import '../../../repository/repository.dart';
import '../../../shared_prefs_helper.dart';
import '../../pakage_purchase/models/body/pakage_purchage_body.dart';
import '../../pakage_purchase/models/response/membership_id_response_model.dart';
import '../components/reedem_points_details.dart';
import '../models/body/VoucherPurchaseBody.dart';
import '../models/response/MyRedeemVoucherListResponseModel.dart';
import '../models/response/voucher_details_response_model.dart';
import '../models/response/voucher_purchase_response.dart';


class RedeemPointsController extends GetxController{
  late TextEditingController membershipIdController;
  var membershipId = '';
  var dropdownValue = 'Select Voucher'.obs;

  final AppRepository _appRepository = AppRepository();

  RxList<MyRedeemVoucherInfo>? discountList = <MyRedeemVoucherInfo>[].obs;
  RxList<MyRedeemVoucherInfo>? productList = <MyRedeemVoucherInfo>[].obs;
  RxList<MyRedeemVoucherInfo>? cashList = <MyRedeemVoucherInfo>[].obs;



  var rewardPoint = 0.obs;
  var merchantName = ''.obs;
  var expirDate = ''.obs;
  var voucherImage = ''.obs;
  var merchantId = ''.obs;
  var amount = 0.obs;
  var pmsmembershipid = ''.obs;

  var voucherid = "".obs;
  var voucherpurchaseid = "".obs;

  @override
  void onInit() {
    membershipIdController = TextEditingController();
    getVoucher();

    super.onInit();
  }

  getMembershipId(var id) async {
    MembershipIdBody body = MembershipIdBody(
      subid: membershipIdController.text,
    );
    print(membershipIdController.text);
    DialogHelper.showLoading("Please Wait");
    MembershipIdResponseModel response = await _appRepository.getMemberId(body);
    print("Response::" + response.toJson().toString());
    if (response.issuccess!) {
      DialogHelper.hideLoading();
      pmsmembershipid.value = response.payload!.pmsmembershipid ?? '';
      voucherPurchase(id);
    } else {
      DialogHelper.hideLoading();
    }
  }

  getVoucher() async {

    MyRedeemVoucherListResponseModel response = await _appRepository.getVoucher();
    if (kDebugMode) {
      printInfo(info: "Response::" + response.toJson().toString());
    }
    DialogHelper.showLoading();
    if (response.payload != null) {
      DialogHelper.hideLoading();
      cashList!.value = response.payload!.cash!;
      discountList!.value = response.payload!.discount!;
      productList!.value = response.payload!.product!;
      cashList!.refresh();
      discountList!.refresh();
      productList!.refresh();
      print('discount -------${discountList!.length}');
      print('productList -------${productList!.length}');
      print('cashList -------${cashList!.length}');
    } else {
      DialogHelper.hideLoading();
    }
  }


  getVoucherDetails(String id) async {

    VoucherDetailsResponseModel response = await _appRepository.getVoucherDetails(id);
    if (kDebugMode) {
      printInfo(info: "Response::" + response.toJson().toString());
    }
    DialogHelper.showLoading();
    if (response.payload != null) {
      DialogHelper.hideLoading();
      rewardPoint.value = response.payload!.rewardPoint!;
      merchantName.value = response.payload!.merchantName!;
      expirDate.value = response.payload!.expiryDate!;
      voucherImage.value = response.payload!.voucherImage!;
      merchantId.value = response.payload!.merchantId!;
      amount.value = response.payload!.voucherValue!;

      Get.to(()=> ReedemPointsDetails(id: id));


    } else {
      DialogHelper.hideLoading();
    }
  }

  voucherPurchase(var id) async{
    SharedPrefsHelper.getMsisdn().then((msisdn) => {
      getOs().then((os) async {
        VoucherPurchaseBody voucherBody = VoucherPurchaseBody(
            amount: '${amount.value}',
            currency: "XCD",
            sourceWalletID: msisdn,
            destWalletID: pmsmembershipid.value,
            keyword: "VPMT",
            transactionFee: '0',
            transactionComm: '0',
            chargePayer: 1,
            comissionReceiver: 0,
            referenceID: id);

        print("Body:::::::::"+voucherBody.toJson().toString());
        VoucherPurchaseResponseModel response =
        await _appRepository.voucherPurchase(voucherBody);
        DialogHelper.showLoading("Please Wait");
        if (response.responseCode == 100) {
          DialogHelper.hideLoading();
          Get.to(()=>const SuccessScreen(), arguments: [ merchantId.value, amount.value, rewardPoint.value, merchantName.value, expirDate.value]);
        } else {
          DialogHelper.hideLoading();
          Fluttertoast.showToast(
              backgroundColor: Colors.red,
              msg: response.responseDescription!,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM);
        }
      })
    });
  }

  useDiscountVoucher() async{

    UserDiscountVoucherBody voucherBody = UserDiscountVoucherBody(
        voucherid: "PD00203",
        voucherpurchaseid: "120374",
        pin: "1234"
    );

        print("Body:::::::::"+voucherBody.toJson().toString());
    UserDiscountVoucherResponse response =
        await _appRepository.getUserDiscountVoucher(voucherBody);
        DialogHelper.showLoading("Please Wait");
        if (response.payload != null) {
          DialogHelper.hideLoading();
          // response.payload.
        } else {
          DialogHelper.hideLoading();
          Fluttertoast.showToast(
              backgroundColor: Colors.red,
              msg: response.message!,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM);
        }


  }

  useCashVoucher() async{

    UserDiscountVoucherBody voucherBody = UserDiscountVoucherBody(
        voucherid: "PD00203",
        voucherpurchaseid: "120374",
        pin: "1234"
    );

    print("Body:::::::::"+voucherBody.toJson().toString());
    UserDiscountVoucherResponse response =
    await _appRepository.getUseCashVoucher(voucherBody);
    DialogHelper.showLoading("Please Wait");
    if (response.payload != null) {
      // response.payload.customerId
      DialogHelper.hideLoading();
    } else {
      DialogHelper.hideLoading();
      Fluttertoast.showToast(
          backgroundColor: Colors.red,
          msg: response.message!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
    }


  }


  String? validateMemberId(String value) {
    if (value.length < 30) {
      return "Membership Id not valid";
    }
    return null;
  }
}