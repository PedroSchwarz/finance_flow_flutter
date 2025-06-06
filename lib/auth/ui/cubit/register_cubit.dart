import 'package:finance_flow/auth/data/models/register_request.dart';
import 'package:finance_flow/auth/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.authRepository})
    : super(
        const RegisterState(
          step: 0,
          firstName: '',
          lastName: '',
          initialBalance: 0,
          email: '',
          password: '',
          confirmPassword: '',
          hidePassword: true,
          isSubmitting: false,
          isAuthenticated: false,
          emailError: false,
          passwordError: false,
          confirmPasswordError: false,
        ),
      );

  @visibleForTesting
  final AuthRepository authRepository;

  void updateFirstName(String firstName) {
    emit(state.copyWith(firstName: firstName, error: null));
  }

  void updateLastName(String lastName) {
    emit(state.copyWith(lastName: lastName, error: null));
  }

  void updateEmail(String email) {
    emit(state.copyWith(email: email, error: null));
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    emit(state.copyWith(emailError: !emailRegex.hasMatch(email)));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password, error: null));
    final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$');
    emit(state.copyWith(passwordError: !passwordRegex.hasMatch(password)));

    if (state.confirmPassword.isNotEmpty && password != state.confirmPassword) {
      emit(state.copyWith(confirmPasswordError: true));
    } else {
      emit(state.copyWith(confirmPasswordError: false));
    }
  }

  void updateConfirmPassword(String password) {
    emit(state.copyWith(confirmPassword: password, confirmPasswordError: password != state.password, error: null));
  }

  void updateInitialBalance(double amount) {
    emit(state.copyWith(initialBalance: amount));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(hidePassword: !state.hidePassword, error: null));
  }

  void previousStep() {
    emit(state.copyWith(step: 0));
  }

  void nextStep() {
    emit(state.copyWith(step: 1));
  }

  Future<void> register() async {
    emit(state.copyWith(isSubmitting: true, error: null));

    final result = await authRepository.register(
      RegisterRequest(
        firstName: state.firstName,
        lastName: state.lastName,
        balance: state.initialBalance,
        email: state.email,
        password: state.password,
      ),
    );

    switch (result) {
      case RegisterResult.success:
        emit(state.copyWith(isAuthenticated: true));
      default:
        emit(state.copyWith(error: result));
    }

    emit(state.copyWith(isSubmitting: false));
  }
}

@freezed
sealed class RegisterState with _$RegisterState {
  const factory RegisterState({
    required int step,
    required String firstName,
    required String lastName,
    required double initialBalance,
    required String email,
    required String password,
    required String confirmPassword,
    required bool hidePassword,
    required bool isSubmitting,
    required bool isAuthenticated,
    required bool emailError,
    required bool passwordError,
    required bool confirmPasswordError,
    RegisterResult? error,
  }) = _RegisterState;

  const RegisterState._();

  double get passwordStrength {
    double value = 0.0;
    if (password.length < 8) {
      return value;
    } else if (password.length >= 8) {
      value += 0.5;

      if (password.contains(RegExp(r'[A-Z]'))) {
        value += 0.15;
      }

      if (password.contains(RegExp(r'[a-z]'))) {
        value += 0.15;
      }

      if (password.contains(RegExp(r'[0-9]'))) {
        value += 0.1;
      }

      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        value += 0.1;
      }

      return value;
    }
    return value;
  }

  Color get passwordStrengthColor {
    if (passwordStrength <= 0.5) {
      return Colors.red;
    } else if (passwordStrength <= 0.8) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  bool get isFormValid =>
      firstName.isNotEmpty &&
      lastName.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      !emailError &&
      !passwordError &&
      !confirmPasswordError;

  bool get canSubmit => isFormValid && !isSubmitting;
}
