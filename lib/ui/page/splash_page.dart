import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_320190/core/constant_app/route_page.dart';
import 'package:project_320190/core/model/splash_model.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

SplashModel _model;
Timer _timer;

  fetch(){
    _timer = Timer(Duration(seconds: 3),() async {
      await _model.fetchLogin();
      if (_model.hasAccessToken) {
        Navigator.pushReplacementNamed(context, RoutePage.HomePage);
      } else {
        Navigator.pushReplacementNamed(context, RoutePage.LoginPage);
      }
      print("push");
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

@override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashModel>.value(
      value: SplashModel(authenticatonService: Provider.of(context)),
      child: Consumer<SplashModel>(builder: (context, model, child) {
        _model = model;
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Text('Splash Page'),
          ),
        );
      }),
    );
  }
}
