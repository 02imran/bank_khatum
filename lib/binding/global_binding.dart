import 'package:get/get.dart';
import 'package:wallet_merchant/screen/agent-merchant-cashout/controller/aget_merchant_cashout_controller.dart';
import 'package:wallet_merchant/screen/balance-transfer/controller/balance_transfer_controller.dart';
import 'package:wallet_merchant/screen/balance/controller/balance_controller.dart';
import 'package:wallet_merchant/screen/create-agent/controller/create_agent_controller.dart';
import 'package:wallet_merchant/screen/dashboard/controller/dashboard_controller.dart';
import 'package:wallet_merchant/screen/distributor-cashout/controller/distributor_cash_out_controller.dart';
import 'package:wallet_merchant/screen/get-payment/controller/get_payment_controller.dart';
import 'package:wallet_merchant/screen/login/controller/login_controller.dart';
import 'package:wallet_merchant/screen/merchant-cashout/controller/merchant_cashout_controller.dart';
import 'package:wallet_merchant/screen/my-message/controller/my_message_controller.dart';
import 'package:wallet_merchant/screen/my-qr-code/controller/my_qr_code_controller.dart';
import 'package:wallet_merchant/screen/otp/controller/otp_controller.dart';
import 'package:wallet_merchant/screen/reset-security-question/controller/reset_security_question_controller.dart';
import 'package:wallet_merchant/screen/security-question/controller/security_question_controller.dart';
import 'package:wallet_merchant/screen/set-pin/controller/set_pin_controller.dart';
import 'package:wallet_merchant/screen/success/controller/success_controller.dart';
import 'package:wallet_merchant/screen/transaction-history/controller/transaction_controller.dart';
import 'package:wallet_merchant/screen/transaction-overview/controller/overview_controller.dart';
import 'package:wallet_merchant/screen/update-pin/controller/update_pin_controller.dart';

import '../screen/add-dowasco/controller/add_dowasco_controller.dart';
import '../screen/create-customer/controller/create_customer_controller.dart';
import '../screen/digicel/digicel_controller/digicel_controller.dart';
import '../screen/dowasco-accountdetails/success/controller/dowasco_details_controller.dart';
import '../screen/dowasco-list/controller/dowasco_list_controller.dart';
import '../screen/dynamic-merchantlist/controller/dynamic_merchant_list_controller.dart';
import '../screen/flow/controller/flow_controller.dart';
import '../screen/merchant-payment-dowasco_other/controller/merchant_payment_dowasco_other_controller.dart';
import '../screen/merchant-payment/controller/merchant_payment_controller.dart';
import '../screen/redeem_points/controller/redeem_points_controller.dart';
import '../screen/refund-overview/controller/refund_overview_controller.dart';
import '../screen/topup/controller/cash_in_controller.dart';
import '../screen/update_customer/controller/update_customer_controller.dart';

class GlobalBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
          () => LoginController(),
    );

    Get.lazyPut<OtpController>(
          () => OtpController(),
    );

    Get.lazyPut<DashboardController>(
          () => DashboardController(),
    );

    Get.lazyPut<MerchantCashOutController>(
          () => MerchantCashOutController(),
    );

    Get.lazyPut<TransactionOverviewController>(
          () => TransactionOverviewController(),
    );

    Get.lazyPut<RedeemPointsController>(
          () => RedeemPointsController(),
      fenix: true
    );

    Get.lazyPut<SuccessController>(
          () => SuccessController(),
    );

    Get.lazyPut<GetPaymentController>(
          () => GetPaymentController(),
    );

    Get.lazyPut<TransactionController>(
          () => TransactionController(),
    );

    Get.lazyPut<BalanceController>(
          () => BalanceController(),
    );

    Get.lazyPut<CashInController>(
          () => CashInController(),
    );

    Get.lazyPut<AgentMerchantCashOutController>(
          () => AgentMerchantCashOutController(),
    );
    Get.lazyPut<CreateAgentController>(
          () => CreateAgentController(),
    );

    Get.lazyPut<BalanceTransferController>(
          () => BalanceTransferController(),
    );

    Get.lazyPut<DistributorCashOutController>(
          () => DistributorCashOutController(),
    );

    Get.lazyPut<MyQrCodeController>(
          () => MyQrCodeController(),
    );

    Get.lazyPut<MyMessageController>(
          () => MyMessageController(),
    );

    Get.lazyPut<SecurityQuestionController>(
          () => SecurityQuestionController(),
    );

    Get.lazyPut<ResetSecurityQuestionController>(
          () => ResetSecurityQuestionController(),
    );

    Get.lazyPut<SetPinController>(
          () => SetPinController(),
    );
    Get.lazyPut<UpdatePinController>(
          () => UpdatePinController(),
    );

    Get.lazyPut<DynamicMerchantListController>(
          () => DynamicMerchantListController(),
    );

    Get.lazyPut<MerchantPaymentController>(
          () => MerchantPaymentController(),
    );

    Get.lazyPut<RefundOverviewController>(
          () => RefundOverviewController(),
    );

    Get.lazyPut<DowascoListScreenController>(
          () => DowascoListScreenController(),
    );

    Get.lazyPut<AddDowascoController>(
          () => AddDowascoController(),
    );

    Get.lazyPut<MerchantPaymentDowascoOtherController>(
          () => MerchantPaymentDowascoOtherController(),
    );

    Get.lazyPut<DowascoDetailsController>(
          () => DowascoDetailsController(),
    );

    Get.lazyPut<DigicelController>(
          () => DigicelController(),
    );

    Get.lazyPut<FlowController>(
          () => FlowController(),
    );
    Get.lazyPut<UpdateCustomerController>(
          () => UpdateCustomerController(),
    );
    Get.lazyPut<CreateCustomerController>(
          () => CreateCustomerController(),
    );

  }

}