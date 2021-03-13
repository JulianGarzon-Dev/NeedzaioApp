import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/foundation.dart';

class UsersService {
  static HttpLink httpLink = HttpLink(
    uri: "https://graphqlzero.almansi.me/api",
  );

  ValueNotifier<GraphQLClient> usersClient = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  GraphQLClient clientToQueryCourse() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
  }
}

String typenameDataIdFromObject(Object object) {
  if (object is Map<String, Object> &&
      object.containsKey('__typename') &&
      object.containsKey('id')) {
    return "${object['__typename']}/${object['id']}";
  }
  return null;
}

String readUsers = """
query {
  albums(options: {paginate: {page:1, limit:10}}){
    data{
      id
      title
      user{
        name
        username
        email
      }
    }
  }
}
""";
