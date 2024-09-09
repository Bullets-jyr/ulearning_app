import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/global.dart';

Widget userName() {
  return Container(
    child: text24Normal(
      text: Global.storageService
          .getUserProfile()
          .name!,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget helloText() {
  return Container(
    child: text24Normal(
      text: 'Hello, ',
      color: AppColors.primaryThirdElementText,
      fontWeight: FontWeight.bold,
    ),
  );
}
