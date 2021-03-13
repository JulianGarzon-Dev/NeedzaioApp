import 'package:flutter/material.dart';
import 'package:userapp/src/widgets/home_widget.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool changeTheme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffedd7c),
        body: initPage(context, changeTheme));
  }
}
