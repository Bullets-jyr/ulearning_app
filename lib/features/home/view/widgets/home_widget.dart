import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
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

AppBar homeAppBar(WidgetRef ref) {
  var profileState = ref.watch(homeUserProfileProvider);
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppImage(
            imagePath: ImageRes.menu,
            width: 18,
            height: 12,
          ),
          profileState.when(
            data: (value) => GestureDetector(
              child: AppBoxDecorationImage(
                imagePath: '${AppConstants.SERVER_API_URL}${value.avatar!}',
              ),
            ),
            error: (err, stack) => const AppImage(
              width: 18,
              height: 12,
              imagePath: ImageRes.profile,
            ),
            loading: () => Container(),
          ),
          // GestureDetector(
          //   child: const AppBoxDecorationImage(),
          // ),
        ],
      ),
    ),
  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // see all course
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text16Normal(
                text: 'Choice your course',
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                child: Text10Normal(
                  text: 'See all',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        // course item button
        Row(
          children: [
            Container(
              decoration: appBoxShadow(
                color: AppColors.primaryElement,
                radius: 7.w,
              ),
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
                top: 5.h,
                bottom: 5.h,
              ),
              child: const FadeText(
                text: 'All',
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child: const FadeText(
                text: 'Popular',
                color: AppColors.primaryThirdElementText,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child: const FadeText(
                text: 'Newest',
                color: AppColors.primaryThirdElementText,
              ),
            )
          ],
        )
      ],
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  final WidgetRef ref;

  const CourseItemGrid({
    super.key,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(homeCourseListProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 0),
      child: courseState.when(
        data: (data) => GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 1.6,
          ),
          itemCount: data?.length,
          itemBuilder: (_, index) {
            return AppBoxDecorationImage(
              imagePath:
                  '${AppConstants.IMAGE_UPLOADS_PATH}${data![index].thumbnail}',
              fit: BoxFit.fitWidth,
              courseItem: data[index],
              func: () {
                Navigator.of(context).pushNamed(
                  '/course_detail',
                  arguments: {
                    'id': data[index].id,
                    // 'id': 4,
                  },
                );
                // print('hello');
                // print(data[index].id);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return Scaffold(
                //         appBar: AppBar(),
                //         body: Center(
                //           child: Text(
                //             data[index].id.toString(),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // );
              },
            );
          },
        ),
        error: (error, stackTrace) {
          // print(error.toString());
          // print(stackTrace.toString());
          return const Center(
            child: Text(
              'Error loading data',
            ),
          );
        },
        loading: () => const Center(
          child: Text(
            'loading...',
          ),
        ),
      ),
    );
  }
}
