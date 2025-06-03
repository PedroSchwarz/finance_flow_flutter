// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _AuthResponse(
      id: json['id'] as String,
      accessToken: json['access_token'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'access_token': instance.accessToken,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'createdAt': instance.createdAt.toIso8601String(),
    };
