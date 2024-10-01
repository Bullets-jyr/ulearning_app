import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class ProfileCourses extends StatelessWidget {
  const ProfileCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 10
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileLink(
            imagePath: ImageRes.profileVideo,
            text: 'My Courses',
          ),
          ProfileLink(
            imagePath: ImageRes.profileBook,
            text: 'Buy Courses',
          ),
          ProfileLink(
            imagePath: ImageRes.profileStar,
            text: '4.9',
          ),
        ],
      ),
    );
  }
}

class ProfileLink extends StatelessWidget {
  final String imagePath;
  final String text;

  const ProfileLink({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7.h),
        width: 100.w,
        decoration: BoxDecoration(
          color: AppColors.primaryElement,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
            color: AppColors.primaryElement,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImage(
              width: 20.w,
              height: 20.h,
              imagePath: imagePath,
            ),
            Container(
              margin: EdgeInsets.only(
                top: 5.h,
              ),
              child: Text11Normal(
                text: text,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
