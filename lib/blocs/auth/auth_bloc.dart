import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:litres_mobile/services/graphql/auth_queries.dart';
import 'package:litres_mobile/services/graphql/graphql_client.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GraphQLClient _client = GraphQLService.initClient();
  
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      
      try {
        final QueryResult<dynamic> result = await _client.mutate(
          MutationOptions(
            document: gql(authenticateUser),
            variables: {
              'email': event.props[0],
              'password': event.props[1]
            },
          ),
        );

        if (result.hasException) {
          emit(AuthError(result.exception.toString()));
          return;
        }

        final data = result.data?['signIn'];
        if (data == null || data['userId'] == -1) {
          emit(AuthError('No such account found or password is wrong'));
        } else {
          emit(AuthSuccess(userId: data['userId'], token: data['token']));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) {
      emit(AuthInitial());
    });

    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final result = await _client.mutate(
          MutationOptions(
            document: gql(registerUser),
            variables: {
              'name': event.name,
              'email': event.email,
              'password': event.password,
            },
          ),
        );

        if (result.hasException) {
          emit(AuthError(result.exception.toString()));
          return;
        }

        final data = result.data?['signUp'];
        if (data != null) {
          emit(AuthSuccess(userId: data['userId'], token: data['token']));
        } else {
          emit(AuthError('Registration failed. Please try again.'));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });


  }
}


