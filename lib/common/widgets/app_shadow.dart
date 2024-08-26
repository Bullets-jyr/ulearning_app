import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
}) {
  return BoxDecoration(
    color: color,
    // color: Colors.transparent,
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: sR,
        blurRadius: bR,
        offset: Offset(0, 1),
      ),
    ],
  );
}
