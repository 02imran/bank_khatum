import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallet_merchant/model/body/aml/AmlBody.dart';
import 'package:wallet_merchant/model/body/app-login/AppLoginBody.dart';
import 'package:wallet_merchant/model/body/create-agent/CreateAgentBody.dart';
import 'package:wallet_merchant/model/body/create-agent/vat/VatSettingBody.dart';
import 'package:wallet_merchant/model/body/get-customer-menu/GetCustomerMenuBody.dart';
import 'package:wallet_merchant/model/body/get-security-question/GetSecurityQuestionBody.dart';
import 'package:wallet_merchant/model/body/getappotp/GetAppOtpBody.dart';
import 'package:wallet_merchant/model/body/getmenu/GetMenuBody.dart';
import 'package:wallet_merchant/model/body/location/LocationBody.dart';
import 'package:wallet_merchant/model/body/masster-wallet/MasterWalletBody.dart';
import 'package:wallet_merchant/model/body/my-message/MyMessageBody.dart';
import 'package:wallet_merchant/model/body/report/ReportBody.dart';
import 'package:wallet_merchant/model/body/reset-pin/ResetPinBody.dart';
import 'package:wallet_merchant/model/body/reset-security-question/ResetSecurityQuestionBody.dart';
import 'package:wallet_merchant/model/body/success/SuccessBody.dart';
import 'package:wallet_merchant/model/body/transaction/TransactionBody.dart';
import 'package:wallet_merchant/model/body/update-pin/UpdatePinBody.dart';
import 'package:wallet_merchant/model/body/user_discount_voucher/UserDiscountVoucherBody.dart';
import 'package:wallet_merchant/model/body/validateotp/ValidateOtpBody.dart';
import 'package:wallet_merchant/model/response/aml/AmlResponse.dart';
import 'package:wallet_merchant/model/response/ans-reset-security-question/AnsResetSecurityQuestionResponse.dart';
import 'package:wallet_merchant/model/response/app-login/AppLoginResponse.dart';
import 'package:wallet_merchant/model/response/balance/BalanceResponse.dart';
import 'package:wallet_merchant/model/response/create-agent/CreateAgentResponse.dart';
import 'package:wallet_merchant/model/response/create-agent/vat/VatSettingsResponse.dart';
import 'package:wallet_merchant/model/response/get-customer-menu/GetCustomerMenuResponse.dart';
import 'package:wallet_merchant/model/response/get-security-question/GetSecurityQuestionResponse.dart';
import 'package:wallet_merchant/model/response/getappotp/GetAppOtpResponse.dart';
import 'package:wallet_merchant/model/response/getmenu/GetMenuResponse.dart';
import 'package:wallet_merchant/model/response/location/LocationResponse.dart';
import 'package:wallet_merchant/model/response/master-wallet/MasterWalletResponse.dart';
import 'package:wallet_merchant/model/response/message-token/MessageTokenResponse.dart';
import 'package:wallet_merchant/model/response/my-message/MyMessageResponse.dart';
import 'package:wallet_merchant/model/response/report/ReportResponse.dart';
import 'package:wallet_merchant/model/response/reset-pin/ResetPinReponse.dart';
import 'package:wallet_merchant/model/response/reset-security-question/ResetSecurityQuestionResponse.dart';
import 'package:wallet_merchant/model/response/set-security-question/SetSecurityQuestionResponse.dart';
import 'package:wallet_merchant/model/response/success/SuccessResponse.dart';
import 'package:wallet_merchant/model/response/transaction/TransactionResponse.dart';
import 'package:wallet_merchant/model/response/update-pin/UpdatePinReponse.dart';
import 'package:wallet_merchant/model/response/validateotp/ValidateOtpResponse.dart';
import 'package:wallet_merchant/model/body/set-security-question/SetSecurityQuestionBody.dart' as body;
import '../DialogHelper.dart';
import '../model/body/agent_update_body/AgentUpdateBody.dart';
import '../model/body/app_register/AppRegisterBody.dart';
import '../model/body/check-refund-body/CheckRefundBody.dart';
import '../model/body/create-Customer/CreateCustomerBody.dart';
import '../model/body/generate-otp-body/GenerateOtpBody.dart';
import '../model/body/get_customer_profile/GetCustomerProfileBody.dart';
import '../model/body/update_customer_body/update_customer_body.dart';
import '../model/body/validate-customer-otp-body/ValidateOtpCustomerBody.dart';
import '../model/response/UserDiscountVoucherResponse/UserDiscountVoucherResponse.dart';
import '../model/response/app_register/AppRegisterResponse.dart';
import '../model/response/check-refund/CheckRefundResponse.dart';
import '../model/response/create-customer/CustomerRegistrationResponseModel.dart';
import '../model/response/create_agent_update_response/CreateAgentUpdateResponse.dart';
import '../model/response/dowasco/reponse/GetAccountDetailsResponse.dart';
import '../model/response/dowasco/reponse/GetDowascoConfigResponse.dart';
import '../model/response/generate-otp-reponse/GenerateOtpResponse.dart';
import '../model/response/get_profile_data_response/GetProfileResponseModel.dart';
import '../model/response/merchant-list-response/MerchantListResponse.dart';
import '../model/response/merchant-list-token-response/MerchantListTokenResponse.dart';
import '../model/response/transaction-refund-response/TransactionRefundResponse.dart';
import '../model/response/update_customer_response/update_customer_response.dart';
import '../model/response/update_customer_validate/UpdateCustomerValidateOtpResponse.dart';
import '../model/response/validate-otp-customer-response/ValidateCustomerOtpResponse.dart';
import '../screen/dashboard/component/agent_wallet_type/models/AgentServiceListBody.dart';
import '../screen/dashboard/component/agent_wallet_type/models/AgentServiceListResponseModel.dart';
import '../screen/dashboard/component/agent_wallet_type/models/AgentWalletTypeResponseModel.dart';
import '../screen/pakage_purchase/models/body/pakage_purchage_body.dart';
import '../screen/pakage_purchase/models/body/payment_process_body.dart';
import '../screen/pakage_purchase/models/response/membership_id_response_model.dart';
import '../screen/pakage_purchase/models/response/pakage_purchage_response_model.dart';
import '../screen/pakage_purchase/models/response/payment_process_response_model.dart';
import '../screen/redeem_points/models/body/VoucherPurchaseBody.dart';
import '../screen/redeem_points/models/response/MyRedeemVoucherListResponseModel.dart';
import '../screen/redeem_points/models/response/voucher_details_response_model.dart';
import '../screen/redeem_points/models/response/voucher_purchase_response.dart';
import 'DioExceptions.dart';
import 'package:http/http.dart' as http;

