import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    print('-----build Profile-----');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildGlobalAppBar(
        title: 'Profile',
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20.w),
                  image: const DecorationImage(
                    image: AssetImage(
                      ImageRes.headPic,
                    ),
                  ),
                ),
                child: AppImage(
                  width: 25.w,
                  height: 25.h,
                  imagePath: ImageRes.editImage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
