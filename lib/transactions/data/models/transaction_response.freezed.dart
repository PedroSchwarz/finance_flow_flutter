// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionResponse {

@JsonKey(name: '_id') String get id; String get title; double get amount; TransactionType get type; UserResponse get owner; DateTime get createdAt; String? get description;
/// Create a copy of TransactionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionResponseCopyWith<TransactionResponse> get copyWith => _$TransactionResponseCopyWithImpl<TransactionResponse>(this as TransactionResponse, _$identity);

  /// Serializes this TransactionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount,type,owner,createdAt,description);

@override
String toString() {
  return 'TransactionResponse(id: $id, title: $title, amount: $amount, type: $type, owner: $owner, createdAt: $createdAt, description: $description)';
}


}

/// @nodoc
abstract mixin class $TransactionResponseCopyWith<$Res>  {
  factory $TransactionResponseCopyWith(TransactionResponse value, $Res Function(TransactionResponse) _then) = _$TransactionResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String title, double amount, TransactionType type, UserResponse owner, DateTime createdAt, String? description
});


$UserResponseCopyWith<$Res> get owner;

}
/// @nodoc
class _$TransactionResponseCopyWithImpl<$Res>
    implements $TransactionResponseCopyWith<$Res> {
  _$TransactionResponseCopyWithImpl(this._self, this._then);

  final TransactionResponse _self;
  final $Res Function(TransactionResponse) _then;

/// Create a copy of TransactionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? amount = null,Object? type = null,Object? owner = null,Object? createdAt = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as UserResponse,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TransactionResponse
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

class _TransactionResponse extends TransactionResponse {
  const _TransactionResponse({@JsonKey(name: '_id') required this.id, required this.title, required this.amount, required this.type, required this.owner, required this.createdAt, this.description}): super._();
  factory _TransactionResponse.fromJson(Map<String, dynamic> json) => _$TransactionResponseFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String title;
@override final  double amount;
@override final  TransactionType type;
@override final  UserResponse owner;
@override final  DateTime createdAt;
@override final  String? description;

/// Create a copy of TransactionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionResponseCopyWith<_TransactionResponse> get copyWith => __$TransactionResponseCopyWithImpl<_TransactionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount,type,owner,createdAt,description);

@override
String toString() {
  return 'TransactionResponse(id: $id, title: $title, amount: $amount, type: $type, owner: $owner, createdAt: $createdAt, description: $description)';
}


}

/// @nodoc
abstract mixin class _$TransactionResponseCopyWith<$Res> implements $TransactionResponseCopyWith<$Res> {
  factory _$TransactionResponseCopyWith(_TransactionResponse value, $Res Function(_TransactionResponse) _then) = __$TransactionResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String title, double amount, TransactionType type, UserResponse owner, DateTime createdAt, String? description
});


@override $UserResponseCopyWith<$Res> get owner;

}
/// @nodoc
class __$TransactionResponseCopyWithImpl<$Res>
    implements _$TransactionResponseCopyWith<$Res> {
  __$TransactionResponseCopyWithImpl(this._self, this._then);

  final _TransactionResponse _self;
  final $Res Function(_TransactionResponse) _then;

/// Create a copy of TransactionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? amount = null,Object? type = null,Object? owner = null,Object? createdAt = null,Object? description = freezed,}) {
  return _then(_TransactionResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as UserResponse,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TransactionResponse
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
