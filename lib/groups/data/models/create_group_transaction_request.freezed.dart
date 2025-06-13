// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_group_transaction_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateGroupTransactionRequest {

 double get amount; TransactionType get type;
/// Create a copy of CreateGroupTransactionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateGroupTransactionRequestCopyWith<CreateGroupTransactionRequest> get copyWith => _$CreateGroupTransactionRequestCopyWithImpl<CreateGroupTransactionRequest>(this as CreateGroupTransactionRequest, _$identity);

  /// Serializes this CreateGroupTransactionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateGroupTransactionRequest&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,type);

@override
String toString() {
  return 'CreateGroupTransactionRequest(amount: $amount, type: $type)';
}


}

/// @nodoc
abstract mixin class $CreateGroupTransactionRequestCopyWith<$Res>  {
  factory $CreateGroupTransactionRequestCopyWith(CreateGroupTransactionRequest value, $Res Function(CreateGroupTransactionRequest) _then) = _$CreateGroupTransactionRequestCopyWithImpl;
@useResult
$Res call({
 double amount, TransactionType type
});




}
/// @nodoc
class _$CreateGroupTransactionRequestCopyWithImpl<$Res>
    implements $CreateGroupTransactionRequestCopyWith<$Res> {
  _$CreateGroupTransactionRequestCopyWithImpl(this._self, this._then);

  final CreateGroupTransactionRequest _self;
  final $Res Function(CreateGroupTransactionRequest) _then;

/// Create a copy of CreateGroupTransactionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? type = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CreateGroupTransactionRequest implements CreateGroupTransactionRequest {
  const _CreateGroupTransactionRequest({required this.amount, required this.type});
  factory _CreateGroupTransactionRequest.fromJson(Map<String, dynamic> json) => _$CreateGroupTransactionRequestFromJson(json);

@override final  double amount;
@override final  TransactionType type;

/// Create a copy of CreateGroupTransactionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateGroupTransactionRequestCopyWith<_CreateGroupTransactionRequest> get copyWith => __$CreateGroupTransactionRequestCopyWithImpl<_CreateGroupTransactionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateGroupTransactionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateGroupTransactionRequest&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,type);

@override
String toString() {
  return 'CreateGroupTransactionRequest(amount: $amount, type: $type)';
}


}

/// @nodoc
abstract mixin class _$CreateGroupTransactionRequestCopyWith<$Res> implements $CreateGroupTransactionRequestCopyWith<$Res> {
  factory _$CreateGroupTransactionRequestCopyWith(_CreateGroupTransactionRequest value, $Res Function(_CreateGroupTransactionRequest) _then) = __$CreateGroupTransactionRequestCopyWithImpl;
@override @useResult
$Res call({
 double amount, TransactionType type
});




}
/// @nodoc
class __$CreateGroupTransactionRequestCopyWithImpl<$Res>
    implements _$CreateGroupTransactionRequestCopyWith<$Res> {
  __$CreateGroupTransactionRequestCopyWithImpl(this._self, this._then);

  final _CreateGroupTransactionRequest _self;
  final $Res Function(_CreateGroupTransactionRequest) _then;

/// Create a copy of CreateGroupTransactionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? type = null,}) {
  return _then(_CreateGroupTransactionRequest(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,
  ));
}


}

// dart format on
