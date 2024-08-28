import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.red,
        height: 1,
      ),
    ),
    title: text16Normal(
      text: 'Login',
      color: AppColors.primaryText,
    ),
  );
}
