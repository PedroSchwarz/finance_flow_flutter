// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) =>
    _TransactionResponse(
      id: json['_id'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      owner: UserResponse.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TransactionResponseToJson(
  _TransactionResponse instance,
) => <String, dynamic>{
  '_id': instance.id,
  'title': instance.title,
  'amount': instance.amount,
  'type': _$TransactionTypeEnumMap[instance.type]!,
  'owner': instance.owner,
  'createdAt': instance.createdAt.toIso8601String(),
  'description': instance.description,
};

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
};
