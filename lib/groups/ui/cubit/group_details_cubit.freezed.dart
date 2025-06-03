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

 bool get isLoading; DateTime get selectedDate; bool get showLeaveDialog; bool get isRefreshing; bool get shouldGoBack; GroupResponse? get group; UserData? get currentUser;
/// Create a copy of GroupDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupDetailsStateCopyWith<GroupDetailsState> get copyWith => _$GroupDetailsStateCopyWithImpl<GroupDetailsState>(this as GroupDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupDetailsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.showLeaveDialog, showLeaveDialog) || other.showLeaveDialog == showLeaveDialog)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.shouldGoBack, shouldGoBack) || other.shouldGoBack == shouldGoBack)&&(identical(other.group, group) || other.group == group)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,selectedDate,showLeaveDialog,isRefreshing,shouldGoBack,group,currentUser);

@override
String toString() {
  return 'GroupDetailsState(isLoading: $isLoading, selectedDate: $selectedDate, showLeaveDialog: $showLeaveDialog, isRefreshing: $isRefreshing, shouldGoBack: $shouldGoBack, group: $group, currentUser: $currentUser)';
}


}

/// @nodoc
abstract mixin class $GroupDetailsStateCopyWith<$Res>  {
  factory $GroupDetailsStateCopyWith(GroupDetailsState value, $Res Function(GroupDetailsState) _then) = _$GroupDetailsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, DateTime selectedDate, bool showLeaveDialog, bool isRefreshing, bool shouldGoBack, GroupResponse? group, UserData? currentUser
});


$GroupResponseCopyWith<$Res>? get group;$UserDataCopyWith<$Res>? get currentUser;

}
/// @nodoc
class _$GroupDetailsStateCopyWithImpl<$Res>
    implements $GroupDetailsStateCopyWith<$Res> {
  _$GroupDetailsStateCopyWithImpl(this._self, this._then);

  final GroupDetailsState _self;
  final $Res Function(GroupDetailsState) _then;

/// Create a copy of GroupDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? selectedDate = null,Object? showLeaveDialog = null,Object? isRefreshing = null,Object? shouldGoBack = null,Object? group = freezed,Object? currentUser = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,showLeaveDialog: null == showLeaveDialog ? _self.showLeaveDialog : showLeaveDialog // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,shouldGoBack: null == shouldGoBack ? _self.shouldGoBack : shouldGoBack // ignore: cast_nullable_to_non_nullable
as bool,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as GroupResponse?,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
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
  const _GroupDetailsState({required this.isLoading, required this.selectedDate, required this.showLeaveDialog, required this.isRefreshing, required this.shouldGoBack, this.group, this.currentUser}): super._();
  

@override final  bool isLoading;
@override final  DateTime selectedDate;
@override final  bool showLeaveDialog;
@override final  bool isRefreshing;
@override final  bool shouldGoBack;
@override final  GroupResponse? group;
@override final  UserData? currentUser;

/// Create a copy of GroupDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupDetailsStateCopyWith<_GroupDetailsState> get copyWith => __$GroupDetailsStateCopyWithImpl<_GroupDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupDetailsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.showLeaveDialog, showLeaveDialog) || other.showLeaveDialog == showLeaveDialog)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.shouldGoBack, shouldGoBack) || other.shouldGoBack == shouldGoBack)&&(identical(other.group, group) || other.group == group)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,selectedDate,showLeaveDialog,isRefreshing,shouldGoBack,group,currentUser);

@override
String toString() {
  return 'GroupDetailsState(isLoading: $isLoading, selectedDate: $selectedDate, showLeaveDialog: $showLeaveDialog, isRefreshing: $isRefreshing, shouldGoBack: $shouldGoBack, group: $group, currentUser: $currentUser)';
}


}

/// @nodoc
abstract mixin class _$GroupDetailsStateCopyWith<$Res> implements $GroupDetailsStateCopyWith<$Res> {
  factory _$GroupDetailsStateCopyWith(_GroupDetailsState value, $Res Function(_GroupDetailsState) _then) = __$GroupDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, DateTime selectedDate, bool showLeaveDialog, bool isRefreshing, bool shouldGoBack, GroupResponse? group, UserData? currentUser
});


@override $GroupResponseCopyWith<$Res>? get group;@override $UserDataCopyWith<$Res>? get currentUser;

}
/// @nodoc
class __$GroupDetailsStateCopyWithImpl<$Res>
    implements _$GroupDetailsStateCopyWith<$Res> {
  __$GroupDetailsStateCopyWithImpl(this._self, this._then);

  final _GroupDetailsState _self;
  final $Res Function(_GroupDetailsState) _then;

/// Create a copy of GroupDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? selectedDate = null,Object? showLeaveDialog = null,Object? isRefreshing = null,Object? shouldGoBack = null,Object? group = freezed,Object? currentUser = freezed,}) {
  return _then(_GroupDetailsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,showLeaveDialog: null == showLeaveDialog ? _self.showLeaveDialog : showLeaveDialog // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,shouldGoBack: null == shouldGoBack ? _self.shouldGoBack : shouldGoBack // ignore: cast_nullable_to_non_nullable
as bool,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as GroupResponse?,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
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
