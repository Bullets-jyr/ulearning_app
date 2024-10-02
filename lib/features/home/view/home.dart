import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/search_widgets.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';
import 'package:ulearning_app/features/home/view/widgets/home_widget.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _controller = PageController(
      initialPage: ref.watch(homeScreenBannerDotsProvider),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('-----build Home-----');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(ref),
      body: RefreshIndicator(
        child: Padding(
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
                const HelloText(),
                const UserName(),
                SizedBox(
                  height: 20.h,
                ),
                AppSearchBar(
                  func: () => print('Home page'),
                ),
                SizedBox(
                  height: 25.h,
                ),
                HomeBanner(
                  ref: ref,
                  controller: _controller,
                ),
                const HomeMenuBar(),
                CourseItemGrid(
                  ref: ref,
                ),
              ],
            ),
          ),
        ),
        onRefresh: () {
          return ref.refresh(homeCourseListProvider.notifier).fetchCourseList();
        },
      ),
    );
  }
}
