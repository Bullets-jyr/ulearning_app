import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/application.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/sign_up/sign_up.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

class AppPages {
  static List<dynamic> routes() {
    return [
      RouteEntity(
        path: AppRoutesNames.WELCOME,
        page: Welcome(),
      ),
      RouteEntity(
        path: AppRoutesNames.SIGN_IN,
        page: SignIn(),
      ),
      RouteEntity(
        path: AppRoutesNames.REGISTER,
        page: SignUp(),
      ),
      RouteEntity(
        path: AppRoutesNames.APPLICATION,
        page: Application(),
      ),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      print('clicked route ${settings.name}');
    }
    if (settings.name != null) {
      var result =
      routes().where((element) => element.path == settings.name);
      // if we used this is first time or not
      bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
      print(deviceFirstTime);
      if (result.first.path == AppRoutesNames.WELCOME) {

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
