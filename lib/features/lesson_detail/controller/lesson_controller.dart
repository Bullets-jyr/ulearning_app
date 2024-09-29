import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/features/lesson_detail/repo/lesson_repo.dart';
import 'package:video_player/video_player.dart';

part 'lesson_controller.g.dart';

VideoPlayerController? videoPlayerController;

@riverpod
Future<void> lessonDetailController(LessonDetailControllerRef ref,
    {required int index}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;
  final response =
      await LessonRepo.courseLessonDetail(params: lessonRequestEntity);
  if (response.code == 200) {
    var url =
        '${AppConstants.IMAGE_UPLOADS_PATH}${response.data!.elementAt(0).url!}';

    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(url),
    );

    var initializeVideoPlayerFuture = videoPlayerController?.initialize();

    LessonVideo vidInstance = LessonVideo(
      lessonItem: response.data!,
      isPlay: true,
      initializeVideoPlayer: initializeVideoPlayerFuture,
      url: url,
    );
    videoPlayerController?.play();
    ref
        .read(lessonDataControllerProvider.notifier)
        .updateLessonData(vidInstance);
    // print('my video url is $url');
    // return response.data;
  } else {
    print('request failed ${response.code}');
  }
  // return null;
}

@riverpod
class LessonDataController extends _$LessonDataController {
  @override
  FutureOr<LessonVideo> build() async {
    return LessonVideo();
  }

  void updateLessonData(LessonVideo lessons) {
    update(
      (data) => data.copyWith(
        url: lessons.url,
        initializeVideoPlayer: lessons.initializeVideoPlayer,
        lessonItem: lessons.lessonItem,
      ),
    );
  }
}
