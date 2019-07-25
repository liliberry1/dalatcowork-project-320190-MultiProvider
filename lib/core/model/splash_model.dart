import 'package:flutter/material.dart';
import 'package:project_320190/core/helper/file_helper.dart';
import 'package:project_320190/core/services/authentication_service.dart';

class SplashModel extends ChangeNotifier{

  AuthenticationService _authenticationService;


  SplashModel({AuthenticationService authenticatonService}):
        _authenticationService = authenticatonService;

  bool _hasAccessToken = false;

  bool get hasAccessToken => _hasAccessToken;


  setHasAccessToken(bool value){
    _hasAccessToken = value;
    notifyListeners();
  }


   fetchLogin(){
    bool value = false;
    _authenticationService.hasAccessToken().then((has){
      value = has;
    });
    setHasAccessToken(value);
  }


}