// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_invite_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateInviteRequest _$CreateInviteRequestFromJson(Map<String, dynamic> json) =>
    _CreateInviteRequest(
      to: json['to'] as String,
      groupId: json['groupId'] as String,
    );

Map<String, dynamic> _$CreateInviteRequestToJson(
  _CreateInviteRequest instance,
) => <String, dynamic>{'to': instance.to, 'groupId': instance.groupId};
