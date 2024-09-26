import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/features/course_detail/controller/course_detail_controller.dart';

class CourseDetail extends ConsumerStatefulWidget {
  const CourseDetail({super.key});

  @override
  ConsumerState<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
  late var args;

  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    // print(args["id"]);
    args = id["id"];
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // var stateData = ref.watch(courseDetailControllerProvider(index: args.toInt()));
    var stateData = ref.watch(courseDetailControllerProvider(index: int.parse(args)));
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
