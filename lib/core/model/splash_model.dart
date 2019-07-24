import 'package:flutter/material.dart';
import 'package:project_320190/core/helper/file_helper.dart';

class SplashModel extends ChangeNotifier{

  bool _wasLogin = false;

  bool get wasLogin => _wasLogin;

  setWasLogin(bool value){
    _wasLogin = value;
    notifyListeners();
  }

  bool fetchLogin(){
    var accessToken = FileHelper().readAccessToken();
    if(accessToken!= null){
      setWasLogin(true);
    }else{
      setWasLogin(false);
    }

  }

}