import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
