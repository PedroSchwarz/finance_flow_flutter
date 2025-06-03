// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_group_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateGroupRequest {

 String get name; String get description; List<String> get members;
/// Create a copy of UpdateGroupRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateGroupRequestCopyWith<UpdateGroupRequest> get copyWith => _$UpdateGroupRequestCopyWithImpl<UpdateGroupRequest>(this as UpdateGroupRequest, _$identity);

  /// Serializes this UpdateGroupRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateGroupRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.members, members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(members));

@override
String toString() {
  return 'UpdateGroupRequest(name: $name, description: $description, members: $members)';
}


}

/// @nodoc
abstract mixin class $UpdateGroupRequestCopyWith<$Res>  {
  factory $UpdateGroupRequestCopyWith(UpdateGroupRequest value, $Res Function(UpdateGroupRequest) _then) = _$UpdateGroupRequestCopyWithImpl;
@useResult
$Res call({
 String name, String description, List<String> members
});




}
/// @nodoc
class _$UpdateGroupRequestCopyWithImpl<$Res>
    implements $UpdateGroupRequestCopyWith<$Res> {
  _$UpdateGroupRequestCopyWithImpl(this._self, this._then);

  final UpdateGroupRequest _self;
  final $Res Function(UpdateGroupRequest) _then;

/// Create a copy of UpdateGroupRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? members = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UpdateGroupRequest implements UpdateGroupRequest {
  const _UpdateGroupRequest({required this.name, required this.description, required final  List<String> members}): _members = members;
  factory _UpdateGroupRequest.fromJson(Map<String, dynamic> json) => _$UpdateGroupRequestFromJson(json);

@override final  String name;
@override final  String description;
 final  List<String> _members;
@override List<String> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}


/// Create a copy of UpdateGroupRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateGroupRequestCopyWith<_UpdateGroupRequest> get copyWith => __$UpdateGroupRequestCopyWithImpl<_UpdateGroupRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateGroupRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateGroupRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._members, _members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(_members));

@override
String toString() {
  return 'UpdateGroupRequest(name: $name, description: $description, members: $members)';
}


}

/// @nodoc
abstract mixin class _$UpdateGroupRequestCopyWith<$Res> implements $UpdateGroupRequestCopyWith<$Res> {
  factory _$UpdateGroupRequestCopyWith(_UpdateGroupRequest value, $Res Function(_UpdateGroupRequest) _then) = __$UpdateGroupRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, List<String> members
});




}
/// @nodoc
class __$UpdateGroupRequestCopyWithImpl<$Res>
    implements _$UpdateGroupRequestCopyWith<$Res> {
  __$UpdateGroupRequestCopyWithImpl(this._self, this._then);

  final _UpdateGroupRequest _self;
  final $Res Function(_UpdateGroupRequest) _then;

/// Create a copy of UpdateGroupRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? members = null,}) {
  return _then(_UpdateGroupRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
