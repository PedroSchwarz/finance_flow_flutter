// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterState {

 int get step; String get firstName; String get lastName; double get initialBalance; String get email; String get password; String get confirmPassword; bool get hidePassword; bool get isSubmitting; bool get isAuthenticated; bool get emailError; bool get passwordError; bool get confirmPasswordError; RegisterResult? get error;
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterStateCopyWith<RegisterState> get copyWith => _$RegisterStateCopyWithImpl<RegisterState>(this as RegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState&&(identical(other.step, step) || other.step == step)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.initialBalance, initialBalance) || other.initialBalance == initialBalance)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.hidePassword, hidePassword) || other.hidePassword == hidePassword)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.confirmPasswordError, confirmPasswordError) || other.confirmPasswordError == confirmPasswordError)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,step,firstName,lastName,initialBalance,email,password,confirmPassword,hidePassword,isSubmitting,isAuthenticated,emailError,passwordError,confirmPasswordError,error);

@override
String toString() {
  return 'RegisterState(step: $step, firstName: $firstName, lastName: $lastName, initialBalance: $initialBalance, email: $email, password: $password, confirmPassword: $confirmPassword, hidePassword: $hidePassword, isSubmitting: $isSubmitting, isAuthenticated: $isAuthenticated, emailError: $emailError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError, error: $error)';
}


}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res>  {
  factory $RegisterStateCopyWith(RegisterState value, $Res Function(RegisterState) _then) = _$RegisterStateCopyWithImpl;
@useResult
$Res call({
 int step, String firstName, String lastName, double initialBalance, String email, String password, String confirmPassword, bool hidePassword, bool isSubmitting, bool isAuthenticated, bool emailError, bool passwordError, bool confirmPasswordError, RegisterResult? error
});




}
/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState _self;
  final $Res Function(RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? firstName = null,Object? lastName = null,Object? initialBalance = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? hidePassword = null,Object? isSubmitting = null,Object? isAuthenticated = null,Object? emailError = null,Object? passwordError = null,Object? confirmPasswordError = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,initialBalance: null == initialBalance ? _self.initialBalance : initialBalance // ignore: cast_nullable_to_non_nullable
as double,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,hidePassword: null == hidePassword ? _self.hidePassword : hidePassword // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,emailError: null == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as bool,passwordError: null == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as bool,confirmPasswordError: null == confirmPasswordError ? _self.confirmPasswordError : confirmPasswordError // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as RegisterResult?,
  ));
}

}


/// @nodoc


class _RegisterState extends RegisterState {
  const _RegisterState({required this.step, required this.firstName, required this.lastName, required this.initialBalance, required this.email, required this.password, required this.confirmPassword, required this.hidePassword, required this.isSubmitting, required this.isAuthenticated, required this.emailError, required this.passwordError, required this.confirmPasswordError, this.error}): super._();
  

@override final  int step;
@override final  String firstName;
@override final  String lastName;
@override final  double initialBalance;
@override final  String email;
@override final  String password;
@override final  String confirmPassword;
@override final  bool hidePassword;
@override final  bool isSubmitting;
@override final  bool isAuthenticated;
@override final  bool emailError;
@override final  bool passwordError;
@override final  bool confirmPasswordError;
@override final  RegisterResult? error;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterStateCopyWith<_RegisterState> get copyWith => __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterState&&(identical(other.step, step) || other.step == step)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.initialBalance, initialBalance) || other.initialBalance == initialBalance)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.hidePassword, hidePassword) || other.hidePassword == hidePassword)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.confirmPasswordError, confirmPasswordError) || other.confirmPasswordError == confirmPasswordError)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,step,firstName,lastName,initialBalance,email,password,confirmPassword,hidePassword,isSubmitting,isAuthenticated,emailError,passwordError,confirmPasswordError,error);

@override
String toString() {
  return 'RegisterState(step: $step, firstName: $firstName, lastName: $lastName, initialBalance: $initialBalance, email: $email, password: $password, confirmPassword: $confirmPassword, hidePassword: $hidePassword, isSubmitting: $isSubmitting, isAuthenticated: $isAuthenticated, emailError: $emailError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError, error: $error)';
}


}

/// @nodoc
abstract mixin class _$RegisterStateCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(_RegisterState value, $Res Function(_RegisterState) _then) = __$RegisterStateCopyWithImpl;
@override @useResult
$Res call({
 int step, String firstName, String lastName, double initialBalance, String email, String password, String confirmPassword, bool hidePassword, bool isSubmitting, bool isAuthenticated, bool emailError, bool passwordError, bool confirmPasswordError, RegisterResult? error
});




}
/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(this._self, this._then);

  final _RegisterState _self;
  final $Res Function(_RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? firstName = null,Object? lastName = null,Object? initialBalance = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? hidePassword = null,Object? isSubmitting = null,Object? isAuthenticated = null,Object? emailError = null,Object? passwordError = null,Object? confirmPasswordError = null,Object? error = freezed,}) {
  return _then(_RegisterState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,initialBalance: null == initialBalance ? _self.initialBalance : initialBalance // ignore: cast_nullable_to_non_nullable
as double,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,hidePassword: null == hidePassword ? _self.hidePassword : hidePassword // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,emailError: null == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as bool,passwordError: null == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as bool,confirmPasswordError: null == confirmPasswordError ? _self.confirmPasswordError : confirmPasswordError // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as RegisterResult?,
  ));
}


}

// dart format on
