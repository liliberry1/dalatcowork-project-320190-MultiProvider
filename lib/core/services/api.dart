
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api{
  final api = 'https://mighty-sands-12882.herokuapp.com/users';
  final dalatcoworkAPI = "https://egamebe.dalatcowork.com/";
  final auth = "https://egamebe.dalatcowork.com/auth/facebook";

  var client = http.Client();

  Future<String> login(String userName) async{
    Map<String, dynamic> params = Map();
    params['user_name'] = userName;
    params['password'] = '123';
    
    var response = await client.post('$api/login',body: params);
    //TODO: replace to AccessToken
    return jsonDecode(response.body)['success'].toString();
  }

  Future<String> loginWithFacebook(String facebookAccessToken) async{
    Map<String, dynamic> params = Map();
    params['access_token'] = facebookAccessToken;
    var response = await client.post(auth,body:
    params);
    print("response Facebook ${response.body}");
  }
}