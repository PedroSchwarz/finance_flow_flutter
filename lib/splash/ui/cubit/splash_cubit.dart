import 'package:finance_flow/splash/data/repository/splash_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.splashRepository}) : super(const SplashState());

  @visibleForTesting
  final SplashRepository splashRepository;

  Future<void> load() async {
    await splashRepository.init();
    await Future.delayed(const Duration(seconds: 1));

    if (splashRepository.authRepository.currentUser.value == null) {
      emit(state.copyWith(navigation: SplashNavigation.login));
    } else {
      emit(state.copyWith(navigation: SplashNavigation.home));
    }
  }

  void resetNavigation() {
    emit(state.copyWith(navigation: null));
  }
}

@freezed
sealed class SplashState with _$SplashState {
  const factory SplashState({SplashNavigation? navigation}) = _SplashState;
}

enum SplashNavigation { login, home }
