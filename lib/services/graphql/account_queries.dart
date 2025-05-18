const String getAccountQuery = r"""
  query GetAccount {
    account {
      id
      name
      subscription {
        type
        expiresAt
      }
      balance
      books {
        id
        title
        author
        coverUrl
      }
    }
  }
""";