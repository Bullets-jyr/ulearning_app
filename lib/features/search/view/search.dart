import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/search_widgets.dart';
import 'package:ulearning_app/features/search/controller/courses_search_controller.dart';

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myProvider = ref.watch(coursesSearchControllerProvider);
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
                func: () => print('Search page'),
              ),
              myProvider.when(
                data: (data) => Text(data.toString()),
                error: (e, st) => Text(e.toString()),
                loading: () => CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
