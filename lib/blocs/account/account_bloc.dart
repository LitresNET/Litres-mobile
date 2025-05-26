import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:litres_mobile/services/auth/auth_storage.dart';
import 'account_event.dart';
import 'account_state.dart';
import '../../services/graphql/graphql_client.dart';
import '../../services/graphql/account_queries.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final GraphQLClient _client = GraphQLService.initClient();

  AccountBloc() : super(AccountInitial()) {
    on<LoadAccount>((event, emit) async {
      emit(AccountLoading());

      try {
        final QueryResult result = await _client.query(
          QueryOptions(
            document: gql(getAccountQuery),
            variables: {
              'userId': AuthStorage().getUserId,
            },
          ),
        );

        if (result.hasException) {
          emit(AccountError(result.exception.toString()));
          return;
        }

        final data = result.data?['account'];
        if (data != null) {
          emit(AccountLoaded(data));
        } else {
          emit(AccountError('No account data found'));
        }
      } catch (e) {
        emit(AccountError(e.toString()));
      }
    });
  }
}