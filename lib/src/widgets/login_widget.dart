import 'package:flutter/material.dart';
import 'package:userapp/src/bloc/provider.dart';
import 'package:userapp/src/pages/users.dart';

Widget loginPage(BuildContext context, changeTheme) {
  final _screenSize = MediaQuery.of(context).size;
  final bloc = Provider.of(context);
  bool loginenable = true;
  return Container(
      height: _screenSize.height * 1,
      width: _screenSize.width * 1,
      child: SingleChildScrollView(
          child: Column(children: <Widget>[
        Stack(children: [
          Container(
            height: _screenSize.height * 0.7,
            width: _screenSize.width * 1,
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              SizedBox(height: _screenSize.height * 0.1),
              Container(
                  height: _screenSize.height * 0.45,
                  width: _screenSize.width * 1,
                  child: Column(children: <Widget>[])),
              Container(
                  height: _screenSize.height * 0.15,
                  width: _screenSize.width * 1,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(120.0)),
                      color: Colors.white),
                  child: Column(children: <Widget>[])),
            ]),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: _screenSize.height * 0.1),
                Image.asset('assets/img2.png'),
              ],
            ),
          )
        ]),
        Container(
            color: Colors.white,
            height: _screenSize.height * 0.299,
            width: _screenSize.width * 1,
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      icon: Icon(
                        (Icons.person),
                        color: Color(0xfffedd7c),
                      ),
                      hintText: "Username"),
                ),
              ),
              SizedBox(
                height: _screenSize.height * 0.01,
              ),
              StreamBuilder(
                  stream: bloc.passwordStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            icon: Icon(
                              (Icons.lock),
                              color: Color(0xfffedd7c),
                            ),
                            errorText: snapshot.error,
                            hintText: "Password"),
                        onChanged: bloc.changePassword,
                      ),
                    );
                  }),
              SizedBox(
                height: _screenSize.height * 0.01,
              ),
              StreamBuilder(
                  stream: bloc.passwordStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return RaisedButton(
                        onPressed: () {
                          loginenable = snapshot.hasData;
                          if (loginenable == false) {
                            return null;
                          }
                          if (loginenable == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UsersPage()),
                            );
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        textColor: Colors.white,
                        padding: EdgeInsets.all(0.0),
                        color: Color(0xfffedd7c),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 80.0, vertical: 10.0),
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ));
                  }),
              SizedBox(
                height: _screenSize.height * 0.01,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account?"),
                    Text(
                      (" SIGN UP"),
                      style: TextStyle(color: Color(0xfffedd7c)),
                    )
                  ],
                ),
              )
            ]))),
      ])));
}
