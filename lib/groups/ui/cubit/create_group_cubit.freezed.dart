// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_group_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateGroupState {

 double get maxBalance; List<UserResponse> get users; List<String> get selectedUsersIds; String get name; String get description; double get amount; bool get showInviteUsersSheet; bool get isLoading; bool get isSubmitting; bool get showDeleteDialog; bool get shouldGoBack; GroupResponse? get group;
/// Create a copy of CreateGroupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateGroupStateCopyWith<CreateGroupState> get copyWith => _$CreateGroupStateCopyWithImpl<CreateGroupState>(this as CreateGroupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateGroupState&&(identical(other.maxBalance, maxBalance) || other.maxBalance == maxBalance)&&const DeepCollectionEquality().equals(other.users, users)&&const DeepCollectionEquality().equals(other.selectedUsersIds, selectedUsersIds)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.showInviteUsersSheet, showInviteUsersSheet) || other.showInviteUsersSheet == showInviteUsersSheet)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.showDeleteDialog, showDeleteDialog) || other.showDeleteDialog == showDeleteDialog)&&(identical(other.shouldGoBack, shouldGoBack) || other.shouldGoBack == shouldGoBack)&&(identical(other.group, group) || other.group == group));
}


@override
int get hashCode => Object.hash(runtimeType,maxBalance,const DeepCollectionEquality().hash(users),const DeepCollectionEquality().hash(selectedUsersIds),name,description,amount,showInviteUsersSheet,isLoading,isSubmitting,showDeleteDialog,shouldGoBack,group);

@override
String toString() {
  return 'CreateGroupState(maxBalance: $maxBalance, users: $users, selectedUsersIds: $selectedUsersIds, name: $name, description: $description, amount: $amount, showInviteUsersSheet: $showInviteUsersSheet, isLoading: $isLoading, isSubmitting: $isSubmitting, showDeleteDialog: $showDeleteDialog, shouldGoBack: $shouldGoBack, group: $group)';
}


}

/// @nodoc
abstract mixin class $CreateGroupStateCopyWith<$Res>  {
  factory $CreateGroupStateCopyWith(CreateGroupState value, $Res Function(CreateGroupState) _then) = _$CreateGroupStateCopyWithImpl;
@useResult
$Res call({
 double maxBalance, List<UserResponse> users, List<String> selectedUsersIds, String name, String description, double amount, bool showInviteUsersSheet, bool isLoading, bool isSubmitting, bool showDeleteDialog, bool shouldGoBack, GroupResponse? group
});


$GroupResponseCopyWith<$Res>? get group;

}
/// @nodoc
class _$CreateGroupStateCopyWithImpl<$Res>
    implements $CreateGroupStateCopyWith<$Res> {
  _$CreateGroupStateCopyWithImpl(this._self, this._then);

  final CreateGroupState _self;
  final $Res Function(CreateGroupState) _then;

/// Create a copy of CreateGroupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxBalance = null,Object? users = null,Object? selectedUsersIds = null,Object? name = null,Object? description = null,Object? amount = null,Object? showInviteUsersSheet = null,Object? isLoading = null,Object? isSubmitting = null,Object? showDeleteDialog = null,Object? shouldGoBack = null,Object? group = freezed,}) {
  return _then(_self.copyWith(
maxBalance: null == maxBalance ? _self.maxBalance : maxBalance // ignore: cast_nullable_to_non_nullable
as double,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserResponse>,selectedUsersIds: null == selectedUsersIds ? _self.selectedUsersIds : selectedUsersIds // ignore: cast_nullable_to_non_nullable
as List<String>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,showInviteUsersSheet: null == showInviteUsersSheet ? _self.showInviteUsersSheet : showInviteUsersSheet // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,showDeleteDialog: null == showDeleteDialog ? _self.showDeleteDialog : showDeleteDialog // ignore: cast_nullable_to_non_nullable
as bool,shouldGoBack: null == shouldGoBack ? _self.shouldGoBack : shouldGoBack // ignore: cast_nullable_to_non_nullable
as bool,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as GroupResponse?,
  ));
}
/// Create a copy of CreateGroupState
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
}
}


/// @nodoc


class _CreateGroupState extends CreateGroupState {
  const _CreateGroupState({required this.maxBalance, required final  List<UserResponse> users, required final  List<String> selectedUsersIds, required this.name, required this.description, required this.amount, required this.showInviteUsersSheet, required this.isLoading, required this.isSubmitting, required this.showDeleteDialog, required this.shouldGoBack, this.group}): _users = users,_selectedUsersIds = selectedUsersIds,super._();
  

@override final  double maxBalance;
 final  List<UserResponse> _users;
@override List<UserResponse> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

