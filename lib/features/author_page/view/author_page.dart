import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/features/author_page/view/widget/author_widgets.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({super.key});

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args);
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildGlobalAppBar(
        title: 'Author page',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
        child: Column(
          children: [
            const AuthorMenu(),
            // const AuthorDescription(),
            // SizedBox(height: 20.h,),
            //go chat button
            // AppButton(
            //   buttonName: "Go Chat",
            //   func: (){
            //     print("I am tapped");
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
