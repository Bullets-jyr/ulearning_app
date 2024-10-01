import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildGlobalAppBar(
        title: 'Settings',
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Confirm logout',
                  ),
                  content: Text('Confirm logout.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print('cancel');
                      },
                      child: Text(
                        'Confirm',
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            height: 100.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageRes.logOut,
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
