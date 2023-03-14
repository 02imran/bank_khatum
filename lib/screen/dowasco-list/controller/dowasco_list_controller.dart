import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../model/hive/dowasco_account_model.dart';
import '../../../model/response/merchant-list-response/MerchantListResponse.dart';
import '../../../model/response/merchant-list-token-response/MerchantListTokenResponse.dart';
import '../../../repository/repository.dart';
import '../../../shared_prefs_helper.dart';
class DowascoListScreenController extends  GetxController with StateMixin{


  RxList<DowascoAccountModel> listModel=<DowascoAccountModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getDowascoAccounts();
  }

  void getDowascoAccounts() async {
    final box = await Hive.openBox<DowascoAccountModel>('dowascoAccount');
    listModel.value = box.values.toList();

  }

  @override
  void onClose() {
    super.onClose();
  }

}