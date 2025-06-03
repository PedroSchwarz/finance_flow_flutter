// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_group_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateGroupRequest {

 String get name; String get description;
/// Create a copy of CreateGroupRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateGroupRequestCopyWith<CreateGroupRequest> get copyWith => _$CreateGroupRequestCopyWithImpl<CreateGroupRequest>(this as CreateGroupRequest, _$identity);

  /// Serializes this CreateGroupRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateGroupRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description);

@override
String toString() {
  return 'CreateGroupRequest(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $CreateGroupRequestCopyWith<$Res>  {
  factory $CreateGroupRequestCopyWith(CreateGroupRequest value, $Res Function(CreateGroupRequest) _then) = _$CreateGroupRequestCopyWithImpl;
@useResult
$Res call({
 String name, String description
});




}
/// @nodoc
class _$CreateGroupRequestCopyWithImpl<$Res>
    implements $CreateGroupRequestCopyWith<$Res> {
  _$CreateGroupRequestCopyWithImpl(this._self, this._then);

  final CreateGroupRequest _self;
  final $Res Function(CreateGroupRequest) _then;

/// Create a copy of CreateGroupRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CreateGroupRequest implements CreateGroupRequest {
  const _CreateGroupRequest({required this.name, required this.description});
  factory _CreateGroupRequest.fromJson(Map<String, dynamic> json) => _$CreateGroupRequestFromJson(json);

@override final  String name;
@override final  String description;

/// Create a copy of CreateGroupRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateGroupRequestCopyWith<_CreateGroupRequest> get copyWith => __$CreateGroupRequestCopyWithImpl<_CreateGroupRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateGroupRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateGroupRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description);

@override
String toString() {
  return 'CreateGroupRequest(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CreateGroupRequestCopyWith<$Res> implements $CreateGroupRequestCopyWith<$Res> {
  factory _$CreateGroupRequestCopyWith(_CreateGroupRequest value, $Res Function(_CreateGroupRequest) _then) = __$CreateGroupRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String description
});




}
/// @nodoc
class __$CreateGroupRequestCopyWithImpl<$Res>
    implements _$CreateGroupRequestCopyWith<$Res> {
  __$CreateGroupRequestCopyWithImpl(this._self, this._then);

  final _CreateGroupRequest _self;
  final $Res Function(_CreateGroupRequest) _then;

/// Create a copy of CreateGroupRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,}) {
  return _then(_CreateGroupRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
