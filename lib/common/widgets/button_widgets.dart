import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';

Widget appButton({
  double width = 325,
  double height = 50,
  String buttonName = '',
  bool isLogin = true,
  BuildContext? context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: buildAppBar(),
            body: Container(
              color: Colors.white,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      );
    },
    child: Container(
      width: width,
      height: height,
      // isLogin true then send primary color else send white color
      decoration: appBoxShadow(
        color: isLogin ? AppColors.primaryElement : Colors.white,
        border: Border.all(
          color: AppColors.primaryFourthElementText,
        ),
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
