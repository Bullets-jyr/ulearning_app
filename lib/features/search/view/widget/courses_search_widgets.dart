import 'package:flutter/material.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/widgets/course_tile_widgets.dart';

class CoursesSearchWidgets extends StatelessWidget {
  final List<CourseItem> value;

  const CoursesSearchWidgets({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CourseTileWidgets(
      value: value,
    );
  }
}
