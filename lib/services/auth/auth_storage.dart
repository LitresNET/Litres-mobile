class AuthStorage {
  static final AuthStorage _instance = AuthStorage._internal();

  factory AuthStorage() => _instance;

  AuthStorage._internal();

  int? userId;
  String? token;

  void setUserId(int id) => userId = id;
  void setUserToken(String token) => this.token = token;

  int? get getUserId => userId;
  String? get getUserToken => token;
}
