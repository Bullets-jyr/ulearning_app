import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/search_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/search/controller/courses_search_controller.dart';

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
                func: () => print('Search page'),
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
                      ? CircularProgressIndicator()
                      : ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (_, index) {
                      return Container(
                        width: 325.w,
                        height: 80.h,
                        margin: EdgeInsets.only(bottom: 15.h),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 10.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () => Navigator.of(context).pushNamed(
                            AppRoutesNames.COURSE_DETAIL,
                            arguments: {"id": value.elementAt(index).id},
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 60.h,
                                    width: 60.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.w),
                                      image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(
                                            '${AppConstants.IMAGE_UPLOADS_PATH}${value.elementAt(index).thumbnail}'),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 6.w),
                                        width: 180.w,
                                        child: Text13Normal(
                                          maxLines: 1,
                                          color: AppColors.primaryText,
                                          fontWeight: FontWeight.bold,
                                          text: value.elementAt(index).name.toString(),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 6.w),
                                        width: 180.w,
                                        child: Text10Normal(
                                          color: AppColors.primaryThirdElementText,
                                          text:
                                          "${value.elementAt(index).lesson_num.toString()} Lesson",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                width: 55.w,
                                child: Text13Normal(
                                  text: '\$${value.elementAt(index).price}',
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
