// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'build_configurations.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BuildConfigurations {

 String get baseUrl; Environment get environment;
/// Create a copy of BuildConfigurations
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildConfigurationsCopyWith<BuildConfigurations> get copyWith => _$BuildConfigurationsCopyWithImpl<BuildConfigurations>(this as BuildConfigurations, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildConfigurations&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.environment, environment) || other.environment == environment));
}


@override
int get hashCode => Object.hash(runtimeType,baseUrl,environment);

@override
String toString() {
  return 'BuildConfigurations(baseUrl: $baseUrl, environment: $environment)';
}


}

/// @nodoc
abstract mixin class $BuildConfigurationsCopyWith<$Res>  {
  factory $BuildConfigurationsCopyWith(BuildConfigurations value, $Res Function(BuildConfigurations) _then) = _$BuildConfigurationsCopyWithImpl;
@useResult
$Res call({
 String baseUrl, Environment environment
});




}
/// @nodoc
class _$BuildConfigurationsCopyWithImpl<$Res>
    implements $BuildConfigurationsCopyWith<$Res> {
  _$BuildConfigurationsCopyWithImpl(this._self, this._then);

  final BuildConfigurations _self;
  final $Res Function(BuildConfigurations) _then;

/// Create a copy of BuildConfigurations
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseUrl = null,Object? environment = null,}) {
  return _then(_self.copyWith(
baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as Environment,
  ));
}

}


/// @nodoc


class _BuildConfigurations implements BuildConfigurations {
  const _BuildConfigurations({required this.baseUrl, required this.environment});
  

@override final  String baseUrl;
@override final  Environment environment;

/// Create a copy of BuildConfigurations
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuildConfigurationsCopyWith<_BuildConfigurations> get copyWith => __$BuildConfigurationsCopyWithImpl<_BuildConfigurations>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuildConfigurations&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.environment, environment) || other.environment == environment));
}


@override
int get hashCode => Object.hash(runtimeType,baseUrl,environment);

@override
String toString() {
  return 'BuildConfigurations(baseUrl: $baseUrl, environment: $environment)';
}


}

/// @nodoc
abstract mixin class _$BuildConfigurationsCopyWith<$Res> implements $BuildConfigurationsCopyWith<$Res> {
  factory _$BuildConfigurationsCopyWith(_BuildConfigurations value, $Res Function(_BuildConfigurations) _then) = __$BuildConfigurationsCopyWithImpl;
@override @useResult
$Res call({
 String baseUrl, Environment environment
});




}
/// @nodoc
class __$BuildConfigurationsCopyWithImpl<$Res>
    implements _$BuildConfigurationsCopyWith<$Res> {
  __$BuildConfigurationsCopyWithImpl(this._self, this._then);

  final _BuildConfigurations _self;
  final $Res Function(_BuildConfigurations) _then;

/// Create a copy of BuildConfigurations
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseUrl = null,Object? environment = null,}) {
  return _then(_BuildConfigurations(
baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as Environment,
  ));
}


}

// dart format on
