const String getAccountQuery = r"""
  query GetAccount($userId: Long!) {
    account(userId: $userId) {
      name
      avatarUrl
      subscriptionActiveUntil
      subscription {
        name
      }
      wallet
      purchased {
        id
        name
        author {
          name
        }
        coverUrl
      }
    }
  }
""";