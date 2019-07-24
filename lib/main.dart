import 'package:flutter/material.dart';
import 'package:project_320190/ui/page/home_page.dart';
import 'package:project_320190/ui/provider_setup.dart';
import 'package:project_320190/ui/router.dart';
import 'package:provider/provider.dart';

import 'core/constant_app/route_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'project #320190',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutePage.SplashPage,
        onGenerateRoute: Router.generatorRoute,
      ),
    );
  }
}
