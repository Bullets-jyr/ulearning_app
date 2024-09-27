import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/features/course_detail/repo/course_repo.dart';

part 'course_controller.g.dart';

@riverpod
Future<CourseItem?> courseDetailController(
    CourseDetailControllerRef ref, {required int index}) async {
  // ref.watch(homeCourseListProvider);
  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id = index;
  final response =
      await CourseRepo.courseDetail(params: courseRequestEntity);
  if (response.code == 200) {
    return response.data;
  } else {
    print('request failed ${response.code}');
  }
  return null;
}

@riverpod
Future<List<LessonItem>?> courseLessonListController(
    CourseLessonListControllerRef ref, {required int index}) async {
  // ref.watch(homeCourseListProvider);
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;
  final response =
  await CourseRepo.courseLessonList(params: lessonRequestEntity);
  if (response.code == 200) {
    return response.data;
  } else {
    print('request failed ${response.code}');
  }
  return null;
}
