import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';
import 'package:ulearning_app/global.dart';

class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;

  const HomeBanner({
    super.key,
    required this.controller,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // banner
        SizedBox(
          width: 325.w,
          height: 160.h,
          child: PageView(
            controller: controller,
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
}

// Widget banner({
//   required WidgetRef ref,
//   required PageController controller,
// }) {
//   // PageController _controller = PageController(
//   //   initialPage: ref.watch(homeScreenBannerDotsProvider),
//   // );
//   return Column(
//     children: [
//       // banner
//       SizedBox(
//         width: 325.w,
//         height: 160.h,
//         child: PageView(
//           controller: controller,
//           onPageChanged: (index) {
//             ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
//           },
//           children: [
//             bannerContainer(
//               imagePath: ImageRes.banner1,
//             ),
//             bannerContainer(
//               imagePath: ImageRes.banner2,
//             ),
//             bannerContainer(
//               imagePath: ImageRes.banner3,
//             ),
//           ],
//         ),
//       ),
//       SizedBox(
//         height: 5.h,
//       ),
//       // dots
//       DotsIndicator(
//         position: ref.watch(homeScreenBannerDotsProvider),
//         dotsCount: 3,
//         mainAxisAlignment: MainAxisAlignment.center,
//         decorator: DotsDecorator(
//           size: const Size.square(9.0),
//           activeSize: const Size(24.0, 8.0),
//           activeShape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5),
//           ),
//         ),
//       ),
//     ],
//   );
// }

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

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    print('my user name');
    return Container(
      child: text24Normal(
        text: Global.storageService.getUserProfile().name!,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Widget userName() {
//   print('my user name');
//   return Container(
//     child: text24Normal(
//       text: Global.storageService.getUserProfile().name!,
//       fontWeight: FontWeight.bold,
//     ),
//   );
// }

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    // print('hello text');
    return Container(
      child: text24Normal(
        text: 'Hello, ',
        color: AppColors.primaryThirdElementText,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Widget helloText() {
//   print('hello text');
//   return Container(
//     child: text24Normal(
//       text: 'Hello, ',
//       color: AppColors.primaryThirdElementText,
//       fontWeight: FontWeight.bold,
//     ),
//   );
// }

AppBar homeAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appImage(
            imagePath: ImageRes.menu,
            width: 18.w,
            height: 12.h,
          ),
          GestureDetector(
            child: const AppBoxDecorationImage(),
          ),
        ],
      ),
    ),
  );
}
