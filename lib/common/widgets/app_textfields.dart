import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

Widget appTextField({
  TextEditingController? controller,
  String text = '',
  String iconName = '',
  String hintText = 'Type in your info',
  bool obscureText = false,
  void Function(String value)? func,
}) {
  return Container(
    padding: EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(
          text: text,
        ),
        SizedBox(height: 5,),
        Container(
          width: 325,
          height: 50,
          // color: Colors.red,
          decoration: appBoxDecorationTextField(),
          // row contains icon and textfield
          child: Row(
            children: [
              // for showing icons
              Container(
                margin: EdgeInsets.only(left: 17),
                child: appImage(imagePath: iconName),
              ),
              // our textfield
              Container(
                width: 280,
                height: 50,
                child: TextField(
                  controller: controller,
                  onChanged: (value) => func!(value),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
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
              ),
            ],
          ),
        ),
      ],
    ),
  );
}