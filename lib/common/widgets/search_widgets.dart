import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/app_textfields.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

Widget searchBar() {
  return Row(
    children: [
      // search text box
      Container(
        width: 280.w,
        height: 40.h,
        decoration: appBoxShadow(
          color: AppColors.primaryBackground,
          boxBorder: Border.all(
            color: AppColors.primaryFourthElementText,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 17.w,
              ),
              child: appImage(
                imagePath: ImageRes.searchIcon,
              ),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: appTextFieldOnly(
                width: 240,
                height: 40,
                hintText: 'Search your course...',
              ),
            ),
          ],
        ),
      ),
      // search button
    ],
  );
}
