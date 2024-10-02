import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/features/search/repo/courses_search_repo.dart';

// part 'courses_search_controller.g.dart';

// @riverpod
// class CoursesSearchController extends _$CoursesSearchController {
//   @override
//   FutureOr<String> build() async {
//     return 'JiYoung Ryu loves riverpod';
//   }
// }

class CoursesSearchController extends AutoDisposeNotifier<String> {
  @override
  String build() {
    // TODO: implement build
    return 'JiYoung Ryu loves riverpod';
  }
}

final coursesSearchControllerProvider =
    AutoDisposeNotifierProvider<CoursesSearchController, String>(
        CoursesSearchController.new);
