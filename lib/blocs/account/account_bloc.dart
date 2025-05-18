import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'account_event.dart';
import 'account_state.dart';
import '../../services/graphql/graphql_client.dart';
import '../../services/graphql/account_queries.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<LoadAccount>(_onLoadAccount);
  }

  Future<void> _onLoadAccount(
      LoadAccount event,
      Emitter<AccountState> emit,
      ) async {
    emit(AccountLoading());
    final client = GraphQLService.initClient();
    try {
      final result = await client.query(
        QueryOptions(document: gql(getAccountQuery)),
      );
      if (result.hasException) {
        emit(AccountError(result.exception.toString()));
      } else {
        emit(AccountLoaded(result.data!['account']));
      }
    } catch (e) {
      emit(AccountError(e.toString()));
    }
  }
}