import 'package:finance_flow/transactions/transactions.dart';
import 'package:flutter/widgets.dart';

class TransactionsRepository {
  const TransactionsRepository({required this.transactionsRemoteDataSource});

  @visibleForTesting
  final TransactionsRemoteDataSource transactionsRemoteDataSource;

  Future<List<TransactionResponse>> getTransactions() async {
    return transactionsRemoteDataSource.fetchAll();
  }

  Future<TransactionResponse> getTransactionById(String id) async {
    return transactionsRemoteDataSource.fetchById(id);
  }

  Future<void> create(CreateTransactionRequest request) async {
    return transactionsRemoteDataSource.create(request);
  }

  Future<void> delete(String id) async {
    return transactionsRemoteDataSource.delete(id);
  }
}
