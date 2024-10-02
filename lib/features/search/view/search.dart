import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/search_widgets.dart';
import 'package:ulearning_app/features/search/controller/courses_search_controller.dart';
import 'package:ulearning_app/features/search/view/widget/courses_search_widgets.dart';

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvider = ref.watch(coursesSearchControllerProvider);
    return Scaffold(
      appBar: buildGlobalAppBar(
        title: 'Search courses',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              AppSearchBar(
                searchFunc: (search) {
                  ref
                      .watch(coursesSearchControllerProvider.notifier)
                      .searchData(search);
                },
              ),
              // myProvider.when(
              //   data: (data) => Text(data.toString()),
              //   error: (e, st) => Text(e.toString()),
              //   loading: () => CircularProgressIndicator(),
              // ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: switch (searchProvider) {
                  AsyncData(:final value) => value!.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CoursesSearchWidgets(
                          value: value,
                        ),
                  AsyncError(:final error) => Text('Error $error'),
                  _ => const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.red,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
