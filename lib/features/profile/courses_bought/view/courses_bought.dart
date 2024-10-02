import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/profile/courses_bought/controller/courses_bought_controller.dart';

class CoursesBought extends ConsumerWidget {
  const CoursesBought({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesList = ref.watch(coursesBoughtControllerProvider);
    return Scaffold(
      appBar: buildGlobalAppBar(
        title: 'Your courses',
      ),
      body: switch (coursesList) {
        AsyncData(:final value) => value == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: value.length,
                itemBuilder: (_, index) {
                  return Container(
                    width: 325.w,
                    height: 80.h,
                    margin: EdgeInsets.only(bottom: 15.h),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10.w),
                      // color: const Color.fromRGBO(255, 255, 255, 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60.h,
                                width: 60.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.w),
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(
                                        '${AppConstants.IMAGE_UPLOADS_PATH}${value.elementAt(index).thumbnail}'),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 6.w),
                                    width: 180.w,
                                    child: Text13Normal(
                                      maxLines: 1,
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.bold,
                                      text: value
                                          .elementAt(index)
                                          .name
                                          .toString(),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 6.w),
                                    width: 180.w,
                                    child: Text10Normal(
                                      color: AppColors.primaryThirdElementText,
                                      text:
                                      "${value.elementAt(index).lesson_num.toString()} Lesson",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: 55.w,
                            child: Text13Normal(
                              text: '\$${value.elementAt(index).price}',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
        AsyncError(:final error) => Text('Error $error'),
        _ => const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.black26,
                strokeWidth: 2,
              ),
            ),
          ),
      },
    );
  }
}
