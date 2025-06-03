// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_group_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateGroupRequest _$UpdateGroupRequestFromJson(Map<String, dynamic> json) =>
    _UpdateGroupRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UpdateGroupRequestToJson(_UpdateGroupRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'members': instance.members,
    };
