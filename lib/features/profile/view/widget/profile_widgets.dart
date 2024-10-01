import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/profile/controller/profile_controller.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var profileImage = ref.read(profileControllerProvider);
        print('${AppConstants.SERVER_API_URL}${profileImage.avatar}');
        return Container(
          alignment: Alignment.bottomRight,
          width: 80.w,
          height: 80.h,
          decoration: profileImage.avatar == null
              ? BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.w),
                  image: const DecorationImage(
                    image: AssetImage(
                      ImageRes.headPic,
                    ),
                  ),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${AppConstants.SERVER_API_URL}${profileImage.avatar}',
                    ),
                  ),
                ),
          child: AppImage(
            width: 25.w,
            height: 25.h,
            imagePath: ImageRes.editImage,
          ),
        );
      },
    );
  }
}
