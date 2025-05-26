import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static final HttpLink _httpLink = HttpLink(
    'http://localhost:5225/api/graphql',
  );

  static GraphQLClient initClient() {
    return GraphQLClient(
      link: _httpLink,
      cache: GraphQLCache(),
    );
  }
}