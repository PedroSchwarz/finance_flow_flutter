import 'package:finance_flow/transactions/transactions.dart';
import 'package:finance_flow/users/users.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'transaction_response.freezed.dart';
part 'transaction_response.g.dart';

@freezed
abstract class TransactionResponse with _$TransactionResponse {
  const factory TransactionResponse({
    @JsonKey(name: '_id') required String id,
    required String title,
    required double amount,
    required TransactionType type,
    required UserResponse owner,
    required DateTime createdAt,
    String? description,
  }) = _TransactionResponse;

  const TransactionResponse._();

  factory TransactionResponse.fromJson(Map<String, dynamic> json) => _$TransactionResponseFromJson(json);

  String get formattedCreatedAt {
    final localDate = createdAt;
    final formatter = DateFormat('EEEE, d MMMM - hh:mm a');

    return formatter.format(localDate.toLocal());
  }
}
