import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

Widget appOnboardingPage({
  String imagePath = 'assets/images/reading.png',
  String title = '',
  String subTitle = '',
}) {
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        child: text24Normal(
          text: title,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: text16Normal(
          text: subTitle,
        ),
      ),
      _nextButton(),
    ],
  );
}

Widget _nextButton() {
  return Container(
    width: 325,
    height: 50,
    // color: Colors.blue,
    margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
    decoration: appBoxShadow(),
    child: text16Normal(
      text: 'next',
      color: Colors.white,
    ),
  );
}
