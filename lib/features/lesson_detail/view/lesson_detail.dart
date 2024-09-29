import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/lesson_detail/controller/lesson_controller.dart';
import 'package:video_player/video_player.dart';

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
  void dispose() {
    videoPlayerController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var lessonDetail =
    //     ref.watch(lessonDetailControllerProvider(index: args.toInt()));
    var lessonData = ref.watch(lessonDataControllerProvider);
    // print('-------my data length is ${lessonData.value!.lessonItem.length}--------');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: lessonData.value!.lessonItem.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  lessonData.when(
                    data: (data) => Container(
                      width: 325.w,
                      height: 200.h,
                      decoration: networkImageDecoration(
                        imagePath:
                            '${AppConstants.IMAGE_UPLOADS_PATH}${data.lessonItem[0].thumbnail}',
                      ),
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //     image: NetworkImage(
                      //         '${AppConstants.IMAGE_UPLOADS_PATH}${data.lessonItem[0].thumbnail}'),
                      //   ),
                      // ),
                      child: FutureBuilder(
                        future: data.initializeVideoPlayer,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return videoPlayerController == null
                                ? Container()
                                : Stack(
                                    children: [
                                      VideoPlayer(videoPlayerController!),
                                    ],
                                  );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    error: (e, t) => Text(
                      'error',
                    ),
                    loading: () => Text(
                      'Loading',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 25.w,
                      right: 25.w,
                      top: 10.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: AppImage(
                            width: 24.w,
                            height: 24.h,
                            imagePath: ImageRes.left,
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        GestureDetector(
                          child: AppImage(
                            width: 24.w,
                            height: 24.h,
                            imagePath: ImageRes.pause,
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        GestureDetector(
                          child: AppImage(
                            width: 24.w,
                            height: 24.h,
                            imagePath: ImageRes.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
      // body: Center(
      //   child: lessonDetail.when(
      //     data: (data) => Column(
      //       children: [
      //         // Text(
      //         //   data!.elementAt(0).name.toString(),
      //         // ),
      //         // AppBoxDecorationImage(
      //         //   imagePath: '${AppConstants.IMAGE_UPLOADS_PATH}${data!.elementAt(0).thumbnail}',
      //         //   width: 325.w,
      //         //   height: 200.h,
      //         //   fit: BoxFit.fitWidth,
      //         // ),
      //       ],
      //     ),
      //     error: (error, traceStack) => Text(
      //       error.toString(),
      //     ),
      //     loading: () => Text(
      //       'loading',
      //     ),
      //   ),
      // ),
    );
  }
}
