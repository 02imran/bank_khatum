import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../DialogHelper.dart';
import '../../../model/hive/dowasco_account_model.dart';
import '../../../model/response/dowasco/reponse/GetAccountDetailsResponse.dart';
import '../../../repository/repository.dart';
import '../../../shared_prefs_helper.dart';
import '../../dowasco-list/controller/dowasco_list_controller.dart';

class AddDowascoController extends  GetxController with StateMixin{

  final GlobalKey<FormState> addDowascoFromKey = GlobalKey<FormState>();

  late TextEditingController dowascoAccountController;
  var dowascoAccount = '';

  late TextEditingController nameController;
  var name = '';

  final AppRepository _appRepository=AppRepository();


  final dowascoListScreenController=Get.find<DowascoListScreenController>();



  @override
  void onInit() {
    super.onInit();
    dowascoAccountController = TextEditingController();
    nameController = TextEditingController();
  }

  String? validateAccountNumber(String value) {
    if (value.length < 4) {
      return "Account Number not valid";
    }
    return null;
  }

  String? validateName(String value) {
    if (value.length < 1) {
      return "Name not valid";
    }
    return null;
  }


  checkAccountDetails(BuildContext context) {
    final isValid = addDowascoFromKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    addDowascoFromKey.currentState!.save();
    fetchAccountDetailsApi();

  }



  fetchAccountDetailsApi(){

    SharedPrefsHelper.getServiceToken().then((token)async {

      DialogHelper.showLoading("Please Wait");
      GetAccountDetailsResponse  response= await _appRepository.getDowascoAccountDetails(token,int.parse(dowascoAccount));
      print("Response::"+response.toJson().toString());
      if(response.issuccess==true){
        DialogHelper.hideLoading();
        final box = await Hive.openBox<DowascoAccountModel>('dowascoAccount');

        List<DowascoAccountModel> modelList =box.values.toList();
        List<DowascoAccountModel> modelListSearch=modelList.where((element) => element.accountNumber==dowascoAccount).toList();
          if(modelListSearch.isNotEmpty){
            Fluttertoast.showToast(
                backgroundColor: Colors.red,
                msg: "Account Already Added",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM);

          }else{
            Get.back();
            box.add(DowascoAccountModel(accountNumber: dowascoAccount, tittle: name));
            dowascoListScreenController.getDowascoAccounts();

          }



      }else{
        DialogHelper.hideLoading();
        Fluttertoast.showToast(
            backgroundColor: Colors.red,
            msg: "Account Number Not Valid",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      }

    });
  }


  @override
  void onClose() {
    super.onClose();
    dowascoAccountController.dispose();
    nameController.dispose();
  }

}