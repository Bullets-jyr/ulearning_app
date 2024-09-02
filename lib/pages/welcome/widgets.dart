import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/global.dart';

class AppOnboardingPage extends StatelessWidget {
  final PageController controller;
  final String imagePath;
  final String title;
  final String subTitle;
  final int index;
  final BuildContext context;

  const AppOnboardingPage({
    super.key,
    required this.controller,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.index,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
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
        _nextButton(
          index,
          controller,
          context,
        ),
      ],
    );
  }
}

Widget appOnboardingPage(
  PageController controller,
  BuildContext context, {
  String imagePath = 'assets/images/reading.png',
  String title = '',
  String subTitle = '',
  int index = 0,
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
      _nextButton(
        index,
        controller,
        context,
      ),
    ],
  );
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      } else {
        // remember if we are first time or not
        Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);

        Navigator.pushNamed(
          context,
          '/signIn',
        );
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (BuildContext context) => const SignIn(),
        //   ),
        // );
      }
    },
    child: Container(
      width: 325,
      height: 50,
      // color: Colors.blue,
      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(
        child: text16Normal(
          text: index < 3 ? 'next' : 'Get Started',
          color: Colors.white,
        ),
      ),
    ),
  );
}
