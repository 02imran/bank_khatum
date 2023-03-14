import 'package:flutter/material.dart';

import '../constants.dart';


class LoadingWidget{

  static Widget buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 45.0,
              width: 45.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                strokeWidth: 4.0,
              ),
            )
          ],
        ));
  }
}