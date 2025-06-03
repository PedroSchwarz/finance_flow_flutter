// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupResponse {

@JsonKey(name: '_id') String get id; String get name; String get description; DateTime get createdAt; UserResponse get owner; List<UserResponse> get members;
/// Create a copy of GroupResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupResponseCopyWith<GroupResponse> get copyWith => _$GroupResponseCopyWithImpl<GroupResponse>(this as GroupResponse, _$identity);

  /// Serializes this GroupResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.owner, owner) || other.owner == owner)&&const DeepCollectionEquality().equals(other.members, members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,createdAt,owner,const DeepCollectionEquality().hash(members));

@override
String toString() {
  return 'GroupResponse(id: $id, name: $name, description: $description, createdAt: $createdAt, owner: $owner, members: $members)';
}


}

/// @nodoc
abstract mixin class $GroupResponseCopyWith<$Res>  {
  factory $GroupResponseCopyWith(GroupResponse value, $Res Function(GroupResponse) _then) = _$GroupResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String description, DateTime createdAt, UserResponse owner, List<UserResponse> members
});


$UserResponseCopyWith<$Res> get owner;

}
/// @nodoc
class _$GroupResponseCopyWithImpl<$Res>
    implements $GroupResponseCopyWith<$Res> {
  _$GroupResponseCopyWithImpl(this._self, this._then);

  final GroupResponse _self;
  final $Res Function(GroupResponse) _then;

/// Create a copy of GroupResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? createdAt = null,Object? owner = null,Object? members = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as UserResponse,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<UserResponse>,
  ));
}
/// Create a copy of GroupResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserResponseCopyWith<$Res> get owner {
  
  return $UserResponseCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _GroupResponse implements GroupResponse {
  const _GroupResponse({@JsonKey(name: '_id') required this.id, required this.name, required this.description, required this.createdAt, required this.owner, required final  List<UserResponse> members}): _members = members;
  factory _GroupResponse.fromJson(Map<String, dynamic> json) => _$GroupResponseFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String name;
@override final  String description;
@override final  DateTime createdAt;
@override final  UserResponse owner;
 final  List<UserResponse> _members;
@override List<UserResponse> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}


/// Create a copy of GroupResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupResponseCopyWith<_GroupResponse> get copyWith => __$GroupResponseCopyWithImpl<_GroupResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.owner, owner) || other.owner == owner)&&const DeepCollectionEquality().equals(other._members, _members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,createdAt,owner,const DeepCollectionEquality().hash(_members));

@override
String toString() {
  return 'GroupResponse(id: $id, name: $name, description: $description, createdAt: $createdAt, owner: $owner, members: $members)';
}


}

/// @nodoc
abstract mixin class _$GroupResponseCopyWith<$Res> implements $GroupResponseCopyWith<$Res> {
  factory _$GroupResponseCopyWith(_GroupResponse value, $Res Function(_GroupResponse) _then) = __$GroupResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String description, DateTime createdAt, UserResponse owner, List<UserResponse> members
});


@override $UserResponseCopyWith<$Res> get owner;

}
/// @nodoc
class __$GroupResponseCopyWithImpl<$Res>
    implements _$GroupResponseCopyWith<$Res> {
  __$GroupResponseCopyWithImpl(this._self, this._then);

  final _GroupResponse _self;
  final $Res Function(_GroupResponse) _then;

/// Create a copy of GroupResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? createdAt = null,Object? owner = null,Object? members = null,}) {
  return _then(_GroupResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as UserResponse,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<UserResponse>,
  ));
}

/// Create a copy of GroupResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserResponseCopyWith<$Res> get owner {
  
  return $UserResponseCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}

// dart format on
