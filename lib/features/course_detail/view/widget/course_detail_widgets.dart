import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
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
    return AppBoxDecorationImage(
      imagePath: '${AppConstants.IMAGE_UPLOADS_PATH}${courseItem.thumbnail}',
      width: 325.w,
      height: 200.h,
      fit: BoxFit.fitWidth,
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
                  text:
                      '${courseItem.follow == null ? "0" : courseItem.follow.toString()}',
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
                  text:
                      '${courseItem.score == null ? "0" : courseItem.score.toString()}',
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

class CourseDetailDescription extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailDescription({
    super.key,
    required this.courseItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16Normal(
            text: courseItem.name ?? 'No name found',
            color: AppColors.primaryText,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
          ),
          Container(
            child: Text11Normal(
              text: courseItem.description ?? 'No description found',
              color: AppColors.primaryThirdElementText,
            ),
          ),
        ],
      ),
    );
  }
}

class CourseDetailGoBuyButton extends StatelessWidget {
  const CourseDetailGoBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20.h,
      ),
      child: const AppButton(
        buttonName: 'Go buy',
      ),
    );
  }
}

class CourseDetailIncludes extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailIncludes({
    super.key,
    required this.courseItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text14Normal(
            text: 'Course includes',
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 16.h,
          ),
          // Row(
          //   children: [
          //     Container(
          //       child: AppImage(
          //         imagePath: ImageRes.videoDetail,
          //         width: 30,
          //         height: 30,
          //       ),
          //       alignment: Alignment.center,
          //     ),
          //     Container(
          //       margin: EdgeInsets.only(left: 10.w),
          //       child: Text11Normal(
          //         color: AppColors.primarySecondaryElementText,
          //         text: courseItem.video_len == null
          //             ? '0 Hours video'
          //             : '${courseItem.video_len} Hours video',
          //       ),
          //     ),
          //   ],
          // ),
          CourseInfo(
            imagePath: ImageRes.videoDetail,
            length: courseItem.video_len,
            infoText: 'Hours video',
          ),
          SizedBox(
            height: 16.h,
          ),
          CourseInfo(
            imagePath: ImageRes.fileDetail,
            length: courseItem.lesson_num,
            infoText: 'Number of files',
          ),
          SizedBox(
            height: 16.h,
          ),
          CourseInfo(
            imagePath: ImageRes.downloadDetail,
            length: courseItem.down_num,
            infoText: 'Number of items to download',
          ),
        ],
      ),
    );
  }
}

class CourseInfo extends StatelessWidget {
  final String imagePath;
  final int? length;
  final String? infoText;

  const CourseInfo({
    super.key,
    required this.imagePath,
    this.length,
    this.infoText = 'item',
  });

  @override
  Widget build(BuildContext context) {
    // print('hashCode values are for length ${length.hashCode} for null ${null.hashCode}');
    // if (length.hashCode == null.hashCode) {
    //   print('same object');
    // } else {
    //   print('not same object');
    // }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // margin: EdgeInsets.only(bottom: 16.h),
          child: AppImage(
            imagePath: imagePath,
            width: 30,
            height: 30,
          ),
          alignment: Alignment.center,
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w),
          child: Text11Normal(
            color: AppColors.primarySecondaryElementText,
            text: length == null ? '0 $infoText' : '$length $infoText',
          ),
        ),
      ],
    );
  }
}

class LessonInfo extends StatelessWidget {
  const LessonInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 325.w,
      // height: 80.h,
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text14Normal(
            text: 'Lesson list',
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            width: 325.w,
            height: 80.h,
            decoration: appBoxShadow(
              radius: 10,
              sR: 2,
              bR: 3,
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
            child: InkWell(
              onTap: () {},
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppBoxDecorationImage(
                    width: 60.w,
                    height: 60.w,
                    imagePath: '${AppConstants.IMAGE_UPLOADS_PATH}default.png',
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text13Normal(
                        text: 'This is first lesson',
                      ),
                      Text10Normal(
                        text: 'This is description',
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  const AppImage(
                    imagePath: ImageRes.arrowRight,
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
