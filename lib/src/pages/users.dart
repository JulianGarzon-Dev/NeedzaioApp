import 'package:flutter/material.dart';
import 'package:userapp/src/widgets/users_widget.dart';

class UsersPage extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  bool changeTheme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            child: Row(
              children: [
                Container(
                    height: 30,
                    width: 95,
                    decoration: BoxDecoration(
                        color: Color(0xfffedd7c),
                        borderRadius: BorderRadius.circular(18.0)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.black,
                        ),
                        Text(
                          ("Home"),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    )),
                SizedBox(width: 25),
                Icon(
                  Icons.chat_bubble,
                  color: Colors.black,
                ),
                SizedBox(width: 25),
                Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
                SizedBox(width: 25),
                Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: usersPage(context, changeTheme));
  }
}
