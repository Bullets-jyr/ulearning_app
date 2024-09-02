import 'package:flutter/material.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

class AppPages {
  static List<dynamic> routes() {
    return [];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    print('my route name is ${settings.name}');
    return MaterialPageRoute(
      builder: (_) => Welcome(),
      settings: settings,
    );
  }
}
