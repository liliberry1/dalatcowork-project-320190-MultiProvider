import 'package:flutter/material.dart';
import 'package:project_320190/core/constant/route_page.dart';
import 'package:provider/provider.dart';
import 'package:project_320190/core/model/login_model.dart';

class LoginPage extends StatelessWidget {
  TextEditingController userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>.value(
        value: LoginModel(authenticationService: Provider.of(context)),
        child: Consumer<LoginModel>(
          builder: (context, model, child) => Scaffold(
                body: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 32),
                          child: Text(
                            'Login Page',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 32),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'User Id',
                            ),
                            controller: userIdController,
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(45))),
                          margin: EdgeInsets.symmetric(vertical: 32),
                          child: FlatButton(
                              onPressed: () async {
                                print("success");
                                bool success = await model
                                    .login(userIdController.text.trim());
                                if (success) {
                                  Navigator.pushNamed(
                                      context, RoutePage.HomePage);
                                }else{
                                  print("success: fail");
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )),
                        ),
                        Container(
                          padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 32),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(45))),
                          margin: EdgeInsets.symmetric(vertical: 32),
                          child: FlatButton(
                              onPressed: () async {
                                print('Login With Facebook');
                                await model.initiateFacebookLogin();
                              },
                              child: Text(
                                'Login With Facebook',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )),
                        ),
                        widgetBusy(model.busy),
                      ],
                    ),
                  ),
                ),
              ),
        ));

  }


  Widget widgetBusy(bool busy){
    if(busy){
      return Container(
        alignment: Alignment.center,
        child: Text("Loading..."),
      );
    }
    return Container();
  }


}
