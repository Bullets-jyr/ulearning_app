import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/features/lesson_detail/controller/lesson_controller.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
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
    var lessonDetail =
        ref.watch(courseLessonDetailControllerProvider(index: args.toInt()));

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: lessonDetail.when(
          data: (data) => Column(
            children: [
              Text(
                data!.elementAt(0).name.toString(),
              ),
              AppBoxDecorationImage(
                imagePath: '${AppConstants.IMAGE_UPLOADS_PATH}${data!.elementAt(0).thumbnail}',
                width: 325.w,
                height: 200.h,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
          error: (error, traceStack) => Text(
            error.toString(),
          ),
          loading: () => Text(
            'loading',
          ),
        ),
      ),
    );
  }
}
