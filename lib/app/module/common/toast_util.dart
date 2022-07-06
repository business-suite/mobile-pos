import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../res/colors.dart';

class ToastUtil {
  static void showToast(String msg,
      {Color color = kColorA6000000,
      int timeInSecForIos = 1,
      Toast toastLength = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
        msg: '$msg',
        toastLength: toastLength,
        timeInSecForIosWeb: timeInSecForIos,
        backgroundColor: color);
  }

  void successToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      textColor: Colors.white,
      backgroundColor: Colors.blue,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void errorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      textColor: Colors.white,
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
