import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/features/buy_course/repo/buy_course_repo.dart';

part 'buy_course_controller.g.dart';

@riverpod
Future<String?> buyCourseController(BuyCourseControllerRef ref,
    {required int index}) async {
  // ref.watch(homeCourseListProvider);
  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id = index;
  final response = await BuyCourseRepo.buyCourse(params: courseRequestEntity);
  if (response.code == 200) {
    return response.data;
    // return null;
  } else {
    print('request failed ${response.code}');
  }
  return null;
}
