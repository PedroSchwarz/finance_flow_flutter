// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credentials_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CredentialsData {

 String get accessToken;
/// Create a copy of CredentialsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CredentialsDataCopyWith<CredentialsData> get copyWith => _$CredentialsDataCopyWithImpl<CredentialsData>(this as CredentialsData, _$identity);

  /// Serializes this CredentialsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CredentialsData&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken);

@override
String toString() {
  return 'CredentialsData(accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class $CredentialsDataCopyWith<$Res>  {
  factory $CredentialsDataCopyWith(CredentialsData value, $Res Function(CredentialsData) _then) = _$CredentialsDataCopyWithImpl;
@useResult
$Res call({
 String accessToken
});




}
/// @nodoc
class _$CredentialsDataCopyWithImpl<$Res>
    implements $CredentialsDataCopyWith<$Res> {
  _$CredentialsDataCopyWithImpl(this._self, this._then);

  final CredentialsData _self;
  final $Res Function(CredentialsData) _then;

/// Create a copy of CredentialsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CredentialsData implements CredentialsData {
  const _CredentialsData({required this.accessToken});
  factory _CredentialsData.fromJson(Map<String, dynamic> json) => _$CredentialsDataFromJson(json);

@override final  String accessToken;

/// Create a copy of CredentialsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CredentialsDataCopyWith<_CredentialsData> get copyWith => __$CredentialsDataCopyWithImpl<_CredentialsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CredentialsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CredentialsData&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken);

@override
String toString() {
  return 'CredentialsData(accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class _$CredentialsDataCopyWith<$Res> implements $CredentialsDataCopyWith<$Res> {
  factory _$CredentialsDataCopyWith(_CredentialsData value, $Res Function(_CredentialsData) _then) = __$CredentialsDataCopyWithImpl;
@override @useResult
$Res call({
 String accessToken
});




}
/// @nodoc
class __$CredentialsDataCopyWithImpl<$Res>
    implements _$CredentialsDataCopyWith<$Res> {
  __$CredentialsDataCopyWithImpl(this._self, this._then);

  final _CredentialsData _self;
  final $Res Function(_CredentialsData) _then;

/// Create a copy of CredentialsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,}) {
  return _then(_CredentialsData(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
