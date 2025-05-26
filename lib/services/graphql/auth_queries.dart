const String authenticateUser = r"""
  mutation SignIn($email: String!, $password: String!) {
    signIn(email: $email, password: $password) {
      userId
      token
    }
  }
""";

const String registerUser = r'''
mutation RegisterUser($name: String!, $email: String!, $password: String!) {
  signUp(name: $name, email: $email, password: $password) {
    userId
    token
  }
}
''';
