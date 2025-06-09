import 'package:finance_flow/auth/data/repository/auth_repository.dart';
import 'package:finance_flow/users/data/data_sources/users_remote_data_source.dart';
import 'package:finance_flow/users/data/models/update_balance_request.dart';
import 'package:finance_flow/users/data/models/user_response.dart';
import 'package:flutter/foundation.dart';

class UsersRepository {
  const UsersRepository({required this.authRepository, required this.usersRemoteDataSource});

  @visibleForTesting
  final AuthRepository authRepository;

  @visibleForTesting
  final UsersRemoteDataSource usersRemoteDataSource;

  Future<List<UserResponse>> getUsers() async {
    return usersRemoteDataSource.fetchAll();
  }

  Future<double> getBalance() async {
    final balance = await usersRemoteDataSource.getBalance();
    return double.tryParse(balance) ?? 0.0;
  }

  Future<void> updateBalance(double amount) async {
    return usersRemoteDataSource.updateBalance(UpdateBalanceRequest(amount: amount));
  }
}
