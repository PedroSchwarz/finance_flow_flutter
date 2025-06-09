// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_transaction_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTransactionRequest {

 String get title; double get amount; TransactionType get type;@JsonKey(includeIfNull: false) String? get description;
/// Create a copy of CreateTransactionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransactionRequestCopyWith<CreateTransactionRequest> get copyWith => _$CreateTransactionRequestCopyWithImpl<CreateTransactionRequest>(this as CreateTransactionRequest, _$identity);

  /// Serializes this CreateTransactionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransactionRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,amount,type,description);

@override
String toString() {
  return 'CreateTransactionRequest(title: $title, amount: $amount, type: $type, description: $description)';
}


}

/// @nodoc
abstract mixin class $CreateTransactionRequestCopyWith<$Res>  {
  factory $CreateTransactionRequestCopyWith(CreateTransactionRequest value, $Res Function(CreateTransactionRequest) _then) = _$CreateTransactionRequestCopyWithImpl;
@useResult
$Res call({
 String title, double amount, TransactionType type,@JsonKey(includeIfNull: false) String? description
});




}
/// @nodoc
class _$CreateTransactionRequestCopyWithImpl<$Res>
    implements $CreateTransactionRequestCopyWith<$Res> {
  _$CreateTransactionRequestCopyWithImpl(this._self, this._then);

  final CreateTransactionRequest _self;
  final $Res Function(CreateTransactionRequest) _then;

/// Create a copy of CreateTransactionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? amount = null,Object? type = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CreateTransactionRequest implements CreateTransactionRequest {
  const _CreateTransactionRequest({required this.title, required this.amount, required this.type, @JsonKey(includeIfNull: false) this.description});
  factory _CreateTransactionRequest.fromJson(Map<String, dynamic> json) => _$CreateTransactionRequestFromJson(json);

@override final  String title;
@override final  double amount;
@override final  TransactionType type;
@override@JsonKey(includeIfNull: false) final  String? description;

/// Create a copy of CreateTransactionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransactionRequestCopyWith<_CreateTransactionRequest> get copyWith => __$CreateTransactionRequestCopyWithImpl<_CreateTransactionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTransactionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,amount,type,description);

@override
String toString() {
  return 'CreateTransactionRequest(title: $title, amount: $amount, type: $type, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CreateTransactionRequestCopyWith<$Res> implements $CreateTransactionRequestCopyWith<$Res> {
  factory _$CreateTransactionRequestCopyWith(_CreateTransactionRequest value, $Res Function(_CreateTransactionRequest) _then) = __$CreateTransactionRequestCopyWithImpl;
@override @useResult
$Res call({
 String title, double amount, TransactionType type,@JsonKey(includeIfNull: false) String? description
});




}
/// @nodoc
class __$CreateTransactionRequestCopyWithImpl<$Res>
    implements _$CreateTransactionRequestCopyWith<$Res> {
  __$CreateTransactionRequestCopyWithImpl(this._self, this._then);

  final _CreateTransactionRequest _self;
  final $Res Function(_CreateTransactionRequest) _then;

/// Create a copy of CreateTransactionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? amount = null,Object? type = null,Object? description = freezed,}) {
  return _then(_CreateTransactionRequest(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
