import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/services/http_util.dart';

class CoursesBoughtRepo {
  static Future<CourseListResponseEntity> coursesBought() async {
    var response = await HttpUtil().post(
      'api/courses_bought',
    );
    return CourseListResponseEntity.fromJson(response);
  }
}