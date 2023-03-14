import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/body/create-agent/CreateAgentBody.dart';
import 'package:wallet_merchant/model/body/create-agent/vat/VatSettingBody.dart';
import 'package:wallet_merchant/model/response/create-agent/CreateAgentResponse.dart';
import 'package:wallet_merchant/model/response/create-agent/vat/VatSettingsResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';
import 'package:wallet_merchant/screen/create-agent-success/create_agent_success.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../constants.dart';
import '../../../model/body/agent_update_body/AgentUpdateBody.dart';
import '../../../model/response/create_agent_update_response/CreateAgentUpdateResponse.dart';
import '../../../shared_prefs_helper.dart';
import '../../../size_config.dart';
import '../../dashboard/component/agent_wallet_type/models/AgentServiceListBody.dart';
import '../../dashboard/component/agent_wallet_type/models/AgentServiceListResponseModel.dart';
import '../../dashboard/component/agent_wallet_type/models/AgentWalletTypeResponseModel.dart';
import '../../dashboard/controller/dashboard_controller.dart';

class CreateAgentController extends GetxController with StateMixin{

  GlobalKey<FormState> agentFromKey = GlobalKey<FormState>();

  final dashboardController = Get.find<DashboardController>();


  late TextEditingController nameController;
  var name = '';

  late TextEditingController phoneController;
  var phone = '';

  late TextEditingController licenseController;
  var license = '';

  var chosenValueVatSettingLicensed = VatSettingLicensed(id: "").obs;


  final AppRepository _appRepository=AppRepository();


  var apiResponse=VatSettingsResponse(vatSettingLicensed: [],vatSettingNonLicensed: []).obs;

  late TextEditingController pinController;
  Rx<WalletTypePayload> walletTypeSelect = WalletTypePayload().obs;

  RxList<AgentServicePayload> getAgentList = <AgentServicePayload>[].obs;
  Rx<AgentServicePayload> agentServiceListSelect = AgentServicePayload().obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    licenseController = TextEditingController();
    pinController = TextEditingController();
    walletTypeSelect.value = dashboardController.hierarchyWalletType[0];
    getAgentServiceList();