class AppRepository{

  final Dio _dio = Dio();

  //Aeon UAT
  // static String baseUrl="http://18.216.155.131:5001/";
  // static String imageBaseUrl="http://18.216.155.131:5001/";
  // static String proxyBaseUrl="http://18.216.155.131:5013/";
  // static String reportBaseUrl="http://apiasb.redltd.tech:2010/";
  // static String messageBaseUrl="http://apiasb.redltd.tech:4050/";
  // static String merchantListBaseUrl="http://18.216.155.131:5000/";

  //AEON PRODUCTION

  //AKASH Data
  static String baseUrlAkash = "http://3.18.0.201:9059/";
  static String voucherBaseUrlAkash = "http://3.18.0.201:9007/";
  static String voucherPurchaseUrlAkash = "http://3.18.0.201:9065/";
  static String agentTypeWalletBaseUrl = "https://uat-api.mlajan.com:4052/";
  static String agentServiceListBaseUrl = "http://3.18.0.201:9066/";

  //Demo

  static String baseUrlDemo = "http://3.18.0.201:9009/";


  var usediscountvoucherUrl = baseUrlDemo + "usediscountvoucher";
  var usecashvoucherUrl =  baseUrlDemo + "usecashvoucher";



  var akashPakageListUrl = baseUrlAkash +'ascapi/package-connection/get-package-list';
  var membershipIdUrl = baseUrlAkash +'ascapi/customer-profile/get-membershipid';
  var paymentProcessUrl = voucherPurchaseUrlAkash +'v1/api/payment/processpayment';
  var getVoucherUrl = voucherBaseUrlAkash +'vouchers';
  var voucherPurchaseUrl = voucherPurchaseUrlAkash +'v1/api/payment/voucherpayment';
  var getVoucherDetailsUrl = voucherBaseUrlAkash +'voucherDetail?voucherid=';
  var getAgentWalletUrl = agentTypeWalletBaseUrl + 'acussapi/unqAgent/wallet_types';
  var getAgentServiceListUrl = agentServiceListBaseUrl + 'maapi/agents-service/list';
  var getAgentUpdateUrl = agentTypeWalletBaseUrl + 'agsrv/api/agent/update';

