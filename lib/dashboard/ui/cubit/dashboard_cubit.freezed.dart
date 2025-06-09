// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardState {

 bool get isLoading; double get balance; List<GroupResponse> get groups; List<InviteResponse> get invites; bool get isRefreshing;
/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStateCopyWith<DashboardState> get copyWith => _$DashboardStateCopyWithImpl<DashboardState>(this as DashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other.groups, groups)&&const DeepCollectionEquality().equals(other.invites, invites)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,balance,const DeepCollectionEquality().hash(groups),const DeepCollectionEquality().hash(invites),isRefreshing);

@override
String toString() {
  return 'DashboardState(isLoading: $isLoading, balance: $balance, groups: $groups, invites: $invites, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class $DashboardStateCopyWith<$Res>  {
  factory $DashboardStateCopyWith(DashboardState value, $Res Function(DashboardState) _then) = _$DashboardStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, double balance, List<GroupResponse> groups, List<InviteResponse> invites, bool isRefreshing
});




}
/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._self, this._then);

  final DashboardState _self;
  final $Res Function(DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? balance = null,Object? groups = null,Object? invites = null,Object? isRefreshing = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<GroupResponse>,invites: null == invites ? _self.invites : invites // ignore: cast_nullable_to_non_nullable
as List<InviteResponse>,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _DashboardState extends DashboardState {
  const _DashboardState({required this.isLoading, required this.balance, required final  List<GroupResponse> groups, required final  List<InviteResponse> invites, required this.isRefreshing}): _groups = groups,_invites = invites,super._();
  

@override final  bool isLoading;
@override final  double balance;
 final  List<GroupResponse> _groups;
@override List<GroupResponse> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

 final  List<InviteResponse> _invites;
@override List<InviteResponse> get invites {
  if (_invites is EqualUnmodifiableListView) return _invites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invites);
}

@override final  bool isRefreshing;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardStateCopyWith<_DashboardState> get copyWith => __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other._groups, _groups)&&const DeepCollectionEquality().equals(other._invites, _invites)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,balance,const DeepCollectionEquality().hash(_groups),const DeepCollectionEquality().hash(_invites),isRefreshing);

@override
String toString() {
  return 'DashboardState(isLoading: $isLoading, balance: $balance, groups: $groups, invites: $invites, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class _$DashboardStateCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(_DashboardState value, $Res Function(_DashboardState) _then) = __$DashboardStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, double balance, List<GroupResponse> groups, List<InviteResponse> invites, bool isRefreshing
});




}
/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(this._self, this._then);

  final _DashboardState _self;
  final $Res Function(_DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? balance = null,Object? groups = null,Object? invites = null,Object? isRefreshing = null,}) {
  return _then(_DashboardState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<GroupResponse>,invites: null == invites ? _self._invites : invites // ignore: cast_nullable_to_non_nullable
as List<InviteResponse>,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
