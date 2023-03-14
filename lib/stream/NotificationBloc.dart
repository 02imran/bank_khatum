
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:wallet_merchant/model/PushNotification.dart';
import 'package:wallet_merchant/screen/splash/splash_screen.dart';

import '../constants.dart';
import 'package:rxdart/rxdart.dart';

class NotificationBloc{

  final BehaviorSubject<PushNotification> _subject = BehaviorSubject<PushNotification>();

  notification(PushNotification pushNotification) async {
    _subject.sink.add(pushNotification);
    showSimpleNotification(
        Text(pushNotification.title!.isNotEmpty?pushNotification.title!:pushNotification.dataTitle!),
        leading: NotificationBadge(totalNotifications: 1),
        subtitle: Text(pushNotification.body!.isNotEmpty?pushNotification.body!:pushNotification.dataBody!),
        background: kColorPrimary,
        autoDismiss: false,
        slideDismiss: true,
        slideDismissDirection: DismissDirection.startToEnd
    );
  }
  dispose() {
    _subject.close();
  }

  BehaviorSubject<PushNotification> get subject => _subject;

}

final notificationBloc = NotificationBloc();
