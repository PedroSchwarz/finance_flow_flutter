// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GroupDetailsState {

 bool get isLoading; double get userBalance; bool get showLeaveDialog; bool get isRefreshing; double get depositAmount; TransactionType get transactionType; GroupTransactionDateSort get dateSort; bool get shouldGoBack; GroupResponse? get group; UserResponse? get selectedMember; UserData? get currentUser;
/// Create a copy of GroupDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupDetailsStateCopyWith<GroupDetailsState> get copyWith => _$GroupDetailsStateCopyWithImpl<GroupDetailsState>(this as GroupDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupDetailsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.userBalance, userBalance) || other.userBalance == userBalance)&&(identical(other.showLeaveDialog, showLeaveDialog) || other.showLeaveDialog == showLeaveDialog)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.depositAmount, depositAmount) || other.depositAmount == depositAmount)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.dateSort, dateSort) || other.dateSort == dateSort)&&(identical(other.shouldGoBack, shouldGoBack) || other.shouldGoBack == shouldGoBack)&&(identical(other.group, group) || other.group == group)&&(identical(other.selectedMember, selectedMember) || other.selectedMember == selectedMember)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,userBalance,showLeaveDialog,isRefreshing,depositAmount,transactionType,dateSort,shouldGoBack,group,selectedMember,currentUser);

@override
String toString() {
  return 'GroupDetailsState(isLoading: $isLoading, userBalance: $userBalance, showLeaveDialog: $showLeaveDialog, isRefreshing: $isRefreshing, depositAmount: $depositAmount, transactionType: $transactionType, dateSort: $dateSort, shouldGoBack: $shouldGoBack, group: $group, selectedMember: $selectedMember, currentUser: $currentUser)';
}


}

/// @nodoc
abstract mixin class $GroupDetailsStateCopyWith<$Res>  {
  factory $GroupDetailsStateCopyWith(GroupDetailsState value, $Res Function(GroupDetailsState) _then) = _$GroupDetailsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, double userBalance, bool showLeaveDialog, bool isRefreshing, double depositAmount, TransactionType transactionType, GroupTransactionDateSort dateSort, bool shouldGoBack, GroupResponse? group, UserResponse? selectedMember, UserData? currentUser
});


$GroupResponseCopyWith<$Res>? get group;$UserResponseCopyWith<$Res>? get selectedMember;$UserDataCopyWith<$Res>? get currentUser;

}
/// @nodoc
class _$GroupDetailsStateCopyWithImpl<$Res>
    implements $GroupDetailsStateCopyWith<$Res> {
  _$GroupDetailsStateCopyWithImpl(this._self, this._then);

  final GroupDetailsState _self;
  final $Res Function(GroupDetailsState) _then;

/// Create a copy of GroupDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? userBalance = null,Object? showLeaveDialog = null,Object? isRefreshing = null,Object? depositAmount = null,Object? transactionType = null,Object? dateSort = null,Object? shouldGoBack = null,Object? group = freezed,Object? selectedMember = freezed,Object? currentUser = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,userBalance: null == userBalance ? _self.userBalance : userBalance // ignore: cast_nullable_to_non_nullable
as double,showLeaveDialog: null == showLeaveDialog ? _self.showLeaveDialog : showLeaveDialog // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,depositAmount: null == depositAmount ? _self.depositAmount : depositAmount // ignore: cast_nullable_to_non_nullable
as double,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,dateSort: null == dateSort ? _self.dateSort : dateSort // ignore: cast_nullable_to_non_nullable
as GroupTransactionDateSort,shouldGoBack: null == shouldGoBack ? _self.shouldGoBack : shouldGoBack // ignore: cast_nullable_to_non_nullable
as bool,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as GroupResponse?,selectedMember: freezed == selectedMember ? _self.selectedMember : selectedMember // ignore: cast_nullable_to_non_nullable
as UserResponse?,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as UserData?,
  ));
}
/// Create a copy of GroupDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GroupResponseCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $GroupResponseCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}/// Create a copy of GroupDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserResponseCopyWith<$Res>? get selectedMember {
    if (_self.selectedMember == null) {
    return null;
  }

  return $UserResponseCopyWith<$Res>(_self.selectedMember!, (value) {
    return _then(_self.copyWith(selectedMember: value));
  });
}/// Create a copy of GroupDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res>? get currentUser {
    if (_self.currentUser == null) {
    return null;
  }

  return $UserDataCopyWith<$Res>(_self.currentUser!, (value) {
    return _then(_self.copyWith(currentUser: value));
  });
}
}


/// @nodoc


