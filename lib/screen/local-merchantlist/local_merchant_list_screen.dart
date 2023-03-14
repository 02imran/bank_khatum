import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/digicel/digicel_screen.dart';
import 'package:wallet_merchant/screen/flow/flow_screen.dart';
import '../../constants.dart';
import '../../global.dart';
import '../../model/response/dowasco/reponse/GetDowascoConfigResponse.dart';
import '../../repository/repository.dart';
import '../../shared_prefs_helper.dart';
import '../../size_config.dart';
import '../coming-soon/coming_soon_screen.dart';
import '../dowasco-list/dowasco_list_screen.dart';


class LocalMerchantListScreen extends StatelessWidget{
   LocalMerchantListScreen({Key? key}) : super(key: key);

  final AppRepository _appRepository=AppRepository();


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text("Merchant List"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(

          padding: const EdgeInsets.only(left: 10,right: 10),
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          color: stroke,
          child: Column(
            children: [
                      GestureDetector(
                        onTap: (){
                          SharedPrefsHelper.getServiceToken().then((token)async {
                            GetDowascoConfigResponse response= await  _appRepository.getDowascoConfig(token);
                            if(response.payload!.status! ==0){
                              Get.to(const DowascoListScreen());
                              dowascoMerchantName=response.payload!.merchentName!;
                              dowascoMerchantCode=response.payload!.merchentNumber!;
                            }
                            else{
                              Get.to(const ComingSoonScreen());
                            }
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)
                          ),

                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                child: ClipRRect(
                                  child: Image.asset("assets/images/ico_dowasco.jpeg"),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              const Text("DOMINICA-DOWASCO",style: TextStyle(fontSize: 16,color: Colors.black),)
                            ],
                          ),
                        ),
                      ),

                    GestureDetector(
                      onTap: (){

                        SharedPrefsHelper.getServiceToken().then((token)async {
                          GetDowascoConfigResponse response= await  _appRepository.getDigicelConfig(token);
                          if(response.payload!.status! ==0){
                            Get.to(const DigicellScreen());
                            digicelMerchantName=response.payload!.merchentName!;
                            digicelMerchantCode=response.payload!.merchentNumber!;
                          }
                          else{
                            Get.to(const ComingSoonScreen());
                          }
                        });

                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              child: ClipRRect(
                                child: Image.asset("assets/images/ico_digicel.jpeg"),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            const SizedBox(width: 15,),
                            const Text("Digicel",style: TextStyle(fontSize: 16,color: Colors.black),)
                          ],
                        ),
                      ),
                    ),



                    GestureDetector(
                      onTap: (){


                        SharedPrefsHelper.getServiceToken().then((token)async {
                          GetDowascoConfigResponse response= await  _appRepository.getFlowConfig(token);
                          if(response.payload!.status! ==0){
                            Get.to(const FlowScreen());
                            flowMerchantName=response.payload!.merchentName!;
                            flowMerchantCode=response.payload!.merchentNumber!;
                          }
                          else{
                            Get.to(const ComingSoonScreen());
                          }
                        });

                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              child: ClipRRect(
                                child: Image.asset("assets/images/ico_flow.jpeg"),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            const SizedBox(width: 15,),
                            const Text("Flow",style: TextStyle(fontSize: 16,color: Colors.black),)
                          ],
                        ),
                      ),
                    ),


                    GestureDetector(
                      onTap: (){
                        Get.to(const ComingSoonScreen());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              child: ClipRRect(
                                child: Image.asset("assets/images/ico_electricity.jpeg"),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            const SizedBox(width: 15,),
                            const Text("DOMINICA-DOMLEC",style: TextStyle(fontSize: 16,color: Colors.black),)
                          ],
                        ),
                      ),
                    )


          ],
        ),
      ),



    ));
  }



}