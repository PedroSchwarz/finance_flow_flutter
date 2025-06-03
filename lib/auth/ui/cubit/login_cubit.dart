import 'package:finance_flow/auth/data/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepository})
    : super(const LoginState(email: '', password: '', hidePassword: true, isSubmitting: false, isAuthenticated: false));

  @visibleForTesting
  final AuthRepository authRepository;

  void updateEmail(String email) {
    emit(state.copyWith(email: email, error: null));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password, error: null));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(hidePassword: !state.hidePassword, error: null));
  }

  void login() async {
    emit(state.copyWith(isSubmitting: true, error: null));
    final result = await authRepository.login(state.email, state.password);

    switch (result) {
      case LoginResult.success:
        emit(state.copyWith(isAuthenticated: true));
      default:
        emit(state.copyWith(error: result));
    }

    emit(state.copyWith(isSubmitting: false));
  }
}

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    required String email,
    required String password,
    required bool hidePassword,
    required bool isSubmitting,
    required bool isAuthenticated,
    LoginResult? error,
  }) = _LoginState;

  const LoginState._();

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;

  bool get canSubmit => isFormValid && !isSubmitting;
}
