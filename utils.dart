import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  //error message show krega
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.bounceIn,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        flushbarPosition: FlushbarPosition.TOP,
        message: message,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      )..show(context),
    );
  }

//snakbar show
  static snakBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      message,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    )));
  }

  //textfiels pe auto focus krane ke liye

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
     current.unfocus();
     FocusScope.of(context).requestFocus(nextFocus);
  }
}
