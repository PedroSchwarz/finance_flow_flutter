// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroupResponse _$GroupResponseFromJson(
  Map<String, dynamic> json,
) => _GroupResponse(
  id: json['_id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  balance: (json['balance'] as num).toDouble(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  owner: UserResponse.fromJson(json['owner'] as Map<String, dynamic>),
  members:
      (json['members'] as List<dynamic>)
          .map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
  transactions:
      (json['transactions'] as List<dynamic>)
          .map(
            (e) => GroupTransactionResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$GroupResponseToJson(_GroupResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'balance': instance.balance,
      'createdAt': instance.createdAt.toIso8601String(),
      'owner': instance.owner,
      'members': instance.members,
      'transactions': instance.transactions,
    };

_GroupTransactionResponse _$GroupTransactionResponseFromJson(
  Map<String, dynamic> json,
) => _GroupTransactionResponse(
  id: json['_id'] as String,
  amount: (json['amount'] as num).toDouble(),
  type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
  owner: UserResponse.fromJson(json['owner'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$GroupTransactionResponseToJson(
  _GroupTransactionResponse instance,
) => <String, dynamic>{
  '_id': instance.id,
  'amount': instance.amount,
  'type': _$TransactionTypeEnumMap[instance.type]!,
  'owner': instance.owner,
  'createdAt': instance.createdAt.toIso8601String(),
};

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
};
