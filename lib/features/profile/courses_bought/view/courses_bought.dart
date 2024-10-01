import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';

class CoursesBought extends StatelessWidget {
  const CoursesBought({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildGlobalAppBar(
        title: 'Your courses',
      ),
      body: Center(
        child: Text(
          'Hello there',
        ),
      ),
    );
  }
}
