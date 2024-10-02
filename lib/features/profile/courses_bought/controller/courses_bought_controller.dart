import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/features/profile/courses_bought/repo/courses_bought_repo.dart';

part 'courses_bought_controller.g.dart';

@riverpod
class CoursesBoughtController extends _$CoursesBoughtController {
  @override
  FutureOr<List<CourseItem>?> build() async {
    final response = await CoursesBoughtRepo.coursesBought();
    if (response.code == 200) {
      return response.data;
    } else {
      if (kDebugMode) {
        print('Request failed with status code ${response.code}');
      }
    }
    return null;
  }
}