  //MLAJAN UAT

  static String baseUrl="https://uat-api.mlajan.com:4052/";
  static String newJsonRxUrl="https://uat-api.mlajan.com:4052/";
  // static String baseUrlRX="http://3.128.91.252:5015/";
  static String imageBaseUrl="https://uat-api.mlajan.com:4052/";
  static String proxyBaseUrl="https://uat-api.mlajan.com:4052/";
  static String reportBaseUrl="https://uat-api.mlajan.com:4052/merchant_service/"; //change http://3.138.139.246:2010/
  static String messageBaseUrl="https://uat-api.mlajan.com:4052/";
  static String merchantListBaseUrl="https://uat-api.mlajan.com:4052/";
  static String digicelBaseUrl="https://uat-api.mlajan.com:4052/";
  static String flowBaseUrl="https://uat-api.mlajan.com:4052/";

  // static String baseUrl="http://3.143.176.192:5001/";

  // static String baseUrl="http://3.143.176.192:5001/";
  // static String newJsonRxUrl="http://3.138.139.246:5015/";
  // // static String baseUrlRX="http://3.128.91.252:5015/";
  // static String imageBaseUrl="http://3.143.176.192:5001/";
  // static String proxyBaseUrl="http://3.143.176.192:5013/";
  // static String reportBaseUrl="https://uat-api.mlajan.com:4052/merchant_service/"; //change http://3.138.139.246:2010/
  // static String messageBaseUrl="http://3.138.139.246:4050/";
  // static String merchantListBaseUrl="http://3.138.139.246:5029/";
  // static String digicelBaseUrl="http://3.138.139.246:5027/";
  // static String flowBaseUrl="http://3.138.139.246:5025/";

  //MLAJAN PRODUCTION

  //Url
  var getAppOtpUrl = proxyBaseUrl+'get-app-otp';
  var getOtpUrl = baseUrl+"api/JsonRx/AppRegister";
  var validateDevice = newJsonRxUrl+"jrxapi/JsonRx/validateDevice";
  var validateOtpUrl = baseUrl+"api/JsonRx/ValidateOtp";
  var getMenuUrl = baseUrl+"api/JsonRx/GetMenus";
  var getAmlConfirmUrl = baseUrl+"api/JsonRx/GetAmlConfirmResponse";
  var getTransactionUrl = baseUrl+"api/JsonRx/Transaction";
  var getTransactionResultUrl = baseUrl+"api/JsonRx/GetTransactionResult";
  var appLoginUrl=reportBaseUrl+"api/auth/applogin";
  var getReportUrl=reportBaseUrl+"api/report/customertransectionreport";
  var getBalanceUrl=reportBaseUrl+"api/merchentprofile/balance";
  var vatSettingUrl = baseUrl+"api/JsonRx/GetVatSettings";
  var createAgentUrl = baseUrl+"api/JsonRx/Regn";
  var getMasterWalletUrl = baseUrl+"api/JsonRx/GetMasterWallet";
  var updateLocationUrl = baseUrl+"api/JsonRx/UpdateAgentLocation";
  var messageGetTokenUrl = messageBaseUrl+"api/getToken";
  var getMessageUrl = messageBaseUrl+"api/v1/getNotificationtList";
  var getSecurityQuestionUrl = baseUrl+"api/JsonRx/GetSecurityQuestions";
  var setSecurityQuestionAnsUrl = baseUrl+"api/JsonRx/SetSecurityAnswers";
  var pinResetRequestUrl = baseUrl+"api/JsonRx/PinResetRequest";
  var answerSecurityQuestion = baseUrl+"api/JsonRx/AnswerSecurityQuestion";
  var resetPinUrl = baseUrl+"api/JsonRx/ResetPin";
  var updatePinUrl = baseUrl+"api/JsonRx/ChangePin";
  var getCustomerMenuUrl = baseUrl+"api/JsonRx/GetCustomerMenus";
  var getMerchantListTokenUrl = merchantListBaseUrl+"api/getToken";
  var getMerchantListUrl = merchantListBaseUrl+"api/getMerchantList";
  var getRefundCheckUrl = baseUrl+"api/JsonRx/CheckMerchantRefund";
  var refundUrl=reportBaseUrl+"api/refund/merchentrefundtransection";
  var getDowsacoConfigUrl=messageBaseUrl+"api/doasco/getdoascoconfig";
  var getDowsacoAccountDetailsUrl=messageBaseUrl+"api/soap/getAccountDetails";
  var getDigicelConfigUrl=digicelBaseUrl+"api/v1/paynet/getpaynetconfig";
  var getFlowConfigUrl=flowBaseUrl+"api/flow/getconfig";
  var generateOtpUrl = baseUrl+"api/JsonRx/GenerateOTP";
  var validateCustomerOtpUrl = baseUrl+"api/JsonRx/ValidateCustomerOtp";
  var getCustomerProfileUrl = baseUrl+"api/JsonRx/GetCustomerProfile";
  var updateCustomerKycByAgentUrl = baseUrl+"api/JsonRx/UpdateCustomerKycByAgent";