    SharedPrefsHelper.getMsisdn().then((msisdn) =>
    {
      SharedPrefsHelper.getBasicToken().then((token) async {

        DialogHelper.showLoading("Please Wait");

        var body=VatSettingBody(msisdn: msisdn);
        VatSettingsResponse  response= await _appRepository.getVatSettings(body,token);
        if(response.vatSettingLicensed!.isNotEmpty){
          DialogHelper.hideLoading();
          apiResponse.value=response;
          chosenValueVatSettingLicensed.value=response.vatSettingLicensed![0];
        }else{
          DialogHelper.hideLoading();
        }

      })
    });

  }

  String? validateName(String value) {
    if (value.length < 3) {
      return "Name not valid";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.length < 8) {
      return "Phone number  not valid";
    }
    return null;
  }


  String? validateLicense(String value) {
    if (value.length < 2) {
      return "License  not valid";
    }
    return null;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameController.dispose();
    phoneController.dispose();
    licenseController.dispose();
    pinController.dispose();
  }


  submit(BuildContext context){

    final isValid = agentFromKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    agentFromKey.currentState!.save();
    _displayDialog(context);

  }
  _displayDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
            body:SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      color: kColorPrimary,
                      width: SizeConfig.screenWidth,
                      height: getProportionateScreenHeight(55),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Create Agent",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: const Center(
                        child: Text(
                            "Enter your 4 digit Agent PIN in order to confirm your transaction",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(70),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: TextFormField(
                          obscureText: true,
                          textAlign: TextAlign.center,
                          controller: pinController,
                          style: const TextStyle(color: kTextColor, fontSize: 25,letterSpacing: 40.0),
                          autofocus: true,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: false, decimal: false),
                          maxLength: 4,
                          decoration: const InputDecoration(
                            counterText: "",
                            labelText: "",
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
                        )
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(60),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            pinController.text="";

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
                            if(pinController.text.length==4){
                              print("Output::"+pinController.text);
                              Navigator.of(context).pop();
                              FocusScope.of(context).requestFocus(FocusNode());

                              createAgent(pinController.text);

                            }else{
                              Fluttertoast.showToast(
                                  msg: "Pin must be 4 digit",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM);
                            }

                          },
                          child: Container(
                            width: getProportionateScreenWidth(140),
                            height: getProportionateScreenHeight(50),
                            margin: const EdgeInsets.only(left: 5,right: 5),
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: kButtonColor
                            ),
                            child: const Center(child: Center(child:Text("Confirm",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                          ),
                        )
                      ],
                    )

                  ],
                ),
              ),
            ));
      },
    );
  }


  createAgent(String pin){

    SharedPrefsHelper.getMsisdn().then((msisdn) =>
    {
      SharedPrefsHelper.getBasicToken().then((token) async {

        DialogHelper.showLoading("Please Wait");

        var createAgentBody=CreateAgentBody( msisdn: msisdn,messageBody: "REGA "+mobilePrefix+phone+" "+license+" "+chosenValueVatSettingLicensed.value.id!+" "+name.replaceAll(" ", "-")+" "+pinController.text );
        print("Body::"+createAgentBody.toJson().toString());
        DialogHelper.showLoading("Please Wait");
        CreateAgentResponse  response= await _appRepository.createAgent(createAgentBody,token);
        print("Response::"+response.toJson().toString());
        if(response.responseCode==100){
          pinController.text="";
          DialogHelper.hideLoading();
          getAgentUpdate();

         // Get.to(const CreateAgentSuccess(),arguments: [name,phone]);

        }else{
          pinController.text="";
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

  getAgentServiceList() async{
    SharedPrefsHelper.getMsisdn().then((msisdn) => {
      getOs().then((os) async {
        AgentServiceListBody body = AgentServiceListBody(
          msisdn: int.parse(msisdn),
          walletId: walletTypeSelect.value.walletId
        );
        print('Body ::::::::: ${body.toJson().toString()}');
        DialogHelper.showLoading("Please Wait");
        agentServiceListSelect = AgentServicePayload().obs;
        AgentServiceListResponseModel response = await _appRepository.getAgentServiceList(body);
        print("Response::" + response.toString());
        if (response.statusCode == 200) {
          DialogHelper.hideLoading();

          getAgentList.value = response.payload ?? [];
          if(getAgentList.isNotEmpty){
            agentServiceListSelect.value = getAgentList[0];
          }


        } else {
          DialogHelper.hideLoading();
          Fluttertoast.showToast(
              backgroundColor: Colors.red,
              msg: response.message!,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM);
        }
      })
    });
  }

  getAgentUpdate()async{

    SharedPrefsHelper.getMsisdn().then((msisdn) =>
    {
      SharedPrefsHelper.getBasicToken().then((token)  async{

        DialogHelper.showLoading("Please Wait");
        AgentUpdateBody body;
        // Future.delayed(const Duration(seconds: 5),()async{
         if(agentServiceListSelect.value.msisdn == null){
           body = AgentUpdateBody(
               walletType: walletTypeSelect.value.walletId,
               msisdn: int.parse('1'+phoneController.text)
           );
         }else{
           body = AgentUpdateBody(
               walletType: walletTypeSelect.value.walletId,
               parentmsisdn: int.parse(agentServiceListSelect.value.msisdn?? '0'),
               msisdn: int.parse('1'+phoneController.text)
           );
         }


          print('Body :: ${body.toJson()}');
          DialogHelper.showLoading("Please Wait");
          CreateAgentUpdateResponse  response= await _appRepository.getAgentUpdate(body);
          print("Response::"+response.toJson().toString());
          if(response.issuccess==true){
            pinController.text="";
            DialogHelper.hideLoading();
            Get.to(const CreateAgentSuccess(),arguments: [name,phone]);
          }else{
            pinController.text="";
            DialogHelper.hideLoading();
            Fluttertoast.showToast(
                backgroundColor: Colors.red,
                msg: response.message!,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM);
          }
        // });

      })
    });


  }



}