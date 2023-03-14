import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';

class ComingSoonScreen extends StatelessWidget{
  const ComingSoonScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        title: const Text("Coming Soon",style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset("assets/images/update_logo.png",height: 150,width: 150,),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            const Text("Coming Soon",style: TextStyle(color: kColorPrimary,fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            const Text("This Feature Under Development",style: TextStyle(color: kColorPrimary,fontSize: 15,fontWeight: FontWeight.bold),),


          ],
        ),
      ),
    );
  }






}