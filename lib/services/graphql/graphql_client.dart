import 'dart:io';
import 'package:http/io_client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static final HttpLink _httpLink = HttpLink(
    'https://localhost:5225/api/graphql',
    httpClient: IOClient(HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true)
  );

  static GraphQLClient initClient() {
    return GraphQLClient(
      link: _httpLink,
      cache: GraphQLCache(),
    );
  }
}