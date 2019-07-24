import 'package:flutter/material.dart';
import 'package:project_320190/core/services/authentication_service.dart';


class LoginModel extends ChangeNotifier{
  AuthenticationService _authenticationService;

  bool _busy = false;

  bool get busy => _busy;

  LoginModel({@required AuthenticationService authenticationService}):
        _authenticationService = authenticationService;


  setBusy(bool value){
    _busy = value;
    notifyListeners();
  }


  Future<bool> login(String userIdText) async{
    setBusy(true);
    bool success = await _authenticationService.login(userIdText);
    setBusy(false);
    return success;
  }




}