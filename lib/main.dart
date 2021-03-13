import 'package:flutter/material.dart';
import 'package:userapp/src/bloc/provider.dart';

import 'package:userapp/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Provider(
        child: MaterialApp(
            theme: ThemeData.light(),
            title: 'UserApp',
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: getApplicationRoutes()));
  }
}
