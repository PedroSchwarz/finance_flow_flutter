// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroupResponse _$GroupResponseFromJson(Map<String, dynamic> json) =>
    _GroupResponse(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      owner: UserResponse.fromJson(json['owner'] as Map<String, dynamic>),
      members:
          (json['members'] as List<dynamic>)
              .map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$GroupResponseToJson(_GroupResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'owner': instance.owner,
      'members': instance.members,
    };
