import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/features/course_detail/view/course_detail.dart';
import 'package:ulearning_app/features/home/view/home.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/features/application/view/application.dart';
import 'package:ulearning_app/features/sign_in/view/sign_in.dart';
import 'package:ulearning_app/features/sign_up/view/sign_up.dart';
import 'package:ulearning_app/features/welcome/view/welcome.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(
        path: AppRoutesNames.WELCOME,
        page: Welcome(),
      ),
      RouteEntity(
        path: AppRoutesNames.SIGN_IN,
        page: const SignIn(),
      ),
      RouteEntity(
        path: AppRoutesNames.REGISTER,
        page: const SignUp(),
      ),
      RouteEntity(
        path: AppRoutesNames.APPLICATION,
        page: const Application(),
      ),
      RouteEntity(
        path: AppRoutesNames.HOME,
        page: const Home(),
      ),
      RouteEntity(
        path: AppRoutesNames.COURSE_DETAIL,
        page: const CourseDetail(),
      ),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      // print('clicked route ${settings.name}');
    }
    if (settings.name != null) {
      var result =
      routes().where((element) => element.path == settings.name);
      // print(result.isNotEmpty);

      if (result.isNotEmpty) {
        // if we used this is first time or not
        // bool? deviceFirstTime = Global.storageService.getDeviceFirstOpen();
        bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();

        if (result.first.path == AppRoutesNames.WELCOME && deviceFirstTime) {

          bool isLoggedIn = Global.storageService.isLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
              builder: (_) => const Application(),
              settings: settings,
            );
          } else {
            return MaterialPageRoute(
              builder: (_) => const SignIn(),
              settings: settings,
            );
          }
        } else {
          if (kDebugMode) {
            // print('App ran first time');
          }
          return MaterialPageRoute(
            builder: (_) => result.first.page,
            settings: settings,
          );
        }
      }
    }
    // if (settings.name != null) {
    //   var result = routes().where((element) => element.path == settings.name);
    //   if (result.first.path == AppRoutesNames.WELCOME) {
    //     print('on welcome route');
    //   }
    // }
    // if (settings.name == '/signIn') {
    //   return MaterialPageRoute(
    //     builder: (_) => SignIn(),
    //     settings: settings,
    //   );
    // } else {
    //
    // }
    return MaterialPageRoute(
      builder: (_) => Welcome(),
      settings: settings,
    );
  }
}

class RouteEntity {
  String path;
  Widget page;

  RouteEntity({
    required this.path,
    required this.page,
  });
}
