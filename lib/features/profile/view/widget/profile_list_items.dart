import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class ProfileListItems extends StatelessWidget {
  const ProfileListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
      child: Column(
        children: [
          ListItem(
            imagePath: ImageRes.settings,
            text: 'Settings',
          ),
          ListItem(
            imagePath: ImageRes.settings,
            text: 'Settings',
          ),
          ListItem(
            imagePath: ImageRes.settings,
            text: 'Settings',
          ),
          ListItem(
            imagePath: ImageRes.settings,
            text: 'Settings',
          ),
          ListItem(
            imagePath: ImageRes.settings,
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String imagePath;
  final String text;

  const ListItem({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40.w,
          height: 40.h,
          padding: EdgeInsets.all(7.w),
          margin: EdgeInsets.only(bottom: 15.h),
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.primaryElement,
            ),
          ),
          child: AppImage(
            imagePath: imagePath,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15.w),
          child: Text13Normal(
            text: text,
          ),
        ),
      ],
    );
  }
}