class _GroupDetailsState extends GroupDetailsState {
  const _GroupDetailsState({required this.isLoading, required this.userBalance, required this.showLeaveDialog, required this.isRefreshing, required this.depositAmount, required this.transactionType, required this.dateSort, required this.shouldGoBack, this.group, this.selectedMember, this.currentUser}): super._();
  

@override final  bool isLoading;
@override final  double userBalance;
@override final  bool showLeaveDialog;
@override final  bool isRefreshing;
@override final  double depositAmount;
@override final  TransactionType transactionType;
@override final  GroupTransactionDateSort dateSort;
@override final  bool shouldGoBack;
@override final  GroupResponse? group;
@override final  UserResponse? selectedMember;
@override final  UserData? currentUser;

/// Create a copy of GroupDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupDetailsStateCopyWith<_GroupDetailsState> get copyWith => __$GroupDetailsStateCopyWithImpl<_GroupDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupDetailsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.userBalance, userBalance) || other.userBalance == userBalance)&&(identical(other.showLeaveDialog, showLeaveDialog) || other.showLeaveDialog == showLeaveDialog)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.depositAmount, depositAmount) || other.depositAmount == depositAmount)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.dateSort, dateSort) || other.dateSort == dateSort)&&(identical(other.shouldGoBack, shouldGoBack) || other.shouldGoBack == shouldGoBack)&&(identical(other.group, group) || other.group == group)&&(identical(other.selectedMember, selectedMember) || other.selectedMember == selectedMember)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,userBalance,showLeaveDialog,isRefreshing,depositAmount,transactionType,dateSort,shouldGoBack,group,selectedMember,currentUser);

@override
String toString() {
  return 'GroupDetailsState(isLoading: $isLoading, userBalance: $userBalance, showLeaveDialog: $showLeaveDialog, isRefreshing: $isRefreshing, depositAmount: $depositAmount, transactionType: $transactionType, dateSort: $dateSort, shouldGoBack: $shouldGoBack, group: $group, selectedMember: $selectedMember, currentUser: $currentUser)';
}


}

/// @nodoc
abstract mixin class _$GroupDetailsStateCopyWith<$Res> implements $GroupDetailsStateCopyWith<$Res> {
  factory _$GroupDetailsStateCopyWith(_GroupDetailsState value, $Res Function(_GroupDetailsState) _then) = __$GroupDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, double userBalance, bool showLeaveDialog, bool isRefreshing, double depositAmount, TransactionType transactionType, GroupTransactionDateSort dateSort, bool shouldGoBack, GroupResponse? group, UserResponse? selectedMember, UserData? currentUser
});


@override $GroupResponseCopyWith<$Res>? get group;@override $UserResponseCopyWith<$Res>? get selectedMember;@override $UserDataCopyWith<$Res>? get currentUser;

}
/// @nodoc
class __$GroupDetailsStateCopyWithImpl<$Res>
    implements _$GroupDetailsStateCopyWith<$Res> {
  __$GroupDetailsStateCopyWithImpl(this._self, this._then);

  final _GroupDetailsState _self;
  final $Res Function(_GroupDetailsState) _then;

/// Create a copy of GroupDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? userBalance = null,Object? showLeaveDialog = null,Object? isRefreshing = null,Object? depositAmount = null,Object? transactionType = null,Object? dateSort = null,Object? shouldGoBack = null,Object? group = freezed,Object? selectedMember = freezed,Object? currentUser = freezed,}) {
  return _then(_GroupDetailsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,userBalance: null == userBalance ? _self.userBalance : userBalance // ignore: cast_nullable_to_non_nullable
as double,showLeaveDialog: null == showLeaveDialog ? _self.showLeaveDialog : showLeaveDialog // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,depositAmount: null == depositAmount ? _self.depositAmount : depositAmount // ignore: cast_nullable_to_non_nullable
as double,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,dateSort: null == dateSort ? _self.dateSort : dateSort // ignore: cast_nullable_to_non_nullable
as GroupTransactionDateSort,shouldGoBack: null == shouldGoBack ? _self.shouldGoBack : shouldGoBack // ignore: cast_nullable_to_non_nullable
as bool,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as GroupResponse?,selectedMember: freezed == selectedMember ? _self.selectedMember : selectedMember // ignore: cast_nullable_to_non_nullable
as UserResponse?,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as UserData?,
  ));
}

/// Create a copy of GroupDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GroupResponseCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $GroupResponseCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}/// Create a copy of GroupDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserResponseCopyWith<$Res>? get selectedMember {
    if (_self.selectedMember == null) {
    return null;
  }

  return $UserResponseCopyWith<$Res>(_self.selectedMember!, (value) {
    return _then(_self.copyWith(selectedMember: value));
  });
}/// Create a copy of GroupDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res>? get currentUser {
    if (_self.currentUser == null) {
    return null;
  }

  return $UserDataCopyWith<$Res>(_self.currentUser!, (value) {
    return _then(_self.copyWith(currentUser: value));
  });
}
}

// dart format on
