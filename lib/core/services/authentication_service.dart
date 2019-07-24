import 'package:project_320190/core/services/api.dart';

class AuthenticationService {

  final Api _api;


  AuthenticationService({Api api}) : _api = api;

  Future<bool> login(String userName) async{
    bool success = await _api.login(userName);
    return success;
  }
}
