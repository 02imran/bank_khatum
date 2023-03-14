import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wallet_merchant/screen/dashboard/dashboard.dart';
import 'package:wallet_merchant/screen/update_customer/components/update_customer_district.dart';
import 'package:wallet_merchant/screen/update_customer/components/update_customer_document_number.dart';
import 'package:wallet_merchant/screen/update_customer/components/update_customer_legal_identification.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'components/update_customer_city.dart';
import 'components/update_customer_dob_field.dart';
import 'components/update_customer_email_address.dart';
import 'components/update_customer_expiration_date.dart';
import 'components/update_customer_first_name_field.dart';
import 'components/update_customer_gender_drop_down.dart';
import 'components/update_customer_last_name_field.dart';
import 'components/update_customer_nationality.dart';
import 'components/update_customer_nid_upload.dart';
import 'components/update_customer_phone.dart';
import 'components/update_customer_phone_new.dart';
import 'controller/update_customer_controller.dart';

class UpdateCustomerFormField extends GetView<UpdateCustomerController> {
  const UpdateCustomerFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<UpdateCustomerController>(
      () => UpdateCustomerController(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        title: const Text(
          "UPDATE CUSTOMER INFORMATION",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: controller.updateCustomerFormKey,
          child: ListView(
            children: [
              SizedBox(height: getProportionateScreenHeight(30)),
              customName('MOBILE NUMBER'),
              SizedBox(height: getProportionateScreenHeight(20)),
              const BuildPhoneCodeFormFieldUpdateCustomerNew(),
              SizedBox(height: getProportionateScreenHeight(30)),
              customName('FIRST NAME'),
              SizedBox(height: getProportionateScreenHeight(20)),
              const UpdateCustomerFirstNameField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              customName('LAST NAME'),
              SizedBox(height: getProportionateScreenHeight(20)),
              const UpdateCustomerLastNameField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              customName('GENDER'),
              SizedBox(height: getProportionateScreenHeight(20)),
              const UpdateCustomerGenderDropDown(),
              SizedBox(height: getProportionateScreenHeight(30)),
              customName('DATE OF BIRTH'),
              SizedBox(height: getProportionateScreenHeight(20)),
              const UpdateCustomerDateOfBirthField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              customName('NATIONALITY'),
              SizedBox(height: getProportionateScreenHeight(20)),
              const UpdateCustomerNationality(),
              SizedBox(height: getProportionateScreenHeight(30)),
              customName('CITY'),
              SizedBox(height: getProportionateScreenHeight(20)),
              const UpdateCustomerCity(),
              SizedBox(height: getProportionateScreenHeight(30)),
              customName('DISTRICT/KHAN'),
              SizedBox(height: getProportionateScreenHeight(20)),
              Obx(
                () => controller.filterDistrictList.value.isNotEmpty
                    ? const UpdateCustomerDistrict()
                    : Container(
                  padding:  EdgeInsets.only(left: getProportionateScreenHeight(15), right: getProportionateScreenWidth(30)),
                        width: SizeConfig.screenWidth! * 30,
                        height: getProportionateScreenHeight(60),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const[
                      Text('Select Your District'),
                      Icon(Icons.arrow_drop_down, color: Colors.black54,)
                    ],
                  ),
                      ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              customName('LEGAL IDENTIFICATION TYPE'),
              SizedBox(height: getProportionateScreenHeight(20)),
              const UpdateCustomerLegalIdentification(),
              SizedBox(height: getProportionateScreenHeight(30)),
              customName('DOCUMENT NUMBER'),
              SizedBox(height: getProportionateScreenHeight(20)),
              const UpdateCustomerDocumentNumber(),
              SizedBox(height: getProportionateScreenHeight(30)),
              const UpdateCustomerNidUpload(),
              SizedBox(height: getProportionateScreenHeight(30)),
              const UpdateCustomerExpirationDate(),
              SizedBox(height: getProportionateScreenHeight(30)),
              RichText(
                text: const TextSpan(
                  text: 'EMAIL',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              const UpdateCustomerEmailField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.offAll(()=> const Dashboard());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      height: getProportionateScreenWidth(35),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFFEEB000)),
                      child: const Center(
                          child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      controller.updateKycCustomer(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      height: getProportionateScreenWidth(35),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFF8464BA)),
                      child: const Center(
                          child: Text(
                        'Request',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
            ],
          ),
        ),
      ),
    );
  }

  Widget customName(String title) {
    return RichText(
              text:  TextSpan(
                text: title,
                style:const TextStyle(fontSize: 16, color: Colors.black),
                children: const <TextSpan>[
                   TextSpan(
                      text: '*', style: TextStyle(color: kColorPrimary))
                ],
              ),
            );
  }

}
