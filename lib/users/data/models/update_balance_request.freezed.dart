// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_balance_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateBalanceRequest {

 double get amount;
/// Create a copy of UpdateBalanceRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateBalanceRequestCopyWith<UpdateBalanceRequest> get copyWith => _$UpdateBalanceRequestCopyWithImpl<UpdateBalanceRequest>(this as UpdateBalanceRequest, _$identity);

  /// Serializes this UpdateBalanceRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateBalanceRequest&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'UpdateBalanceRequest(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $UpdateBalanceRequestCopyWith<$Res>  {
  factory $UpdateBalanceRequestCopyWith(UpdateBalanceRequest value, $Res Function(UpdateBalanceRequest) _then) = _$UpdateBalanceRequestCopyWithImpl;
@useResult
$Res call({
 double amount
});




}
/// @nodoc
class _$UpdateBalanceRequestCopyWithImpl<$Res>
    implements $UpdateBalanceRequestCopyWith<$Res> {
  _$UpdateBalanceRequestCopyWithImpl(this._self, this._then);

  final UpdateBalanceRequest _self;
  final $Res Function(UpdateBalanceRequest) _then;

/// Create a copy of UpdateBalanceRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UpdateBalanceRequest implements UpdateBalanceRequest {
  const _UpdateBalanceRequest({required this.amount});
  factory _UpdateBalanceRequest.fromJson(Map<String, dynamic> json) => _$UpdateBalanceRequestFromJson(json);

@override final  double amount;

/// Create a copy of UpdateBalanceRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateBalanceRequestCopyWith<_UpdateBalanceRequest> get copyWith => __$UpdateBalanceRequestCopyWithImpl<_UpdateBalanceRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateBalanceRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateBalanceRequest&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'UpdateBalanceRequest(amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$UpdateBalanceRequestCopyWith<$Res> implements $UpdateBalanceRequestCopyWith<$Res> {
  factory _$UpdateBalanceRequestCopyWith(_UpdateBalanceRequest value, $Res Function(_UpdateBalanceRequest) _then) = __$UpdateBalanceRequestCopyWithImpl;
@override @useResult
$Res call({
 double amount
});




}
/// @nodoc
class __$UpdateBalanceRequestCopyWithImpl<$Res>
    implements _$UpdateBalanceRequestCopyWith<$Res> {
  __$UpdateBalanceRequestCopyWithImpl(this._self, this._then);

  final _UpdateBalanceRequest _self;
  final $Res Function(_UpdateBalanceRequest) _then;

/// Create a copy of UpdateBalanceRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(_UpdateBalanceRequest(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
