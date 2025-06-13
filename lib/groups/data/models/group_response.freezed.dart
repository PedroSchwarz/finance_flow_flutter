// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupResponse {

@JsonKey(name: '_id') String get id; String get name; String get description; double get balance; DateTime get createdAt; UserResponse get owner; List<UserResponse> get members; List<GroupTransactionResponse> get transactions;
/// Create a copy of GroupResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupResponseCopyWith<GroupResponse> get copyWith => _$GroupResponseCopyWithImpl<GroupResponse>(this as GroupResponse, _$identity);

  /// Serializes this GroupResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.owner, owner) || other.owner == owner)&&const DeepCollectionEquality().equals(other.members, members)&&const DeepCollectionEquality().equals(other.transactions, transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,balance,createdAt,owner,const DeepCollectionEquality().hash(members),const DeepCollectionEquality().hash(transactions));

@override
String toString() {
  return 'GroupResponse(id: $id, name: $name, description: $description, balance: $balance, createdAt: $createdAt, owner: $owner, members: $members, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class $GroupResponseCopyWith<$Res>  {
  factory $GroupResponseCopyWith(GroupResponse value, $Res Function(GroupResponse) _then) = _$GroupResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String description, double balance, DateTime createdAt, UserResponse owner, List<UserResponse> members, List<GroupTransactionResponse> transactions
});


$UserResponseCopyWith<$Res> get owner;

}
/// @nodoc
class _$GroupResponseCopyWithImpl<$Res>
    implements $GroupResponseCopyWith<$Res> {
  _$GroupResponseCopyWithImpl(this._self, this._then);

  final GroupResponse _self;
  final $Res Function(GroupResponse) _then;

/// Create a copy of GroupResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? balance = null,Object? createdAt = null,Object? owner = null,Object? members = null,Object? transactions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as UserResponse,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<UserResponse>,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<GroupTransactionResponse>,
  ));
}
/// Create a copy of GroupResponse
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

class _GroupResponse implements GroupResponse {
  const _GroupResponse({@JsonKey(name: '_id') required this.id, required this.name, required this.description, required this.balance, required this.createdAt, required this.owner, required final  List<UserResponse> members, required final  List<GroupTransactionResponse> transactions}): _members = members,_transactions = transactions;
  factory _GroupResponse.fromJson(Map<String, dynamic> json) => _$GroupResponseFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String name;
@override final  String description;
@override final  double balance;
@override final  DateTime createdAt;
@override final  UserResponse owner;
 final  List<UserResponse> _members;
@override List<UserResponse> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}

 final  List<GroupTransactionResponse> _transactions;
@override List<GroupTransactionResponse> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}


/// Create a copy of GroupResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupResponseCopyWith<_GroupResponse> get copyWith => __$GroupResponseCopyWithImpl<_GroupResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.owner, owner) || other.owner == owner)&&const DeepCollectionEquality().equals(other._members, _members)&&const DeepCollectionEquality().equals(other._transactions, _transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,balance,createdAt,owner,const DeepCollectionEquality().hash(_members),const DeepCollectionEquality().hash(_transactions));

@override
String toString() {
  return 'GroupResponse(id: $id, name: $name, description: $description, balance: $balance, createdAt: $createdAt, owner: $owner, members: $members, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class _$GroupResponseCopyWith<$Res> implements $GroupResponseCopyWith<$Res> {
  factory _$GroupResponseCopyWith(_GroupResponse value, $Res Function(_GroupResponse) _then) = __$GroupResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String description, double balance, DateTime createdAt, UserResponse owner, List<UserResponse> members, List<GroupTransactionResponse> transactions
});


@override $UserResponseCopyWith<$Res> get owner;

}
/// @nodoc
class __$GroupResponseCopyWithImpl<$Res>
    implements _$GroupResponseCopyWith<$Res> {
  __$GroupResponseCopyWithImpl(this._self, this._then);

  final _GroupResponse _self;
  final $Res Function(_GroupResponse) _then;

/// Create a copy of GroupResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? balance = null,Object? createdAt = null,Object? owner = null,Object? members = null,Object? transactions = null,}) {
  return _then(_GroupResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as UserResponse,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<UserResponse>,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<GroupTransactionResponse>,
  ));
}

/// Create a copy of GroupResponse
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
mixin _$GroupTransactionResponse {

@JsonKey(name: '_id') String get id; double get amount; TransactionType get type; UserResponse get owner; DateTime get createdAt;
/// Create a copy of GroupTransactionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupTransactionResponseCopyWith<GroupTransactionResponse> get copyWith => _$GroupTransactionResponseCopyWithImpl<GroupTransactionResponse>(this as GroupTransactionResponse, _$identity);

  /// Serializes this GroupTransactionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupTransactionResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,type,owner,createdAt);

@override
String toString() {
  return 'GroupTransactionResponse(id: $id, amount: $amount, type: $type, owner: $owner, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $GroupTransactionResponseCopyWith<$Res>  {
  factory $GroupTransactionResponseCopyWith(GroupTransactionResponse value, $Res Function(GroupTransactionResponse) _then) = _$GroupTransactionResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, double amount, TransactionType type, UserResponse owner, DateTime createdAt
});


$UserResponseCopyWith<$Res> get owner;

}
/// @nodoc
class _$GroupTransactionResponseCopyWithImpl<$Res>
    implements $GroupTransactionResponseCopyWith<$Res> {
  _$GroupTransactionResponseCopyWithImpl(this._self, this._then);

  final GroupTransactionResponse _self;
  final $Res Function(GroupTransactionResponse) _then;

/// Create a copy of GroupTransactionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,Object? type = null,Object? owner = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as UserResponse,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of GroupTransactionResponse
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

class _GroupTransactionResponse extends GroupTransactionResponse {
  const _GroupTransactionResponse({@JsonKey(name: '_id') required this.id, required this.amount, required this.type, required this.owner, required this.createdAt}): super._();
  factory _GroupTransactionResponse.fromJson(Map<String, dynamic> json) => _$GroupTransactionResponseFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  double amount;
@override final  TransactionType type;
@override final  UserResponse owner;
@override final  DateTime createdAt;

/// Create a copy of GroupTransactionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupTransactionResponseCopyWith<_GroupTransactionResponse> get copyWith => __$GroupTransactionResponseCopyWithImpl<_GroupTransactionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupTransactionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupTransactionResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,type,owner,createdAt);

@override
String toString() {
  return 'GroupTransactionResponse(id: $id, amount: $amount, type: $type, owner: $owner, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$GroupTransactionResponseCopyWith<$Res> implements $GroupTransactionResponseCopyWith<$Res> {
  factory _$GroupTransactionResponseCopyWith(_GroupTransactionResponse value, $Res Function(_GroupTransactionResponse) _then) = __$GroupTransactionResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, double amount, TransactionType type, UserResponse owner, DateTime createdAt
});


@override $UserResponseCopyWith<$Res> get owner;

}
/// @nodoc
class __$GroupTransactionResponseCopyWithImpl<$Res>
    implements _$GroupTransactionResponseCopyWith<$Res> {
  __$GroupTransactionResponseCopyWithImpl(this._self, this._then);

  final _GroupTransactionResponse _self;
  final $Res Function(_GroupTransactionResponse) _then;

/// Create a copy of GroupTransactionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,Object? type = null,Object? owner = null,Object? createdAt = null,}) {
  return _then(_GroupTransactionResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as UserResponse,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of GroupTransactionResponse
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
