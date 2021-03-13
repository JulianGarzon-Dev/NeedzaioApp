import 'package:flutter/material.dart';
import 'package:userapp/src/widgets/login_widget.dart';

class LoginPage extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeTheme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffedd7c),
        body: loginPage(context, changeTheme));
  }
}
