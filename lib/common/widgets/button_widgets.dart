import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

// Widget appButton({
//   double width = 325,
//   double height = 50,
//   String buttonName = '',
//   bool isLogin = true,
//   BuildContext? context,
//   void Function()? func,
// }) {
//   return GestureDetector(
//     onTap: func,
//     child: Container(
//       width: width,
//       height: height,
//       // isLogin true then send primary color else send white color
//       decoration: appBoxShadow(
//         color: isLogin ? AppColors.primaryElement : Colors.white,
//         boxBorder: Border.all(
//           color: AppColors.primaryFourthElementText,
//         ),
//       ),
//       child: Center(
//         child: Text16Normal(
//           text: buttonName,
//           color: isLogin ? AppColors.primaryBackground : AppColors.primaryText,
//         ),
//       ),
//     ),
//   );
// }

class AppButton extends StatelessWidget {
  final double width;
  final double height;
  final String buttonName;
  final bool isLogin;
  final BuildContext? context;
  final void Function()? func;

  const AppButton({
    super.key,
    this.width = 325,
    this.height = 50,
    this.buttonName = '',
    this.isLogin = true,
    this.context,
    this.func,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: width.w,
        height: height.h,
        // isLogin true then send primary color else send white color
        decoration: appBoxShadow(
          color: isLogin ? AppColors.primaryElement : Colors.white,
          boxBorder: Border.all(
            color: AppColors.primaryFourthElementText,
          ),
        ),
        child: Center(
          child: Text16Normal(
            text: buttonName,
            color:
                isLogin ? AppColors.primaryBackground : AppColors.primaryText,
          ),
        ),
      ),
    );
  }
}
