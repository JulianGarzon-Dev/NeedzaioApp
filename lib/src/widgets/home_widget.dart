import 'package:flutter/material.dart';
import 'package:userapp/src/pages/login.dart';
import 'package:location/location.dart';

initPage(BuildContext context, changeTheme) {
  final _screenSize = MediaQuery.of(context).size;
  return Center(
    child: Column(
      children: <Widget>[
        SizedBox(height: _screenSize.height * 0.39),
        Text(
          ("USER APP"),
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        SizedBox(height: _screenSize.height * 0.03),
        Container(
            height: _screenSize.height * 0.11,
            width: _screenSize.width * 0.95,
            child: Column(children: <Widget>[
              Text(
                  ("Lorem ipsum dolor sit amet,\n consetetur sadipscing elitr, sed diam\n nonumy eirmod tempor invidunt ut\n labore et dolore magna aliquyam"),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ])),
        SizedBox(height: _screenSize.height * 0.03),
        RaisedButton(
            onPressed: () {
              if (locationActive() != null) {
                return Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } else {
                return null;
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            color: Colors.black,
            textColor: Colors.white,
            padding: EdgeInsets.all(0.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
              child: Text(
                'IR A LOGIN',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            )),
        SizedBox(height: _screenSize.height * 0.0322),
        Container(
            color: Color(0xfffedd7c),
            height: _screenSize.height * 0.303,
            width: _screenSize.width * 0.95,
            child: Column(children: <Widget>[
              Image.asset('assets/img4.png'),
            ]))
      ],
    ),
  );
}

locationActive() async {
  final Location location = new Location();
  LocationData currentLocation;
  currentLocation = await location.getLocation();
  return currentLocation;
}
