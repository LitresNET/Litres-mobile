import 'package:equatable/equatable.dart';
import '../../services/graphql/account_queries.dart';

abstract class AccountState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AccountInitial extends AccountState {}
class AccountLoading extends AccountState {}
class AccountLoaded extends AccountState {
  final dynamic account;
  AccountLoaded(this.account);
  @override List<Object?> get props => [account];
}
class AccountError extends AccountState {
  final String message;
  AccountError(this.message);
  @override List<Object?> get props => [message];
}