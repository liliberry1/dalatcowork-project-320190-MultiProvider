import 'package:flutter/material.dart';
import 'package:project_320190/core/constant/route_page.dart';
import 'package:project_320190/ui/page/home_page.dart';
import 'package:project_320190/ui/page/login_app_page.dart';
import 'package:project_320190/ui/page/login_page.dart';
import 'package:project_320190/ui/page/splash_page.dart';

class Router {
  static Route<dynamic> generatorRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutePage.HomePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RoutePage.LoginPage:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RoutePage.LoginAppPage:
        return MaterialPageRoute(builder: (_) => LoginAppPage());
      case RoutePage.SplashPage:
        return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}
