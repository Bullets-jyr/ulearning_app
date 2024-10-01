import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/global.dart';

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
                        Global.storageService
                            .remove(AppConstants.STORAGE_USER_PROFILE_KEY);
                        Global.storageService
                            .remove(AppConstants.STORAGE_USER_TOKEN_KEY);

                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutesNames.SIGN_IN,
                          (Route<dynamic> route) => false,
                        );
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
