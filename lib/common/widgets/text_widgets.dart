import 'package:flutter/material.dart';

Widget text24Normal({String text = ''}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: Colors.blue,
      fontSize: 24,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget text16Normal({String text = ''}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: Colors.blue,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  );
}
