import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class CourseDetailThumbnail extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailThumbnail({
    super.key,
    required this.courseItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0.h),
      child: AppBoxDecorationImage(
        imagePath: '${AppConstants.IMAGE_UPLOADS_PATH}${courseItem.thumbnail}',
        width: 325.w,
        height: 200.h,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class CourseDetailIconText extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailIconText({
    super.key,
    required this.courseItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 325.w,
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 5.h,
              ),
              decoration: appBoxShadow(
                radius: 7,
              ),
              child: const Text10Normal(
                text: 'Author Page',
                color: AppColors.primaryElementText,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                const AppImage(
                  imagePath: ImageRes.people,
                ),
                Text11Normal(
                  // text: '0',
                  text: '${courseItem.follow == null ? "0" : courseItem.follow.toString()}',
                  color: AppColors.primaryThirdElementText,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                const AppImage(
                  imagePath: ImageRes.star,
                ),
                Text11Normal(
                  // text: '0',
                  text: '${courseItem.score == null ? "0" : courseItem.score.toString()}',
                  color: AppColors.primaryThirdElementText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
