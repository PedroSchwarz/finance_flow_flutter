import 'package:finance_flow/auth/data/repository/auth_repository.dart';

class SplashRepository {
  const SplashRepository({required this.authRepository});

  final AuthRepository authRepository;

  Future<void> init() async {
    await authRepository.init();
  }
}
