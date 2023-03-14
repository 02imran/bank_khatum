import 'package:flutter/material.dart';
import 'package:wallet_merchant/constants.dart';

class BaseAlertDialog extends StatelessWidget {

  //When creating please recheck 'context' if there is an error!

  final Color _color = kColorPrimary;

  String? _title;
  String? _content;
  String? _yes;
  String? _no;
  Function? _yesOnPressed;
  Function? _noOnPressed;

  BaseAlertDialog({Key? key, required String title, required String content, required Function yesOnPressed, required Function noOnPressed, String yes = "Yes", String no = "No"}) : super(key: key){
    _title = title;
    _content = content;
    _yesOnPressed = yesOnPressed;
    _noOnPressed = noOnPressed;
    _yes = yes;
    _no = no;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title!,style: const TextStyle(color: Colors.white),),
      content: Text(_content!,style: const TextStyle(color: Colors.white)),
      backgroundColor: _color,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actions: <Widget>[
        TextButton(
          child: Text(_yes!),
          // textColor: Colors.white,
          onPressed: () {
            _yesOnPressed!();
          },
        ),
        TextButton(
          child: Text(_no!),
          // textColor: Colors.redAccent,
          onPressed: () {
            _noOnPressed!();
          },
        ),
      ],
    );
  }
}