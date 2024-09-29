import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/features/lesson_detail/repo/lesson_repo.dart';

part 'lesson_controller.g.dart';

@riverpod
Future<List<LessonItem>?> courseLessonDetailController(
    CourseLessonDetailControllerRef ref,
    {required int index}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;
  final response =
      await LessonRepo.courseLessonDetail(params: lessonRequestEntity);
  if (response.code == 200) {
    return response.data;
  } else {
    print('request failed ${response.code}');
  }
  return null;
}