  //Akash repo
  Future<PakageList> getAkashPakageList() async{

    if (kDebugMode) {
      print(akashPakageListUrl);
    }

    try{
      Response response = await _dio.get(akashPakageListUrl,options: Options(headers: {'Content-Type':'application/json', 'Module':'JW9tc0BBZWRsdGQl'},));
      return PakageList.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<MembershipIdResponseModel> getMemberId(MembershipIdBody body) async{

    if (kDebugMode) {
      print(membershipIdUrl);
    }

    try{
      Response response = await _dio.post(membershipIdUrl, data: body.toJson(), options: Options(headers: {'module':'JW9tc0BBZWRsdGQl'},));
      print(response.data.toString());
      return MembershipIdResponseModel.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }

  Future<PaymentProcessResponseModel> paymentProcess(PaymentProcessBody body) async{

    if (kDebugMode) {
      print(paymentProcessUrl);
    }

    try{
      Response response = await _dio.post(paymentProcessUrl, data: body.toJson(), options: Options(headers: {'module':'JW9tc0BBZWRsdGQl'},));
      print('response ::: ${response.data}');
      return PaymentProcessResponseModel.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<MyRedeemVoucherListResponseModel> getVoucher() async{

    if (kDebugMode) {
      print(getVoucherUrl);
    }

    try{
      Response response = await _dio.get(getVoucherUrl, options: Options(headers: {'module':'JW9tc0BBZWRsdGQl'},));
      return MyRedeemVoucherListResponseModel.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }

  Future<VoucherDetailsResponseModel> getVoucherDetails(String id) async{


    if (kDebugMode) {
      print(getVoucherDetailsUrl);
    }

    try{
      Response response = await _dio.get('$getVoucherDetailsUrl$id', options: Options(headers: {'module':'JW9tc0BBZWRsdGQl'},));
      return VoucherDetailsResponseModel.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<UserDiscountVoucherResponse> getUserDiscountVoucher(UserDiscountVoucherBody body) async{

    if (kDebugMode) {
      print(usediscountvoucherUrl);
    }

    try{
      Response response = await _dio.post(usediscountvoucherUrl, data: body.toJson(), options: Options(headers: {'membershipid':'600008817670814133'},));
      return UserDiscountVoucherResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }

  Future<UserDiscountVoucherResponse> getUseCashVoucher(UserDiscountVoucherBody body) async{

    if (kDebugMode) {
      print(usecashvoucherUrl);
    }

    try{
      Response response = await _dio.post(usecashvoucherUrl, data: body.toJson(), options: Options(headers: {'membershipid':'600008817670814133'},));
      return UserDiscountVoucherResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<VoucherPurchaseResponseModel> voucherPurchase(VoucherPurchaseBody body) async{

    if (kDebugMode) {
      print(voucherPurchaseUrl);
    }

    try{
      Response response = await _dio.post(voucherPurchaseUrl, data: body.toJson(), options: Options(headers: {'module':'JW9tc0BBZWRsdGQl'},));
      return VoucherPurchaseResponseModel.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<AgentWalletTypeResponseModel> getAgentWalletType() async{


    if (kDebugMode) {
      print(getAgentWalletUrl);
    }

    try{
      Response response = await _dio.get(getAgentWalletUrl, options: Options(headers: {'module':'JW9tc0ByZWRsdGQl'},));
      print('Response :::::::: ${response.data}');
      return AgentWalletTypeResponseModel.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }



  Future<AgentServiceListResponseModel> getAgentServiceList(AgentServiceListBody body) async{

    if (kDebugMode) {
      print(getAgentServiceListUrl);
    }

    try{
      Response response = await _dio.post(getAgentServiceListUrl, data: body.toJson(), options: Options(headers: {'module':'JW9tc0BBZWRsdGQl'},));
      print('response::::::::: ${response.data}');
      return AgentServiceListResponseModel.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }

  Future<CreateAgentUpdateResponse> getAgentUpdate(AgentUpdateBody body) async{

    if (kDebugMode) {
      print(getAgentUpdateUrl);
    }

    try{
      Response response = await _dio.post(getAgentUpdateUrl,data: body.toJson(), options: Options(headers: {'Module':'JW9tc0ByZWRsdGQl' ,'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJNU0lTRE4iOiIxNzY3MDgxNDEzNCIsInBhcmVudF9pZCI6IjE3NjcwODE0MTM0IiwiY29tbW9uX2lkIjoiMTc2NzA4MTQxMzQiLCJhcHBsb2dpbiI6dHJ1ZSwibG9naW5fZGF0ZXRpbWUiOiIyMDIyLTEwLTE2VDE5OjEwOjI0LjcyM1oiLCJjaXAiOiIxMDMuMjM3LjM2LjcwIiwiaWF0IjoxNjY1OTQ3NDI0fQ.UE0vMSGPn9rspvnWkb0uORygEqTl4VmVL_nM3Eo1c74'},));
      print('response::::::::: ${response.data}');
      return CreateAgentUpdateResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }
  }



  // --------------------------------------------


  Future<GetAppOtpResponse> getAppOtp(GetAppOtpBody getAppOtpBody) async{


    if (kDebugMode) {
      print(getAppOtpUrl);
    }

    try{
      Response response = await _dio.post(getAppOtpUrl,data: getAppOtpBody.toJson(),options: Options(headers: {'Request-Url':'$getOtpUrl','Content-Type':'application/json'},));
      return GetAppOtpResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }

  Future<AppRegisterResponse> getAppReg(AppRegisterBody getAppOtpBody) async{

    if (kDebugMode) {
      print(getOtpUrl);
    }

    try{
      Response response = await _dio.post(getOtpUrl,data: getAppOtpBody.toJson(),options: Options(headers: {'Content-Type':'application/json'},));
      return AppRegisterResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }
  }
  Future<AppRegisterResponse> getValidate(AppRegisterBody getAppOtpBody) async{
    if (kDebugMode) {
      print(validateDevice);
    }
    try{
      Response response = await _dio.post(validateDevice,data: getAppOtpBody.toJson(),options: Options(headers: {'Content-Type':'application/json'},));
      return AppRegisterResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }



  Future<ValidateOtpResponse> validateOtp(ValidateOtpBody validateOtpBody) async{

    if (kDebugMode) {
      print(validateOtpUrl);
    }

    try{
      Response response = await _dio.post(validateOtpUrl,data: validateOtpBody.toJson(),options: Options(headers: {'Content-Type':'application/json'},));
      return ValidateOtpResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<GetMenuResponse> getMenu(GetMenuBody getMenuBody,String token) async{

    if (kDebugMode) {
      print(getMenuUrl);
      print(token);
    }

    try{
      Response response = await _dio.post(getMenuUrl,data: getMenuBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return GetMenuResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<AmlResponse> getAmlRequest(AmlBody amlBody,String token) async{

    if (kDebugMode) {
      print(getAmlConfirmUrl);
    }

    try{
      Response response = await _dio.post(getAmlConfirmUrl,data: amlBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return AmlResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<TransactionResponse> getTransaction(TransactionBody transactionBody,String token) async{

    if (kDebugMode) {
      print(getTransactionUrl);
    }

    try{
      Response response = await _dio.post(getTransactionUrl,data: transactionBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return TransactionResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<SuccessResponse> getTransactionResult(SuccessBody successBody,String token) async{

    if (kDebugMode) {
      print(getTransactionResultUrl);
    }

    try{
      Response response = await _dio.post(getTransactionResultUrl,data: successBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      print('Response::::::::::::::::::${response}');
      return SuccessResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<AppLoginResponse> getAppLogin(AppLoginBody appLoginBody) async{

    if (kDebugMode) {
      print(appLoginUrl);
    }

    try{
      Response response = await _dio.post(appLoginUrl,data: appLoginBody.toJson(),options: Options(headers: {'Module':"JW9tc0ByZWRsdGQl",'Content-Type':'application/json'},));
      return AppLoginResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<ReportResponse> getReport(ReportBody reportBody,String token) async{

    if (kDebugMode) {
      print(getReportUrl);
    }

    try{
      Response response = await _dio.post(getReportUrl,data: reportBody.toJson(),options: Options(headers: {'Module':"JW9tc0ByZWRsdGQl",'Authorization':"Bearer "+token,'Content-Type':'application/json'},));
      return ReportResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }






  Future<BalanceResponse> getBalance(String token) async{

    if (kDebugMode) {
      print(getBalanceUrl);
    }

    try{
      Response response = await _dio.post(getBalanceUrl,options: Options(headers: {'Module':"JW9tc0ByZWRsdGQl",'Authorization':"Bearer "+token,'Content-Type':'application/json'},));
      print('Barier token ----------$token');
      return BalanceResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<VatSettingsResponse> getVatSettings(VatSettingBody vatSettingBody,String token) async{

    if (kDebugMode) {
      print(vatSettingUrl);
    }

    try{
      Response response = await _dio.post(vatSettingUrl,data: vatSettingBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return VatSettingsResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }

  Future<CreateAgentResponse> createAgent(CreateAgentBody createAgentBody,String token) async{

    if (kDebugMode) {
      print(createAgentUrl);
    }

    try{
      Response response = await _dio.post(createAgentUrl,data: createAgentBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return CreateAgentResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<MasterWalletResponse> getMasterWallet(MasterWalletBody masterWalletBody,String token) async{

    if (kDebugMode) {
      print(getMasterWalletUrl);
    }

    try{
      Response response = await _dio.post(getMasterWalletUrl,data: masterWalletBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return MasterWalletResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }

  Future<LocationResponse> updateLocation(LocationBody locationBody,String token) async{

    if (kDebugMode) {
      print(updateLocationUrl);
    }

    try{
      Response response = await _dio.post(updateLocationUrl,data: locationBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return LocationResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<MessageTokenResponse> getMessageToken() async{
    if (kDebugMode) {
      print(messageGetTokenUrl);
    }
    var params = {
      "password" : "06247d7693d7b30b08db4f7af6179454:dd33e21a1c1dd9f6b18da5a0cb3aa17a",
      "username" : "admin"
    };
    try{
      Response response = await _dio.post(messageGetTokenUrl,data: params,options: Options(headers: {'Content-Type':'application/json'},));
      return MessageTokenResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<MyMessageResponse> getMyMessage(MyMessageBody myMessageBody,String token) async{

    if (kDebugMode) {
      print(getMessageUrl);
    }

    try{
      Response response = await _dio.post(getMessageUrl,data: myMessageBody.toJson(),options: Options(headers: {'Authorization':"Bearer "+token,'Content-Type':'application/json'},));
      return MyMessageResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }



  Future<GetSecurityQuestionResponse> getSecurityQuestion(GetSecurityQuestionBody getSecurityQuestionBody,String token) async{

    if (kDebugMode) {
      print(getSecurityQuestionUrl);
    }

    try{
      Response response = await _dio.post(getSecurityQuestionUrl,data: getSecurityQuestionBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return GetSecurityQuestionResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }




  Future<SetSecurityQuestionResponse> setSecurityQuestionAns(body.SetSecurityQuestionBody setSecurityQuestionBody,String token) async{

    if (kDebugMode) {
      print(setSecurityQuestionAnsUrl);
    }

    try{
      Response response = await _dio.post(setSecurityQuestionAnsUrl,data: setSecurityQuestionBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return SetSecurityQuestionResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }



  Future<ResetSecurityQuestionResponse> getResetSecurityQuestion(ResetSecurityQuestionBody resetSecurityQuestionBody,String token) async{

    if (kDebugMode) {
      print(pinResetRequestUrl);
    }

    try{
      Response response = await _dio.post(pinResetRequestUrl,data: resetSecurityQuestionBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return ResetSecurityQuestionResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<AnsResetSecurityQuestionResponse> ansSecurityQuestionForReset(body.SetSecurityQuestionBody setSecurityQuestionBody,String token) async{

    if (kDebugMode) {
      print(answerSecurityQuestion);
    }

    try{
      Response response = await _dio.post(answerSecurityQuestion,data: setSecurityQuestionBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return AnsResetSecurityQuestionResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<ResetPinReponse> resetPin(ResetPinBody resetPinBody,String token) async{

    if (kDebugMode) {
      print(resetPinUrl);
    }

    try{
      Response response = await _dio.post(resetPinUrl,data: resetPinBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return ResetPinReponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<UpdatePinReponse> updatePin(UpdatePinBody updatePinBody,String token) async{

    if (kDebugMode) {
      print(updatePinUrl);
    }

    try{
      Response response = await _dio.post(updatePinUrl,data: updatePinBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return UpdatePinReponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<GetCustomerMenuResponse> getCustomerMenu(GetCustomerMenuBody getCustomerMenuBody,String token) async{

    if (kDebugMode) {
      print(getCustomerMenuUrl);
    }

    try{
      Response response = await _dio.post(getCustomerMenuUrl,data: getCustomerMenuBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return GetCustomerMenuResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<MerchantListTokenResponse> getMerchantListToken() async{
    if (kDebugMode) {
      print('getMerchantListTokenUrl $getMerchantListTokenUrl');
    }
    var params = {
      "password" : "06247d7693d7b30b08db4f7af6179454:dd33e21a1c1dd9f6b18da5a0cb3aa17a",
      "username" : "admin"
    };
    try{
      Response response = await _dio.post(getMerchantListTokenUrl, data: params,options: Options(headers: {'Content-Type':'application/json'},));
      return MerchantListTokenResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<MerchantListResponse> getMerchantList(String menuCode,String token) async{
    if (kDebugMode) {
      print(getMerchantListUrl);
    }
    var params = {
      "Menu_Code" : menuCode,
    };
    try{
      Response response = await _dio.post(getMerchantListUrl,data: params,options: Options(headers: {'Authorization':"Bearer "+token , 'Content-Type':'application/json'},));

      return MerchantListResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<CheckRefundResponse> checkRefundApi(CheckRefundBody checkRefundBody,String token) async{

    if (kDebugMode) {
      print(getRefundCheckUrl);
    }

    try{
      Response response = await _dio.post(getRefundCheckUrl,data: checkRefundBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return CheckRefundResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<TransactionRefundResponse> refundTransaction(String token,String transactionId) async{

    if (kDebugMode) {
      print(refundUrl);
    }

    try{
      Response response = await _dio.post(refundUrl,data: {
        "Transaction_ID": transactionId
      },options: Options(headers: {'Module':"JW9tc0ByZWRsdGQl",'Authorization':"Bearer "+token,'Content-Type':'application/json'},));
      return TransactionRefundResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<GetDowascoConfigResponse> getDowascoConfig(String token) async{

    if (kDebugMode) {
      print(getDowsacoConfigUrl);
    }

    try{
      Response response = await _dio.get(getDowsacoConfigUrl,options: Options(headers: {'Authorization':"Bearer "+token,'Content-Type':'application/json'},));
      return GetDowascoConfigResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<GetAccountDetailsResponse> getDowascoAccountDetails(String token,int accountNumber) async{

    if (kDebugMode) {
      print(getDowsacoAccountDetailsUrl);
      print(token);
    }

    try{
      Response response = await _dio.post(getDowsacoAccountDetailsUrl,
          data: {
              "account_no":accountNumber,
              "need_amount":true
          },
          options: Options(headers: {'Authorization':"Bearer "+token,'Content-Type':'application/json'},));
      return GetAccountDetailsResponse.fromJson(response.data);
    }catch(e){
      DialogHelper.hideLoading();
      Fluttertoast.showToast(
         backgroundColor: Colors.red,
          msg: "Account Number Not Valid",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<GetDowascoConfigResponse> getDigicelConfig(String token) async{

    if (kDebugMode) {
      print(getDigicelConfigUrl);
    }

    try{
      Response response = await _dio.get(getDigicelConfigUrl,options: Options(headers: {'Authorization':"Bearer "+token,'Content-Type':'application/json'},));
      return GetDowascoConfigResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }


  Future<GetDowascoConfigResponse> getFlowConfig(String token) async{

    if (kDebugMode) {
      print(getFlowConfigUrl);
    }

    try{
      Response response = await _dio.post(getFlowConfigUrl,options: Options(headers: {'Authorization':"Bearer "+token,'Content-Type':'application/json'},));
      return GetDowascoConfigResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }

  Future<CustomerRegistrationResponseModel> customerRegistration(CreateCustomerBody createCustomerBody,String token) async{

    if (kDebugMode) {
      print(getTransactionUrl);
    }

    try{
      Response response = await _dio.post(getTransactionUrl,data: createCustomerBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return CustomerRegistrationResponseModel.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }

  Future<GenerateOtpResponse> generateOtp(GenerateOtpBody generateOtpBody,String token) async{

    if (kDebugMode) {
      print(generateOtpUrl);
    }

    try{
      Response response = await _dio.post(generateOtpUrl,data: generateOtpBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return GenerateOtpResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }

  Future<ValidateCustomerOtpResponse> validateCustomerOtp(ValidateOtpCustomerBody validateOtpCustomerBody,String token) async{

    if (kDebugMode) {
      print(validateCustomerOtpUrl);
    }

    try{
      Response response = await _dio.post(validateCustomerOtpUrl,data: validateOtpCustomerBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return ValidateCustomerOtpResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }

  Future<UpdateCustomerResponse> updateCustomerKyc(KycUpdateBody kycUpdateBody,String token, String fontImage, String backImage ) async {
    if (kDebugMode) {
      print(updateCustomerKycByAgentUrl);

    }


    Map<String, String> headers = <String, String>{
      // 'Module': 'JW9tc0ByZWRsdGQl',
      "Content-Type": "multipart/form-data",
      // 'Content-Type': 'application/json',
      'Authorization': token,
    };
    final request = http.MultipartRequest("POST", Uri.parse(updateCustomerKycByAgentUrl));
    request.fields['Msisdn'] = '${kycUpdateBody.msisdn}';
    request.fields['FirstName'] = '${kycUpdateBody.firstName}';
    request.fields['LastName'] = '${kycUpdateBody.lastName}';
    request.fields['Email'] = '${kycUpdateBody.email}';
    request.fields['IdNumber'] = '${kycUpdateBody.idNumber}';
    request.fields['IdType'] = '${kycUpdateBody.idType}';
    request.fields['IdExpiryDate'] = '${kycUpdateBody.idExpiryDate}';
    request.fields['Dob'] = '${kycUpdateBody.dob}';
    request.fields['Nationality'] = '${kycUpdateBody.nationality}';
    request.fields['PermanentDistrict'] = '${kycUpdateBody.permanentDistrict}';
    request.fields['PermanentCity'] = '${kycUpdateBody.permanentCity}';
    request.fields['CustomerMsisdn'] = '${kycUpdateBody.customerMsisdn}';
    request.fields['Pin'] = '${kycUpdateBody.pin}';
    request.fields['Gender'] = '${kycUpdateBody.gender}';

    request.files.add(await http.MultipartFile.fromPath('frontIdImage', fontImage));
    request.files.add(await http.MultipartFile.fromPath('backIdImage', backImage));

    request.headers.addAll(headers);
    http.Response rootResponse = await http.Response.fromStream(
        await request.send());


    try{
      return UpdateCustomerResponse.fromJson(jsonDecode(rootResponse.body));
    }catch(e){
      return UpdateCustomerResponse.fromJson(jsonDecode(rootResponse.body));
    }

  }

  Future<GetProfileResponseModel> getCustomerProfile(GetCustomerProfileBody getCustomerProfileBody,String token) async{

    if (kDebugMode) {
      print(getCustomerProfileUrl);
    }

    try{
      Response response = await _dio.post(getCustomerProfileUrl,data: getCustomerProfileBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return GetProfileResponseModel.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }

  Future<UpdateCustomerValidateOtpResponse> updateCustomerValidateCustomerOtp(ValidateOtpCustomerBody validateOtpCustomerBody,String token) async{

    if (kDebugMode) {
      print(validateCustomerOtpUrl);
    }

    try{
      Response response = await _dio.post(validateCustomerOtpUrl,data: validateOtpCustomerBody.toJson(),options: Options(headers: {'Authorization':token,'Content-Type':'application/json'},));
      return UpdateCustomerValidateOtpResponse.fromJson(response.data);
    }catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      throw Exception('Failed to load jobs from API $e');
    }

  }



}

