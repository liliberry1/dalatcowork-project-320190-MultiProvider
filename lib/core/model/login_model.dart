import 'package:flutter/material.dart';
import 'package:project_320190/core/services/authentication_service.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';


class LoginModel extends ChangeNotifier{
  AuthenticationService _authenticationService;

  bool _busy = false;
  bool _isLoggedInFacebook = false;

  bool get isLoggedInFacebook => _isLoggedInFacebook;
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


  void onLoginStatusChanged(bool isLoggedIn) {
    _isLoggedInFacebook = isLoggedIn;
    notifyListeners();
  }

  initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult =
    await facebookLogin.logInWithReadPermissions(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        print("facebook token: ${facebookLoginResult.accessToken.token}");
        _authenticationService.saveAccessToken(facebookLoginResult.accessToken.token);

        onLoginStatusChanged(true);
        break;
    }
  }


}