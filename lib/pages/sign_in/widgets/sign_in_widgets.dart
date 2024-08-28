import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

/*
  preferredSize widget gives you a height or space from the appbar downwords and we can
  put child in the given space
 */
AppBar buildAppBar() {
  return AppBar(
    // backgroundColor: Colors.white,
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
    onTap: () {},
    child: SizedBox(
      width: 40,
      height: 40,
      child: Image.asset(
        imagePath,
      ),
    ),
  );
}

Widget appTextField({
  String text = '',
  String iconName = '',
  String hintText = 'Type in your info',
  bool obscureText = false,
}) {
  return Container(
    padding: EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(
          text: text,
        ),
        SizedBox(height: 5,),
        Container(
          width: 325,
          height: 50,
          // color: Colors.red,
          decoration: appBoxDecorationTextField(),
          // row contains icon and textfield
          child: Row(
            children: [
              // for showing icons
              Container(
                margin: EdgeInsets.only(left: 17),
                child: appImage(imagePath: iconName),
              ),
              // our textfield
              Container(
                width: 280,
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    // default border without any input
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                  maxLines: 1,
                  autocorrect: false,
                  // by default it's false
                  obscureText: obscureText,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
