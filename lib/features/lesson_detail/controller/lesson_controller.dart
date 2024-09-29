import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/features/lesson_detail/repo/lesson_repo.dart';

part 'lesson_controller.g.dart';

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
    print('my video url is $url');
    // return response.data;
  } else {
    print('request failed ${response.code}');
  }
  // return null;
}
