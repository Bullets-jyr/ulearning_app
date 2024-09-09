import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';
import 'package:ulearning_app/global.dart';

Widget banner({required WidgetRef ref}) {
  PageController _controller = PageController(
    initialPage: ref.watch(homeScreenBannerDotsProvider),
  );
  return Column(
    children: [
      // banner
      SizedBox(
        width: 325.w,
        height: 160.h,
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
          },
          children: [
            bannerContainer(
              imagePath: ImageRes.banner1,
            ),
            bannerContainer(
              imagePath: ImageRes.banner2,
            ),
            bannerContainer(
              imagePath: ImageRes.banner3,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      // dots
      DotsIndicator(
        position: ref.watch(homeScreenBannerDotsProvider),
        dotsCount: 3,
        mainAxisAlignment: MainAxisAlignment.center,
        decorator: DotsDecorator(
          size: const Size.square(9.0),
          activeSize: const Size(24.0, 8.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    ],
  );
}

Widget bannerContainer({
  required String imagePath,
}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          imagePath,
        ),
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget userName() {
  return Container(
    child: text24Normal(
      text: Global.storageService.getUserProfile().name!,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget helloText() {
  return Container(
    child: text24Normal(
      text: 'Hello, ',
      color: AppColors.primaryThirdElementText,
      fontWeight: FontWeight.bold,
    ),
  );
}
