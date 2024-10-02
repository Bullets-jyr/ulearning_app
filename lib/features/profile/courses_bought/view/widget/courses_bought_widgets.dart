import 'package:flutter/material.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/widgets/course_tile_widgets.dart';

class CoursesBoughtWidgets extends StatelessWidget {
  final List<CourseItem> value;

  const CoursesBoughtWidgets({
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
