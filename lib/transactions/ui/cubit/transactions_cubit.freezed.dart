// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionsState {

 bool get isLoading; DateTime get selectedDate; List<TransactionResponse> get transactions; bool get isRefreshing; TransactionResponse? get transactionToBeDeleted;
/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsStateCopyWith<TransactionsState> get copyWith => _$TransactionsStateCopyWithImpl<TransactionsState>(this as TransactionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.transactionToBeDeleted, transactionToBeDeleted) || other.transactionToBeDeleted == transactionToBeDeleted));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,selectedDate,const DeepCollectionEquality().hash(transactions),isRefreshing,transactionToBeDeleted);

@override
String toString() {
  return 'TransactionsState(isLoading: $isLoading, selectedDate: $selectedDate, transactions: $transactions, isRefreshing: $isRefreshing, transactionToBeDeleted: $transactionToBeDeleted)';
}


}

/// @nodoc
abstract mixin class $TransactionsStateCopyWith<$Res>  {
  factory $TransactionsStateCopyWith(TransactionsState value, $Res Function(TransactionsState) _then) = _$TransactionsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, DateTime selectedDate, List<TransactionResponse> transactions, bool isRefreshing, TransactionResponse? transactionToBeDeleted
});


$TransactionResponseCopyWith<$Res>? get transactionToBeDeleted;

}
/// @nodoc
class _$TransactionsStateCopyWithImpl<$Res>
    implements $TransactionsStateCopyWith<$Res> {
  _$TransactionsStateCopyWithImpl(this._self, this._then);

  final TransactionsState _self;
  final $Res Function(TransactionsState) _then;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? selectedDate = null,Object? transactions = null,Object? isRefreshing = null,Object? transactionToBeDeleted = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionResponse>,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,transactionToBeDeleted: freezed == transactionToBeDeleted ? _self.transactionToBeDeleted : transactionToBeDeleted // ignore: cast_nullable_to_non_nullable
as TransactionResponse?,
  ));
}
/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionResponseCopyWith<$Res>? get transactionToBeDeleted {
    if (_self.transactionToBeDeleted == null) {
    return null;
  }

  return $TransactionResponseCopyWith<$Res>(_self.transactionToBeDeleted!, (value) {
    return _then(_self.copyWith(transactionToBeDeleted: value));
  });
}
}


/// @nodoc


class _TransactionsState extends TransactionsState {
  const _TransactionsState({required this.isLoading, required this.selectedDate, required final  List<TransactionResponse> transactions, required this.isRefreshing, this.transactionToBeDeleted}): _transactions = transactions,super._();
  

@override final  bool isLoading;
@override final  DateTime selectedDate;
 final  List<TransactionResponse> _transactions;
@override List<TransactionResponse> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override final  bool isRefreshing;
@override final  TransactionResponse? transactionToBeDeleted;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionsStateCopyWith<_TransactionsState> get copyWith => __$TransactionsStateCopyWithImpl<_TransactionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.transactionToBeDeleted, transactionToBeDeleted) || other.transactionToBeDeleted == transactionToBeDeleted));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,selectedDate,const DeepCollectionEquality().hash(_transactions),isRefreshing,transactionToBeDeleted);

@override
String toString() {
  return 'TransactionsState(isLoading: $isLoading, selectedDate: $selectedDate, transactions: $transactions, isRefreshing: $isRefreshing, transactionToBeDeleted: $transactionToBeDeleted)';
}


}

/// @nodoc
abstract mixin class _$TransactionsStateCopyWith<$Res> implements $TransactionsStateCopyWith<$Res> {
  factory _$TransactionsStateCopyWith(_TransactionsState value, $Res Function(_TransactionsState) _then) = __$TransactionsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, DateTime selectedDate, List<TransactionResponse> transactions, bool isRefreshing, TransactionResponse? transactionToBeDeleted
});


@override $TransactionResponseCopyWith<$Res>? get transactionToBeDeleted;

}
/// @nodoc
class __$TransactionsStateCopyWithImpl<$Res>
    implements _$TransactionsStateCopyWith<$Res> {
  __$TransactionsStateCopyWithImpl(this._self, this._then);

  final _TransactionsState _self;
  final $Res Function(_TransactionsState) _then;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? selectedDate = null,Object? transactions = null,Object? isRefreshing = null,Object? transactionToBeDeleted = freezed,}) {
  return _then(_TransactionsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionResponse>,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,transactionToBeDeleted: freezed == transactionToBeDeleted ? _self.transactionToBeDeleted : transactionToBeDeleted // ignore: cast_nullable_to_non_nullable
as TransactionResponse?,
  ));
}

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionResponseCopyWith<$Res>? get transactionToBeDeleted {
    if (_self.transactionToBeDeleted == null) {
    return null;
  }

  return $TransactionResponseCopyWith<$Res>(_self.transactionToBeDeleted!, (value) {
    return _then(_self.copyWith(transactionToBeDeleted: value));
  });
}
}

// dart format on
