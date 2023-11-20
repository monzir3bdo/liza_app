import 'package:flutter/material.dart';
import 'package:get/get.dart';

getSnackBar(
    {required String message,
    Color color = Colors.blue,
    int seconds = 1,
    Widget icon = const Text('')}) {
  Get.showSnackbar(GetSnackBar(
    icon: icon,
    message: message,
    backgroundColor: color,
    duration: Duration(seconds: seconds),
  ));
}
