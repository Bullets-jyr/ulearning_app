import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/course_detail/controller/course_detail_controller.dart';
import 'package:ulearning_app/features/course_detail/view/widget/course_detail_widgets.dart';

class CourseDetail extends ConsumerStatefulWidget {
  const CourseDetail({super.key});

  @override
  ConsumerState<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
  late var args;

  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    // print(args["id"]);
    args = id["id"];
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var stateData =
        ref.watch(courseDetailControllerProvider(index: args.toInt()));
    // var stateData =
    //     ref.watch(courseDetailControllerProvider(index: int.parse(args)));
    return Scaffold(
      appBar: buildGlobalAppBar(
        title: 'Course detail',
      ),
      body: stateData.when(
        data: (data) => data == null
            ? SizedBox()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CourseDetailThumbnail(
                    courseItem: data,
                  ),
                  Container(
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
                              Container(
                                child: appImage(
                                  imagePath: ImageRes.people,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        error: (error, traceStack) => const Text(
          'Error loading the data',
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
