// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTransactionRequest _$CreateTransactionRequestFromJson(
  Map<String, dynamic> json,
) => _CreateTransactionRequest(
  title: json['title'] as String,
  amount: (json['amount'] as num).toDouble(),
  type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
  description: json['description'] as String?,
);

Map<String, dynamic> _$CreateTransactionRequestToJson(
  _CreateTransactionRequest instance,
) => <String, dynamic>{
  'title': instance.title,
  'amount': instance.amount,
  'type': _$TransactionTypeEnumMap[instance.type]!,
  if (instance.description case final value?) 'description': value,
};

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
};
