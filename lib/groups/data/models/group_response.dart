import 'package:finance_flow/transactions/transactions.dart';
import 'package:finance_flow/users/data/models/user_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'group_response.freezed.dart';
part 'group_response.g.dart';

@freezed
abstract class GroupResponse with _$GroupResponse {
  const factory GroupResponse({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String description,
    required double balance,
    required DateTime createdAt,
    required UserResponse owner,
    required List<UserResponse> members,
    required List<GroupTransactionResponse> transactions,
  }) = _GroupResponse;

  factory GroupResponse.fromJson(Map<String, dynamic> json) => _$GroupResponseFromJson(json);
}

@freezed
abstract class GroupTransactionResponse with _$GroupTransactionResponse {
  const factory GroupTransactionResponse({
    @JsonKey(name: '_id') required String id,
    required double amount,
    required TransactionType type,
    required UserResponse owner,
    required DateTime createdAt,
  }) = _GroupTransactionResponse;

  const GroupTransactionResponse._();

  factory GroupTransactionResponse.fromJson(Map<String, dynamic> json) => _$GroupTransactionResponseFromJson(json);

  String get formattedCreatedAt {
    final localDate = createdAt;
    final formatter = DateFormat('EEEE, d MMMM - hh:mm a');

    return formatter.format(localDate.toLocal());
  }
}