 final  List<String> _selectedUsersIds;
@override List<String> get selectedUsersIds {
  if (_selectedUsersIds is EqualUnmodifiableListView) return _selectedUsersIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedUsersIds);
}

@override final  String name;
@override final  String description;
@override final  double amount;
@override final  bool showInviteUsersSheet;
@override final  bool isLoading;
@override final  bool isSubmitting;
@override final  bool showDeleteDialog;
@override final  bool shouldGoBack;
@override final  GroupResponse? group;

/// Create a copy of CreateGroupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateGroupStateCopyWith<_CreateGroupState> get copyWith => __$CreateGroupStateCopyWithImpl<_CreateGroupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateGroupState&&(identical(other.maxBalance, maxBalance) || other.maxBalance == maxBalance)&&const DeepCollectionEquality().equals(other._users, _users)&&const DeepCollectionEquality().equals(other._selectedUsersIds, _selectedUsersIds)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.showInviteUsersSheet, showInviteUsersSheet) || other.showInviteUsersSheet == showInviteUsersSheet)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.showDeleteDialog, showDeleteDialog) || other.showDeleteDialog == showDeleteDialog)&&(identical(other.shouldGoBack, shouldGoBack) || other.shouldGoBack == shouldGoBack)&&(identical(other.group, group) || other.group == group));
}


@override
int get hashCode => Object.hash(runtimeType,maxBalance,const DeepCollectionEquality().hash(_users),const DeepCollectionEquality().hash(_selectedUsersIds),name,description,amount,showInviteUsersSheet,isLoading,isSubmitting,showDeleteDialog,shouldGoBack,group);

@override
String toString() {
  return 'CreateGroupState(maxBalance: $maxBalance, users: $users, selectedUsersIds: $selectedUsersIds, name: $name, description: $description, amount: $amount, showInviteUsersSheet: $showInviteUsersSheet, isLoading: $isLoading, isSubmitting: $isSubmitting, showDeleteDialog: $showDeleteDialog, shouldGoBack: $shouldGoBack, group: $group)';
}


}

/// @nodoc
abstract mixin class _$CreateGroupStateCopyWith<$Res> implements $CreateGroupStateCopyWith<$Res> {
  factory _$CreateGroupStateCopyWith(_CreateGroupState value, $Res Function(_CreateGroupState) _then) = __$CreateGroupStateCopyWithImpl;
@override @useResult
$Res call({
 double maxBalance, List<UserResponse> users, List<String> selectedUsersIds, String name, String description, double amount, bool showInviteUsersSheet, bool isLoading, bool isSubmitting, bool showDeleteDialog, bool shouldGoBack, GroupResponse? group
});


@override $GroupResponseCopyWith<$Res>? get group;

}
/// @nodoc
class __$CreateGroupStateCopyWithImpl<$Res>
    implements _$CreateGroupStateCopyWith<$Res> {
  __$CreateGroupStateCopyWithImpl(this._self, this._then);

  final _CreateGroupState _self;
  final $Res Function(_CreateGroupState) _then;

/// Create a copy of CreateGroupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxBalance = null,Object? users = null,Object? selectedUsersIds = null,Object? name = null,Object? description = null,Object? amount = null,Object? showInviteUsersSheet = null,Object? isLoading = null,Object? isSubmitting = null,Object? showDeleteDialog = null,Object? shouldGoBack = null,Object? group = freezed,}) {
  return _then(_CreateGroupState(
maxBalance: null == maxBalance ? _self.maxBalance : maxBalance // ignore: cast_nullable_to_non_nullable
as double,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserResponse>,selectedUsersIds: null == selectedUsersIds ? _self._selectedUsersIds : selectedUsersIds // ignore: cast_nullable_to_non_nullable
as List<String>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,showInviteUsersSheet: null == showInviteUsersSheet ? _self.showInviteUsersSheet : showInviteUsersSheet // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,showDeleteDialog: null == showDeleteDialog ? _self.showDeleteDialog : showDeleteDialog // ignore: cast_nullable_to_non_nullable
as bool,shouldGoBack: null == shouldGoBack ? _self.shouldGoBack : shouldGoBack // ignore: cast_nullable_to_non_nullable
as bool,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as GroupResponse?,
  ));
}

/// Create a copy of CreateGroupState
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
}
}

// dart format on
