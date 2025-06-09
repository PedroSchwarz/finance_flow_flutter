// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateTransactionState {

 bool get isLoading; double get amount; String get title; TransactionType get type; bool get isSubmitting; bool get shouldGoBack; String? get description;
/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransactionStateCopyWith<CreateTransactionState> get copyWith => _$CreateTransactionStateCopyWithImpl<CreateTransactionState>(this as CreateTransactionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransactionState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.shouldGoBack, shouldGoBack) || other.shouldGoBack == shouldGoBack)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,amount,title,type,isSubmitting,shouldGoBack,description);

@override
String toString() {
  return 'CreateTransactionState(isLoading: $isLoading, amount: $amount, title: $title, type: $type, isSubmitting: $isSubmitting, shouldGoBack: $shouldGoBack, description: $description)';
}


}

/// @nodoc
abstract mixin class $CreateTransactionStateCopyWith<$Res>  {
  factory $CreateTransactionStateCopyWith(CreateTransactionState value, $Res Function(CreateTransactionState) _then) = _$CreateTransactionStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, double amount, String title, TransactionType type, bool isSubmitting, bool shouldGoBack, String? description
});




}
/// @nodoc
class _$CreateTransactionStateCopyWithImpl<$Res>
    implements $CreateTransactionStateCopyWith<$Res> {
  _$CreateTransactionStateCopyWithImpl(this._self, this._then);

  final CreateTransactionState _self;
  final $Res Function(CreateTransactionState) _then;

/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? amount = null,Object? title = null,Object? type = null,Object? isSubmitting = null,Object? shouldGoBack = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,shouldGoBack: null == shouldGoBack ? _self.shouldGoBack : shouldGoBack // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _CreateTransactionState extends CreateTransactionState {
  const _CreateTransactionState({required this.isLoading, required this.amount, required this.title, required this.type, required this.isSubmitting, required this.shouldGoBack, this.description}): super._();
  

@override final  bool isLoading;
@override final  double amount;
@override final  String title;
@override final  TransactionType type;
@override final  bool isSubmitting;
@override final  bool shouldGoBack;
@override final  String? description;

/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransactionStateCopyWith<_CreateTransactionState> get copyWith => __$CreateTransactionStateCopyWithImpl<_CreateTransactionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.shouldGoBack, shouldGoBack) || other.shouldGoBack == shouldGoBack)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,amount,title,type,isSubmitting,shouldGoBack,description);

@override
String toString() {
  return 'CreateTransactionState(isLoading: $isLoading, amount: $amount, title: $title, type: $type, isSubmitting: $isSubmitting, shouldGoBack: $shouldGoBack, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CreateTransactionStateCopyWith<$Res> implements $CreateTransactionStateCopyWith<$Res> {
  factory _$CreateTransactionStateCopyWith(_CreateTransactionState value, $Res Function(_CreateTransactionState) _then) = __$CreateTransactionStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, double amount, String title, TransactionType type, bool isSubmitting, bool shouldGoBack, String? description
});




}
/// @nodoc
class __$CreateTransactionStateCopyWithImpl<$Res>
    implements _$CreateTransactionStateCopyWith<$Res> {
  __$CreateTransactionStateCopyWithImpl(this._self, this._then);

  final _CreateTransactionState _self;
  final $Res Function(_CreateTransactionState) _then;

/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? amount = null,Object? title = null,Object? type = null,Object? isSubmitting = null,Object? shouldGoBack = null,Object? description = freezed,}) {
  return _then(_CreateTransactionState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,shouldGoBack: null == shouldGoBack ? _self.shouldGoBack : shouldGoBack // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
