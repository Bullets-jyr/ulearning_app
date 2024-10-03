import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

// Widget appTextField({
//   TextEditingController? controller,
//   String text = '',
//   String iconName = '',
//   String hintText = 'Type in your info',
//   bool obscureText = false,
//   void Function(String value)? func,
// }) {
//   return Container(
//     padding: const EdgeInsets.only(left: 25, right: 25),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text14Normal(
//           text: text,
//         ),
//         SizedBox(
//           height: 5.h,
//         ),
//         Container(
//           width: 325.w,
//           height: 50.h,
//           // color: Colors.red,
//           decoration: appBoxDecorationTextField(),
//           // row contains icon and textfield
//           child: Row(
//             children: [
//               // for showing icons
//               Container(
//                 margin: EdgeInsets.only(left: 17.w),
//                 child: AppImage(imagePath: iconName),
//               ),
//               // our textfield
//               // Container(
//               //   width: 280,
//               //   height: 50,
//               //   child: TextField(
//               //     controller: controller,
//               //     onChanged: (value) => func!(value),
//               //     keyboardType: TextInputType.multiline,
//               //     decoration: InputDecoration(
//               //       hintText: hintText,
//               //       border: const OutlineInputBorder(
//               //         borderSide: BorderSide(
//               //           color: Colors.transparent,
//               //         ),
//               //       ),
//               //       // default border without any input
//               //       enabledBorder: const OutlineInputBorder(
//               //         borderSide: BorderSide(
//               //           color: Colors.transparent,
//               //         ),
//               //       ),
//               //       focusedBorder: const OutlineInputBorder(
//               //         borderSide: BorderSide(
//               //           color: Colors.transparent,
//               //         ),
//               //       ),
//               //       disabledBorder: const OutlineInputBorder(
//               //         borderSide: BorderSide(
//               //           color: Colors.transparent,
//               //         ),
//               //       ),
//               //     ),
//               //     maxLines: 1,
//               //     autocorrect: false,
//               //     // by default it's false
//               //     obscureText: obscureText,
//               //   ),
//               // ),
//               appTextFieldOnly(
//                 controller: controller,
//                 hintText: hintText,
//                 func: func,
//                 obscureText: obscureText,
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String text;
  final String iconName;
  final String hintText;
  final bool obscureText;
  final void Function(String value)? func;

  const AppTextField({
    super.key,
    this.controller,
    this.text = '',
    this.iconName = '',
    this.hintText = 'Type in your info',
    this.obscureText = false,
    this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text14Normal(
            text: text,
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            width: 325.w,
            height: 50.h,
            // color: Colors.red,
            decoration: appBoxDecorationTextField(),
            // row contains icon and textfield
            child: Row(
              children: [
                // for showing icons
                Container(
                  margin: EdgeInsets.only(left: 17.w),
                  child: AppImage(imagePath: iconName),
                ),
                AppTextFieldOnly(
                  controller: controller,
                  hintText: hintText,
                  func: func,
                  obscureText: obscureText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppTextFieldOnly extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final double width;
  final double height;
  final void Function(String value)? func;
  final bool obscureText;

  const AppTextFieldOnly({
    super.key,
    this.controller,
    this.hintText = 'Type in your info',
    this.width = 280,
    this.height = 50,
    this.func,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: TextField(
        controller: controller,
        onChanged: (value) => func!(value),
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            top: 7.h,
            left: 10.w,
          ),
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          // default border without any input
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        maxLines: 1,
        autocorrect: false,
        // by default it's false
        obscureText: obscureText,
      ),
    );
  }
}

// Widget appTextFieldOnly({
//   TextEditingController? controller,
//   String hintText = 'Type in your info',
//   double width = 280,
//   double height = 50,
//   void Function(String value)? func,
//   bool obscureText = false,
// }) {
//   return SizedBox(
//     width: width.w,
//     height: height.h,
//     child: TextField(
//       controller: controller,
//       onChanged: (value) => func!(value),
//       keyboardType: TextInputType.multiline,
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.only(
//           top: 7.h,
//           left: 10.w,
//         ),
//         hintText: hintText,
//         border: const OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.transparent,
//           ),
//         ),
//         // default border without any input
//         enabledBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.transparent,
//           ),
//         ),
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.transparent,
//           ),
//         ),
//         disabledBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.transparent,
//           ),
//         ),
//       ),
//       maxLines: 1,
//       autocorrect: false,
//       // by default it's false
//       obscureText: obscureText,
//     ),
//   );
// }
