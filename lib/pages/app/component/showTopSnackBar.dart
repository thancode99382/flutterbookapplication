import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ShowTopSnackBar{

  void snackBar({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String message
  })=> Flushbar(

    icon: Icon(icon,size: 32,color: Colors.white,),
    shouldIconPulse: false,
    title: title,
    message: message,
    duration: const Duration(seconds:2),
    flushbarPosition: FlushbarPosition.TOP,
borderRadius: const BorderRadius.all(Radius.circular(16)),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    barBlur: 20,
    backgroundColor: Colors.black.withOpacity(0.5),
  )..show(context);


}