import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:userapp/src/service/users_service.dart';

Widget usersPage(BuildContext context, changeTheme) {
  UsersService courseConfiguration = UsersService();
  final _screenSize = MediaQuery.of(context).size;
  return GraphQLProvider(
      client: courseConfiguration.usersClient,
      child: Query(
        options: QueryOptions(
          documentNode: gql(readUsers),
          pollInterval: 10,
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.loading) {
            return CircularProgressIndicator();
          }

          List _albums = result.data['albums']['data'];

          return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: 10,
              itemBuilder: (context, index) {
                final _users = _albums[index]['user'];
                final card = Container(
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/img1.png'),
                      Container(
                          padding: EdgeInsets.all(10.0),
                          height: _screenSize.height * 0.25,
                          width: _screenSize.width * 0.55,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                (_users['name']),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20,
                                    color: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                (_users['email']),
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          )),
                    ],
                  ),
                );
                return Column(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.red[50],
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                              offset: Offset(2.0, 10.0))
                        ]),
                    height: _screenSize.height * 0.14,
                    width: _screenSize.width * 0.95,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: card,
                    ),
                  ),
                  SizedBox(height: _screenSize.height * 0.02),
                ]);
              });
        },
      ));
}
