// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InviteResponse _$InviteResponseFromJson(Map<String, dynamic> json) =>
    _InviteResponse(
      id: json['_id'] as String,
      from: UserResponse.fromJson(json['from'] as Map<String, dynamic>),
      group: InviteGroupResponse.fromJson(
        json['group'] as Map<String, dynamic>,
      ),
      status: $enumDecode(_$InviteStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$InviteResponseToJson(_InviteResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'from': instance.from,
      'group': instance.group,
      'status': _$InviteStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$InviteStatusEnumMap = {
  InviteStatus.pending: 'pending',
  InviteStatus.accepted: 'accepted',
  InviteStatus.rejected: 'rejected',
};

_InviteGroupResponse _$InviteGroupResponseFromJson(Map<String, dynamic> json) =>
    _InviteGroupResponse(
      id: json['_id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$InviteGroupResponseToJson(
  _InviteGroupResponse instance,
) => <String, dynamic>{'_id': instance.id, 'name': instance.name};
