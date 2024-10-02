import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'courses_search_controller.g.dart';

@riverpod
class CoursesSearchController extends _$CoursesSearchController {
  @override
  FutureOr<String> build() async {
    return 'JiYoung Ryu loves riverpod';
  }
}
