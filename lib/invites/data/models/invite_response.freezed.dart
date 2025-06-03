// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InviteResponse {

@JsonKey(name: '_id') String get id; UserResponse get from; InviteGroupResponse get group; InviteStatus get status; DateTime get createdAt;
/// Create a copy of InviteResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteResponseCopyWith<InviteResponse> get copyWith => _$InviteResponseCopyWithImpl<InviteResponse>(this as InviteResponse, _$identity);

  /// Serializes this InviteResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.from, from) || other.from == from)&&(identical(other.group, group) || other.group == group)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,from,group,status,createdAt);

@override
String toString() {
  return 'InviteResponse(id: $id, from: $from, group: $group, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $InviteResponseCopyWith<$Res>  {
  factory $InviteResponseCopyWith(InviteResponse value, $Res Function(InviteResponse) _then) = _$InviteResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, UserResponse from, InviteGroupResponse group, InviteStatus status, DateTime createdAt
});


$UserResponseCopyWith<$Res> get from;$InviteGroupResponseCopyWith<$Res> get group;

}
/// @nodoc
class _$InviteResponseCopyWithImpl<$Res>
    implements $InviteResponseCopyWith<$Res> {
  _$InviteResponseCopyWithImpl(this._self, this._then);

  final InviteResponse _self;
  final $Res Function(InviteResponse) _then;

/// Create a copy of InviteResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? from = null,Object? group = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as UserResponse,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as InviteGroupResponse,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InviteStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of InviteResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserResponseCopyWith<$Res> get from {
  
  return $UserResponseCopyWith<$Res>(_self.from, (value) {
    return _then(_self.copyWith(from: value));
  });
}/// Create a copy of InviteResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InviteGroupResponseCopyWith<$Res> get group {
  
  return $InviteGroupResponseCopyWith<$Res>(_self.group, (value) {
    return _then(_self.copyWith(group: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _InviteResponse implements InviteResponse {
  const _InviteResponse({@JsonKey(name: '_id') required this.id, required this.from, required this.group, required this.status, required this.createdAt});
  factory _InviteResponse.fromJson(Map<String, dynamic> json) => _$InviteResponseFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  UserResponse from;
@override final  InviteGroupResponse group;
@override final  InviteStatus status;
@override final  DateTime createdAt;

/// Create a copy of InviteResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InviteResponseCopyWith<_InviteResponse> get copyWith => __$InviteResponseCopyWithImpl<_InviteResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InviteResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InviteResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.from, from) || other.from == from)&&(identical(other.group, group) || other.group == group)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,from,group,status,createdAt);

@override
String toString() {
  return 'InviteResponse(id: $id, from: $from, group: $group, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$InviteResponseCopyWith<$Res> implements $InviteResponseCopyWith<$Res> {
  factory _$InviteResponseCopyWith(_InviteResponse value, $Res Function(_InviteResponse) _then) = __$InviteResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, UserResponse from, InviteGroupResponse group, InviteStatus status, DateTime createdAt
});


@override $UserResponseCopyWith<$Res> get from;@override $InviteGroupResponseCopyWith<$Res> get group;

}
/// @nodoc
class __$InviteResponseCopyWithImpl<$Res>
    implements _$InviteResponseCopyWith<$Res> {
  __$InviteResponseCopyWithImpl(this._self, this._then);

  final _InviteResponse _self;
  final $Res Function(_InviteResponse) _then;

/// Create a copy of InviteResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? from = null,Object? group = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_InviteResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as UserResponse,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as InviteGroupResponse,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InviteStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of InviteResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserResponseCopyWith<$Res> get from {
  
  return $UserResponseCopyWith<$Res>(_self.from, (value) {
    return _then(_self.copyWith(from: value));
  });
}/// Create a copy of InviteResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InviteGroupResponseCopyWith<$Res> get group {
  
  return $InviteGroupResponseCopyWith<$Res>(_self.group, (value) {
    return _then(_self.copyWith(group: value));
  });
}
}


/// @nodoc
mixin _$InviteGroupResponse {

@JsonKey(name: '_id') String get id; String get name;
/// Create a copy of InviteGroupResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteGroupResponseCopyWith<InviteGroupResponse> get copyWith => _$InviteGroupResponseCopyWithImpl<InviteGroupResponse>(this as InviteGroupResponse, _$identity);

  /// Serializes this InviteGroupResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteGroupResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'InviteGroupResponse(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $InviteGroupResponseCopyWith<$Res>  {
  factory $InviteGroupResponseCopyWith(InviteGroupResponse value, $Res Function(InviteGroupResponse) _then) = _$InviteGroupResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String name
});




}
/// @nodoc
class _$InviteGroupResponseCopyWithImpl<$Res>
    implements $InviteGroupResponseCopyWith<$Res> {
  _$InviteGroupResponseCopyWithImpl(this._self, this._then);

  final InviteGroupResponse _self;
  final $Res Function(InviteGroupResponse) _then;

/// Create a copy of InviteGroupResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _InviteGroupResponse implements InviteGroupResponse {
  const _InviteGroupResponse({@JsonKey(name: '_id') required this.id, required this.name});
  factory _InviteGroupResponse.fromJson(Map<String, dynamic> json) => _$InviteGroupResponseFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String name;

/// Create a copy of InviteGroupResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InviteGroupResponseCopyWith<_InviteGroupResponse> get copyWith => __$InviteGroupResponseCopyWithImpl<_InviteGroupResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InviteGroupResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InviteGroupResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'InviteGroupResponse(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$InviteGroupResponseCopyWith<$Res> implements $InviteGroupResponseCopyWith<$Res> {
  factory _$InviteGroupResponseCopyWith(_InviteGroupResponse value, $Res Function(_InviteGroupResponse) _then) = __$InviteGroupResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String name
});




}
/// @nodoc
class __$InviteGroupResponseCopyWithImpl<$Res>
    implements _$InviteGroupResponseCopyWith<$Res> {
  __$InviteGroupResponseCopyWithImpl(this._self, this._then);

  final _InviteGroupResponse _self;
  final $Res Function(_InviteGroupResponse) _then;

/// Create a copy of InviteGroupResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_InviteGroupResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
