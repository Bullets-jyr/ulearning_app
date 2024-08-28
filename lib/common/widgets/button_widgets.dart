import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

Widget appButton({
  double width = 325,
  double height = 50,
  String buttonName = '',
  bool isLogin = true,
}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: width,
      height: height,
      // isLogin true then send primary color else send white color
      decoration: appBoxShadow(
        color: isLogin ? AppColors.primaryElement : Colors.white,
      ),
      child: Center(
        child: text16Normal(
          text: buttonName,
          color: isLogin ? AppColors.primaryBackground : AppColors.primaryText,
        ),
      ),
    ),
  );
}
