import 'package:finance_flow/transactions/data/models/transaction_values.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_transaction_request.freezed.dart';
part 'create_transaction_request.g.dart';

@freezed
abstract class CreateTransactionRequest with _$CreateTransactionRequest {
  const factory CreateTransactionRequest({
    required String title,
    required double amount,
    required TransactionType type,
    @JsonKey(includeIfNull: false) String? description,
  }) = _CreateTransactionRequest;

  factory CreateTransactionRequest.fromJson(Map<String, dynamic> json) => _$CreateTransactionRequestFromJson(json);
}
