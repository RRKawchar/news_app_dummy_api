import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app_dummy_api/config/colors.dart';

successMessage(String message)=> Fluttertoast.showToast(
  msg: message,
  fontSize: 16.0,
  toastLength: Toast.LENGTH_SHORT,
  timeInSecForIosWeb: 1,
  backgroundColor: greenColor,
  textColor: Colors.white,
  gravity: ToastGravity.TOP,

);



errorMessage(String message)=> Fluttertoast.showToast(
  msg: message,
  fontSize: 16.0,
  toastLength: Toast.LENGTH_SHORT,
  timeInSecForIosWeb: 1,
  backgroundColor: darkPrimaryColor,
  textColor: Colors.white,
  gravity: ToastGravity.TOP,

);