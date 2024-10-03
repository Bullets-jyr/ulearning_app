import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class AuthorMenu extends StatelessWidget {
  const AuthorMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325.w,
      height: 220.h,
      child: Stack(
        children: [
          Container(
            width: 325.w,
            height: 160.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20.h,
              ),
              image: const DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(
                  ImageRes.background,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: 325.w,
              margin: EdgeInsets.only(
                left: 20.h,
              ),
              child: Row(
                children: [
                  Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(
                        20.w,
                      ),
                      image: const DecorationImage(
                        image: AssetImage(
                          ImageRes.profile,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 6.w,
                        ),
                        child: const Text13Normal(
                          text: "dbestech",
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 6.w,
                        ),
                        child: const Text9Normal(
                          text: "A freelancer",
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AuthorTextAndIcon(
                            text: "10",
                            icon: ImageRes.people,
                            first: true,
                          ),
                          AuthorTextAndIcon(
                            text: "90",
                            icon: ImageRes.star,
                            first: false,
                          ),
                          AuthorTextAndIcon(
                            text: "12",
                            icon: ImageRes.downloadDetail,
                            first: false,
                          ),
                        ],
                      ),
                    ],
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

class AuthorTextAndIcon extends StatelessWidget {
  final String text;
  final String icon;
  final bool first;

  const AuthorTextAndIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.first,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: first == true ? 3.w : 20.w,
      ),
      child: Row(
        children: [
          AppImage(
            imagePath: icon,
          ),
          Text11Normal(
            text: text,
            color: AppColors.primaryThirdElementText,
          ),
        ],
      ),
    );
  }
}

class AuthorDescription extends StatelessWidget {
  const AuthorDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      margin: EdgeInsets.only(
        top: 10.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text16Normal(
            text: "About me",
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
          Container(
            margin: EdgeInsets.only(
              top: 8.h,
            ),
            child: const Text11Normal(
              text: "I am a course creator. I love Flutter and React Native",
              color: AppColors.primaryThirdElementText,
            ),
          ),
        ],
      ),
    );
  }
}
