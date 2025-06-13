import 'package:finance_flow/transactions/transactions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_group_transaction_request.freezed.dart';
part 'create_group_transaction_request.g.dart';

@freezed
abstract class CreateGroupTransactionRequest with _$CreateGroupTransactionRequest {
  const factory CreateGroupTransactionRequest({required double amount, required TransactionType type}) = _CreateGroupTransactionRequest;

  factory CreateGroupTransactionRequest.fromJson(Map<String, dynamic> json) => _$CreateGroupTransactionRequestFromJson(json);
}
