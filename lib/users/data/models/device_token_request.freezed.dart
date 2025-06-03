// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_token_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceTokenRequest {

 String get token;
/// Create a copy of DeviceTokenRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceTokenRequestCopyWith<DeviceTokenRequest> get copyWith => _$DeviceTokenRequestCopyWithImpl<DeviceTokenRequest>(this as DeviceTokenRequest, _$identity);

  /// Serializes this DeviceTokenRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceTokenRequest&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'DeviceTokenRequest(token: $token)';
}


}

/// @nodoc
abstract mixin class $DeviceTokenRequestCopyWith<$Res>  {
  factory $DeviceTokenRequestCopyWith(DeviceTokenRequest value, $Res Function(DeviceTokenRequest) _then) = _$DeviceTokenRequestCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class _$DeviceTokenRequestCopyWithImpl<$Res>
    implements $DeviceTokenRequestCopyWith<$Res> {
  _$DeviceTokenRequestCopyWithImpl(this._self, this._then);

  final DeviceTokenRequest _self;
  final $Res Function(DeviceTokenRequest) _then;

/// Create a copy of DeviceTokenRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DeviceTokenRequest implements DeviceTokenRequest {
  const _DeviceTokenRequest({required this.token});
  factory _DeviceTokenRequest.fromJson(Map<String, dynamic> json) => _$DeviceTokenRequestFromJson(json);

@override final  String token;

/// Create a copy of DeviceTokenRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceTokenRequestCopyWith<_DeviceTokenRequest> get copyWith => __$DeviceTokenRequestCopyWithImpl<_DeviceTokenRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceTokenRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceTokenRequest&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'DeviceTokenRequest(token: $token)';
}


}

/// @nodoc
abstract mixin class _$DeviceTokenRequestCopyWith<$Res> implements $DeviceTokenRequestCopyWith<$Res> {
  factory _$DeviceTokenRequestCopyWith(_DeviceTokenRequest value, $Res Function(_DeviceTokenRequest) _then) = __$DeviceTokenRequestCopyWithImpl;
@override @useResult
$Res call({
 String token
});




}
/// @nodoc
class __$DeviceTokenRequestCopyWithImpl<$Res>
    implements _$DeviceTokenRequestCopyWith<$Res> {
  __$DeviceTokenRequestCopyWithImpl(this._self, this._then);

  final _DeviceTokenRequest _self;
  final $Res Function(_DeviceTokenRequest) _then;

/// Create a copy of DeviceTokenRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(_DeviceTokenRequest(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
