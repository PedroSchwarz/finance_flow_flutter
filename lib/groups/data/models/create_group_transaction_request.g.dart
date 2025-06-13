// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_group_transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateGroupTransactionRequest _$CreateGroupTransactionRequestFromJson(
  Map<String, dynamic> json,
) => _CreateGroupTransactionRequest(
  amount: (json['amount'] as num).toDouble(),
  type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
);

Map<String, dynamic> _$CreateGroupTransactionRequestToJson(
  _CreateGroupTransactionRequest instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'type': _$TransactionTypeEnumMap[instance.type]!,
};

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
};
