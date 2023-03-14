import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/constants.dart';
import 'package:wallet_merchant/model/PushNotification.dart';
import 'package:wallet_merchant/screen/dashboard/dashboard.dart';
import 'package:wallet_merchant/screen/login/login_screen.dart';
import 'package:wallet_merchant/stream/NotificationBloc.dart';
import '../../shared_prefs_helper.dart';
import '../../size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _StateMySplashScreen();
  }


}

class _StateMySplashScreen extends State<MySplashScreen> {

  late final FirebaseMessaging _messaging;
  late int _totalNotifications;
  PushNotification? _notificationInfo;


  void registerNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    _messaging.getToken().then((value) {
      if (kDebugMode) {
        print('Fcm::'+value!);
      }
      SharedPrefsHelper.storeFcmToken(value!);


    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');


      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print(
            'Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');

        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
          dataTitle: message.data['title'],
          dataBody: message.data['body'],
        );
        notificationBloc.notification(notification);


      });
    } else {
      print('User declined or has not accepted permission');
    }
  }


  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
        dataTitle: initialMessage.data['title'],
        dataBody: initialMessage.data['body'],
      );

      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    }
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    registerNotification();
    checkForInitialMessage();

    // For handling notification when the app is in background
    // but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );

      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    });


    Timer(const Duration(seconds: 3), () async {



      SharedPrefsHelper.getBasicToken().then((token)  {
        if(token.isEmpty){
          Get.offAll(const LoginScreen());
        }else{
          Get.offAll(const Dashboard());
        }
      });

      if( _notificationInfo != null){
       //will be go notification page
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSplashBackground,
      body: Center(
        child: Image.asset('assets/icons/Bank_Of_Khartoum.png',
        width: getProportionateScreenWidth(300),
        height: getProportionateScreenHeight(150),
        ),
      ),
    );


    //   Container(
    //   decoration: const BoxDecoration(
    //       image: DecorationImage(
    //         image:AssetImage("assets/images/ic_splash_mlajan_bg.png"),
    //         fit: BoxFit.cover,
    //       )
    //   ),
    // );
  }

}

class NotificationBadge extends StatelessWidget {
  final int totalNotifications;


  const NotificationBadge({required this.totalNotifications});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$totalNotifications',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
