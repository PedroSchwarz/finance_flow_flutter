import 'package:finance_flow/auth/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required this.authRepository}) : super(const DashboardState(isLoading: false, isRefreshing: false));

  @visibleForTesting
  final AuthRepository authRepository;

  Future<void> signOut() async {
    await authRepository.signOut();
  }
}

@freezed
sealed class DashboardState with _$DashboardState {
  const factory DashboardState({required bool isLoading, required bool isRefreshing}) = _DashboardState;
}
