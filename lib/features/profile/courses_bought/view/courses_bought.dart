import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/features/profile/courses_bought/controller/courses_bought_controller.dart';

class CoursesBought extends ConsumerWidget {
  const CoursesBought({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesList = ref.watch(coursesBoughtControllerProvider);
    return Scaffold(
      appBar: buildGlobalAppBar(
        title: 'Your courses',
      ),
      body: switch (coursesList) {
        AsyncData(:final value) => value == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                      '${AppConstants.IMAGE_UPLOADS_PATH}${value.elementAt(0).thumbnail!}',
                    ),
                  )),
                ),
              ),
        AsyncError(:final error) => Text('Error $error'),
        _ => const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.black26,
                strokeWidth: 2,
              ),
            ),
          ),
      },
    );
  }
}
