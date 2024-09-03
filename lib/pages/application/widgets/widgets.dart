import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: bottomContainer(),
    activeIcon: bottomContainer(
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: bottomContainer(
      imagePath: 'assets/icons/search2.png',
    ),
    activeIcon: bottomContainer(
      imagePath: 'assets/icons/search2.png',
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: 'Search',
  ),
  BottomNavigationBarItem(
    icon: bottomContainer(
      imagePath: 'assets/icons/search2.png',
    ),
    activeIcon: bottomContainer(
      imagePath: 'assets/icons/search2.png',
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: 'Search',
  ),
  BottomNavigationBarItem(
    icon: bottomContainer(
      imagePath: 'assets/icons/search2.png',
    ),
    activeIcon: bottomContainer(
      imagePath: 'assets/icons/search2.png',
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: 'Search',
  ),
];

Widget bottomContainer({
  double width = 15,
  double height = 15,
  String imagePath = 'assets/icons/home.png',
  Color color = AppColors.primaryElement,
}) {
  return SizedBox(
    width: 15.w,
    height: 15.w,
    child: appImageWithColor(
      imagePath: imagePath,
      color: AppColors.primaryFourthElementText,
    ),
  );
}
