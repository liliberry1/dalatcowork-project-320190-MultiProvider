import 'package:project_320190/core/services/api.dart';
import 'package:project_320190/core/helper/file_helper.dart';

class AuthenticationService {
  final Api _api;
  FileHelper _fileHelper;

  AuthenticationService({Api api})
      : _api = api,
        _fileHelper = FileHelper();



  Future<bool> login(String userName) async {
    String accessToken = await _api.login(userName);
    saveAccessToken(accessToken);
    return accessToken.isNotEmpty;
  }


  saveAccessToken(String accessToken){
    print("function saveAccessToken");
      _fileHelper.writeData(accessToken);
  }

  Future<String> fetchAndGetAccessToken() => _fileHelper.getAccessToken();

  Future<bool> hasAccessToken() async {
    await fetchAndGetAccessToken().then((accessToken) {
    return accessToken.toString().isNotEmpty;
    });
  }



}
