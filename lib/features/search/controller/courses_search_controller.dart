import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/features/search/repo/courses_search_repo.dart';

// part 'courses_search_controller.g.dart';

// @riverpod
// class CoursesSearchController extends _$CoursesSearchController {
//   @override
//   FutureOr<String> build() async {
//     return 'JiYoung Ryu loves riverpod';
//   }
// }

// class CoursesSearchController extends AutoDisposeNotifier<String> {
//   @override
//   String build() {
//     // TODO: implement build
//     return 'JiYoung Ryu loves riverpod';
//   }
// }

// final coursesSearchControllerProvider =
//     AutoDisposeNotifierProvider<CoursesSearchController, String>(
//         CoursesSearchController.new);

// like @Riverpod(keepAlive: true)
class CoursesSearchController
    extends AsyncNotifier<List<CourseItem>?> {
  @override
  FutureOr<List<CourseItem>?> build() async {
    final response = await CoursesSearchRepos.coursesDefaultSearch();
    if (response.code == 200) {
      return response.data;
    }
    // state = AsyncValue.data([]);
    // TODO: implement build
    return [];
  }

  reloadSearchData() async {
    final response = await CoursesSearchRepos.coursesDefaultSearch();
    if (response.code == 200) {
      state = AsyncValue.data(response.data);
      return;
    }
    // TODO: implement build
    state = AsyncValue.data([]);
  }

  searchData(String search) async {
    SearchRequestEntity searchRequestEntity = SearchRequestEntity();
    searchRequestEntity.search = search;
    var response = await CoursesSearchRepos.coursesSearch(
      params: searchRequestEntity,
    );
    if (response.code == 200) {
      state = AsyncValue.data(response.data);
    } else {
      state = AsyncValue.data([]);
    }
  }
}

final coursesSearchControllerProvider = AsyncNotifierProvider<
    CoursesSearchController, List<CourseItem>?>(CoursesSearchController.new);
