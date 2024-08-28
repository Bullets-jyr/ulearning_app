import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

/*
  preferredSize widget gives you a height or space from the appbar downwords and we can
  put child in the given space
 */
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

Widget thirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(left: 80, right: 80, top: 40, bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton('assets/icons/google.png'),
        _loginButton('assets/icons/apple.png'),
        _loginButton('assets/icons/facebook.png'),
      ],
    ),
  );
}

Widget _loginButton(
  String imagePath,
) {
  return GestureDetector(
    onTap: () {

    },
    child: SizedBox(
      width: 40,
      height: 40,
      child: Image.asset(
        imagePath,
      ),
    ),
  );
}
