import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// positional optional parameter
toastInfo([String msg = '']) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    fontSize: 16,
  );
}