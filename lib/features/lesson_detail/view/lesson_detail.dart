import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/features/lesson_detail/controller/lesson_controller.dart';
import 'package:ulearning_app/features/lesson_detail/view/widget/lesson_detail_widgets.dart';
import 'package:video_player/video_player.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  late var args;
  int videoIndex = 0;

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
        child: lessonData.value == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  lessonData.when(
                    data: (data) {
                      print('my lesson num is ${data.lessonItem.length}');
                      return Column(
                        children: [
                          Container(
                            width: 325.w,
                            height: 200.h,
                            decoration: data.lessonItem.length == 0
                                ? appBoxShadow()
                                : networkImageDecoration(
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
                          // video controls
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
                                  onTap: () {
                                    videoIndex = videoIndex - 1;
                                    if (videoIndex < 0) {
                                      videoIndex = 0;
                                      toastInfo('No earlier videos');
                                      return;
                                    }
                                    var videoUrl = data.lessonItem[videoIndex].url;
                                    ref.read(lessonDataControllerProvider.notifier).playNextVid(videoUrl!);
                                  },
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
                                  onTap: () {
                                    // print('---my play state is ${data.isPlay}');
                                    if (data.isPlay) {
                                      // print('---it is playing1');
                                      videoPlayerController?.pause();
                                      ref
                                          .read(lessonDataControllerProvider
                                              .notifier)
                                          .playPause(false);
                                      // print('---it is stopped1');
                                    } else {
                                      // print('---it is stopped2');
                                      videoPlayerController?.play();
                                      ref
                                          .read(lessonDataControllerProvider
                                              .notifier)
                                          .playPause(true);
                                      // print('---it is playing2');
                                    }
                                  },
                                  child: data.isPlay
                                      ? AppImage(
                                          width: 24.w,
                                          height: 24.h,
                                          imagePath: ImageRes.pause,
                                        )
                                      : AppImage(
                                          width: 24.w,
                                          height: 24.h,
                                          imagePath: ImageRes.play,
                                        ),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    /**
                                     * length = 2
                                     * current = 0
                                     */
                                    videoIndex = videoIndex + 1;
                                    if (videoIndex >= data.lessonItem.length) {
                                      videoIndex = data.lessonItem.length - 1;
                                      toastInfo('You have seen all the videos');
                                      return;
                                    }
                                    var videoUrl = data.lessonItem[videoIndex].url;
                                    ref.read(lessonDataControllerProvider.notifier).playNextVid(videoUrl!);
                                  },
                                  child: AppImage(
                                    width: 24.w,
                                    height: 24.h,
                                    imagePath: ImageRes.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          // video list
                          Padding(
                            padding: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: LessonVideos(
                              lessonData: data.lessonItem,
                              ref: ref,
                            ),
                          ),
                        ],
                      );
                    },
                    error: (e, t) => Text(
                      'error',
                    ),
                    loading: () => Text(
                      'Loading',
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
